//
//  XMLParseManager.m
//  RSSFeed
//
//  Created by Александр Чегошев on 01/02/2019.
//  Copyright © 2019 Александр Чегошев. All rights reserved.
//

#import "XMLParseManager.h"
#import "RealmManager.h"
#import "News.h"
#import "Source.h"
#import "StringKeys.h"

@interface XMLParseManager () <NSXMLParserDelegate> {
    NSXMLParser *parser;
    NSString* currentProperty;
    NSMutableString *currentValue;
    News *currentNews;
    NSMutableArray *newsArray;
    BOOL isTitle;
    NSString *sourceName;
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

- (void)parseSources:(NSArray *)sources failure:(void (^ _Nullable )(NSString *))failure {
    newsArray = [NSMutableArray new];
    for (Source *source in sources) {
        isTitle = false;
        NSURL *url = [NSURL URLWithString:source.urlString];
        parser = [[NSXMLParser alloc] initWithContentsOfURL:url];
        [parser setDelegate:self];
        BOOL parse = [parser parse];
        if (!parse) {
            NSLog(@"error = %@",parser.parserError.localizedDescription);
            failure(parser.parserError.localizedDescription);
        }
    }
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
    if (!isTitle && [elementName isEqualToString:@"title"]) {
        currentProperty = [StringKeys sourceName];
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
    if (!isTitle && [currentProperty isEqualToString:[StringKeys sourceName]]) {
        isTitle = true;
        sourceName = currentValue;
        [RealmManager deleteNewsFrom:sourceName];
    }
    if ([elementName isEqualToString:currentProperty]) {
        [currentNews setValue:currentValue forProperty:currentProperty from:sourceName];
    }
    currentValue = nil;
}

- (void)parserDidEndDocument:(NSXMLParser *)parser {
    [RealmManager saveNews:newsArray];
    [[NSNotificationCenter defaultCenter] postNotificationName:[StringKeys kUpdateNewsNotification] object:nil];
}

@end
