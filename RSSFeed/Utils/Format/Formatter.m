//
//  Formatter.m
//  RSSFeed
//
//  Created by Александр Чегошев on 01/02/2019.
//  Copyright © 2019 Александр Чегошев. All rights reserved.
//

#import "Formatter.h"

@implementation Formatter

+ (NSString *)dateString:(NSDate *)date {
    NSDateFormatter *formatter = [[NSDateFormatter alloc] init];
    [formatter setDateFormat:@"d MMM yyyy"];
    return [formatter stringFromDate:date];
}

@end
