//
//  News.m
//  RSSFeed
//
//  Created by Александр Чегошев on 01/02/2019.
//  Copyright © 2019 Александр Чегошев. All rights reserved.
//

#import "News.h"

@implementation News

-(void) setValue:(NSString *)value forProperty:(NSString *)property {
    if ([property isEqualToString:@"title"]) {
        _title=value;
    }
    if ([property isEqualToString:@"link"]) {
        _link=[NSURL URLWithString:value];
    }
    if ([property isEqualToString:@"description"]) {
        _descript=value;
    }
    if ([property isEqualToString:@"pubDate"]) {
        NSDateFormatter *dateFormat = [[NSDateFormatter alloc] init];
        [dateFormat setDateFormat:@"EE, d LLLL yyyy HH:mm:ss Z"];
        _date = [dateFormat dateFromString:value];
    }
}

@end
