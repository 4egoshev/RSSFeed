//
//  Formatter.m
//  RSSFeed
//
//  Created by Александр Чегошев on 01/02/2019.
//  Copyright © 2019 Александр Чегошев. All rights reserved.
//

#import "Formatter.h"

@implementation Formatter

+ (NSDate *)dateFromString:(NSString *)string {
    NSDateFormatter *dateFormat = [[NSDateFormatter alloc] init];
    dateFormat.locale = [NSLocale localeWithLocaleIdentifier:@"en_EN"];
    NSDate *date = [NSDate date];
    [dateFormat setDateFormat:@"EE, d LLLL yyyy HH:mm:ss Z"];
    date = [dateFormat dateFromString:string];
    if (!date) {
        [dateFormat setDateFormat:@"dd MMM yyyy HH:mm:ss Z"];
        date = [dateFormat dateFromString:string];
    }
    return [dateFormat dateFromString:string];
}

+ (NSString *)dateStringForFeed:(NSDate *)date {
    NSDateFormatter *formatter = [[NSDateFormatter alloc] init];
    [formatter setDateFormat:@"HH:mm"];
    return [formatter stringFromDate:date];
}

+ (NSString *)dateStrngForHaeder:(NSDate *)date {
    NSDateFormatter *formatter = [[NSDateFormatter alloc] init];
    [formatter setDateFormat:@"EEEE, d MMMM"];
    return [formatter stringFromDate:date];
}

+ (NSString *)dateStrngForDetail:(NSString *)string {
    NSDate *date = [self dateFromString:string];
    NSDateFormatter *formatter = [[NSDateFormatter alloc] init];
    [formatter setDateFormat:@"dd MMMM yyyy"];
    return [formatter stringFromDate:date];
}

@end
