//
//  XMLParseManager.m
//  RSSFeed
//
//  Created by Александр Чегошев on 01/02/2019.
//  Copyright © 2019 Александр Чегошев. All rights reserved.
//

#import "XMLParseManager.h"

#import "News.h"

@interface XMLParseManager () <NSXMLParserDelegate> {
    NSXMLParser *parser;
    NSString* currentProperty;
    NSMutableString *currentValue;
    News *currentNews;
    NSMutableArray *newsArray;
}

@end

@implementation XMLParseManager

+ (instancetype)manager {
    static XMLParseManager *manager = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        manager = [XMLParseManager new];
    });
    return manager;
}

- (void)start {
    newsArray = [NSMutableArray new];
    NSURL *url = [NSURL URLWithString:@"https://lenta.ru/rss"];
    parser = [[NSXMLParser alloc] initWithContentsOfURL:url];
    [parser setDelegate:self];
    [parser parse];
}

- (void)parser:(NSXMLParser *)parser didStartElement:(NSString *)elementName namespaceURI:(NSString *)namespaceURI qualifiedName:(NSString *)qName attributes:(NSDictionary<NSString *,NSString *> *)attributeDict {
    if ([elementName isEqualToString:@"item"]) {
        currentNews = [News new];
    }
    if ([elementName isEqualToString:@"title"] ||
        [elementName isEqualToString:@"link"] ||
        [elementName isEqualToString:@"description"] ||
        [elementName isEqualToString:@"pubDate"]) {
        currentProperty = elementName;
    }
}

- (void)parser:(NSXMLParser *)parser foundCharacters:(NSString *)string {
    if (!currentValue) {
        currentValue = [NSMutableString new];
    }
    [currentValue appendString:string];
    NSString *trimmedString = [currentValue stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceAndNewlineCharacterSet]];
    [currentValue setString:trimmedString];
}

- (void)parser:(NSXMLParser *)parser didEndElement:(NSString *)elementName namespaceURI:(NSString *)namespaceURI qualifiedName:(NSString *)qName {
    if ([elementName isEqualToString:@"item"]) {
        [newsArray addObject:currentNews];
    }
    if ([elementName isEqualToString:currentProperty]) {
        [currentNews setValue:currentValue forProperty:currentProperty];
    }
    currentValue = nil;
}

- (void)parserDidEndDocument:(NSXMLParser *)parser {
    [self.delegate updateNews:newsArray];
}

@end
