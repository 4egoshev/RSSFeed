//
//  Utils.m
//  RSSFeed
//
//  Created by Александр Чегошев on 01/02/2019.
//  Copyright © 2019 Александр Чегошев. All rights reserved.
//

#import "Utils.h"
#import "Formatter.h"
#import "News.h"
#import "StringKeys.h"

@implementation Utils

+ (NSInteger)getSourceId {
    NSInteger sourceId = [[NSUserDefaults standardUserDefaults] integerForKey:[StringKeys sourceIdKey]];
    sourceId++;
    [[NSUserDefaults standardUserDefaults] setInteger:sourceId forKey:[StringKeys sourceIdKey]];
    return sourceId;
}

+ (NSArray *)sortNews:(NSArray<News*> *)news {
    NSMutableArray *newsArray = [NSMutableArray new];
    NSMutableArray *dates = [NSMutableArray new];
    for (News *item in news) {
        [dates addObject:item.date];
    }
    
    NSInteger count = [self daysCount:dates];
    
    for (int i=0; i<count; i++) {
        NSMutableArray *subNewsArray = [NSMutableArray new];
        for (int i=1; i<dates.count; i++) {
            BOOL isEqualDates = [[NSCalendar currentCalendar] isDate:news[i].date
                                                         equalToDate:news[i-1].date
                                                   toUnitGranularity:NSCalendarUnitDay];
            if (isEqualDates) {
                [subNewsArray addObject:news[i]];
                [dates removeObject:dates[i]];
            }
        }
        [newsArray addObject:subNewsArray];
    }
    return newsArray;
}

+ (NSArray *)createDates:(NSArray<News*> *)news {
    NSMutableArray *dateArray = [NSMutableArray new];
    NSMutableArray *dateStringArray = [NSMutableArray new];
    for (News *item in news) {
        NSString *dateSting = [Formatter dateStrngForHaeder:item.date];
        if (![dateStringArray containsObject:dateSting]) {
            [dateStringArray addObject:dateSting];
            [dateArray addObject:item.date];
        }
    }
    return dateArray;
}

#pragma mark - Compare

+ (BOOL)isToday:(NSDate *)date {
    BOOL isEqualDates = [[NSCalendar currentCalendar] isDate:date
                                                 equalToDate:[NSDate date]
                                           toUnitGranularity:NSCalendarUnitDay];
    return isEqualDates;
}

#pragma mark - Adition

+ (NSArray *)sortDates:(NSArray<NSDate*> *)dates {
    NSMutableArray *dateArray = [NSMutableArray arrayWithArray:dates];
    BOOL isNotSorted = true;
    while (isNotSorted) {
        isNotSorted = false;
        for (int i=0; i<dateArray.count-1; i++) {
            if ([dateArray[i] compare:dateArray[i+1]] != NSOrderedDescending) {
                NSDate *tempDate = dateArray[i];
                dateArray[i] = dateArray[i+1];
                dateArray[i+1] = tempDate;
                isNotSorted = true;
            }
        }
    }
    return dateArray;
}

+ (NSInteger)daysCount:(NSArray *)date {
    NSInteger count = 0;
    if (date.count != 0) {
        count = 1;
        for (int i=1; i<date.count; i++) {
            BOOL isEqualDates = [[NSCalendar currentCalendar] isDate:date[i]
                                                         equalToDate:date[i-1]
                                                   toUnitGranularity:NSCalendarUnitDay];
            if (!isEqualDates) {
                count++;
            }
        }
    }
    return count;
}

@end
