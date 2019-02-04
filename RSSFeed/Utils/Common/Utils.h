//
//  Utils.h
//  RSSFeed
//
//  Created by Александр Чегошев on 01/02/2019.
//  Copyright © 2019 Александр Чегошев. All rights reserved.
//

#import <Foundation/Foundation.h>
@class News;

NS_ASSUME_NONNULL_BEGIN

@interface Utils : NSObject

+ (NSInteger)getSourceId;

+ (NSArray *)sortNews:(NSArray<News*> *)news;

+ (NSArray *)createDates:(NSArray<News*> *)news;

+ (BOOL)isToday:(NSDate *)date;

@end

NS_ASSUME_NONNULL_END
