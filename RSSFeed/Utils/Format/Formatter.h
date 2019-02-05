//
//  Formatter.h
//  RSSFeed
//
//  Created by Александр Чегошев on 01/02/2019.
//  Copyright © 2019 Александр Чегошев. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface Formatter : NSObject

+ (NSDate *)dateFromString:(NSString *)string;

+ (NSString *)dateStringForFeed:(NSDate *)date;

+ (NSString *)dateStrngForHaeder:(NSDate *)date;

+ (NSString *)dateStrngForDetail:(NSString *)string;

@end

NS_ASSUME_NONNULL_END
