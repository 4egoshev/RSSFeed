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
    NSInteger sourceId = [[NSUserDefaults standardUserDefaults] integerForKey:[StringKeys kSourceId]];
    sourceId++;
    [[NSUserDefaults standardUserDefaults] setInteger:sourceId forKey:[StringKeys kSourceId]];
    return sourceId;
}

+ (NSArray *)sortNews:(NSArray<News*> *)news {
    NSMutableArray<News*> *tempNewsArray = [NSMutableArray arrayWithArray:news];
    NSMutableArray *newsArray = [NSMutableArray new];
    NSMutableArray *dates = [NSMutableArray new];
    for (News *item in news) {
        [dates addObject:[Formatter dateFromString:item.dateString]];
    }
    NSArray *datesArray = [dates sortedArrayUsingSelector: @selector(compare:)];
    dates = [NSMutableArray arrayWithArray:datesArray];
    // создаем двумерный массив новостей
    NSArray *dayArray = [self daysArray:dates];
    for (NSDate *date in dayArray) {
        NSMutableArray *subNewsArray = [NSMutableArray new];
        for (int j=0; j<dates.count; j++) {
            BOOL isEqualDates = [[NSCalendar currentCalendar] isDate:[Formatter dateFromString:tempNewsArray[j].dateString]
                                                         equalToDate:date
                                                   toUnitGranularity:NSCalendarUnitDay];
            if (isEqualDates) {
                [subNewsArray addObject:tempNewsArray[j]];
                [tempNewsArray removeObject:tempNewsArray[j]];
                [dates removeObject:dates[j]];
            }
        }
        NSArray *resultArray = [subNewsArray sortedArrayUsingComparator:^NSComparisonResult(News *first, News *second) {
            NSDate *firstDate = [Formatter dateFromString:first.dateString];
            NSDate *secondDate = [Formatter dateFromString:second.dateString];

            NSComparisonResult result =  [secondDate compare:firstDate];
            return  result;
        }];
        [newsArray addObject:resultArray];
    }
    return newsArray;
}

+ (NSArray *)createDates:(NSArray<News*> *)news {
    NSMutableArray *dateArray = [NSMutableArray new];
    NSMutableArray *dateStringArray = [NSMutableArray new];
    for (News *item in news) {
        NSString *dateSting = [Formatter dateStrngForHaeder:[Formatter dateFromString:item.dateString]];
        if (![dateStringArray containsObject:dateSting]) {
            [dateStringArray addObject:dateSting];
            [dateArray addObject:[Formatter dateFromString:item.dateString]];
        }
    }
    NSArray *resultArray = [dateArray sortedArrayUsingComparator:^NSComparisonResult(NSDate *first, NSDate *second) {
        NSComparisonResult result =  [second compare:first];
        return  result;
    }];
    return resultArray;
}

#pragma mark - Compare

+ (BOOL)isToday:(NSDate *)date {
    BOOL isEqualDates = [[NSCalendar currentCalendar] isDate:date
                                                 equalToDate:[NSDate date]
                                           toUnitGranularity:NSCalendarUnitDay];
    return isEqualDates;
}

#pragma mark - Adition

+ (NSArray *)daysArray:(NSArray *)date {
    NSMutableArray *array = [NSMutableArray new];
    if (date.count != 0) {
        NSDate *day = date.lastObject;
        [array addObject:day];
        for (int i=1; i<date.count; i++) {
            BOOL isEqualDates = [[NSCalendar currentCalendar] isDate:date[i]
                                                         equalToDate:date[i-1]
                                                   toUnitGranularity:NSCalendarUnitDay];
            if (!isEqualDates) {
                [array addObject:date[i-1]];
            }
        }
    }
    return array;
}

@end
