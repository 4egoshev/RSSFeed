//
//  News.m
//  RSSFeed
//
//  Created by Александр Чегошев on 01/02/2019.
//  Copyright © 2019 Александр Чегошев. All rights reserved.
//

#import "News.h"
#import "StringKeys.h"

@implementation News

-(void) setValue:(NSString *)value forProperty:(NSString *)property from:(NSString *)sourse {
    _sourceName = sourse;
    if ([property isEqualToString:@"title"]) {
        _title = value;
    }
    if ([property isEqualToString:@"link"]) {
        _linkString = value;
    }
    if ([property isEqualToString:@"description"]) {
        _descript = value;
    }
    if ([property isEqualToString:@"pubDate"]) {
        _dateString = value;
    }
}

@end
