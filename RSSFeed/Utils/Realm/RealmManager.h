//
//  RealmManager.h
//  RSSFeed
//
//  Created by Александр Чегошев on 03/02/2019.
//  Copyright © 2019 Александр Чегошев. All rights reserved.
//

#import <Foundation/Foundation.h>

@class Source;

NS_ASSUME_NONNULL_BEGIN

@interface RealmManager : NSObject

+ (void)createDefaultSource;

+ (NSArray *)getSources;

+ (void)deleteSources;

+ (void)saveSource:(Source *)source;

+ (void)updateReadFor:(NSInteger)sourceId;

+ (BOOL)updateReadAll:(BOOL)isRead;

+ (void)updateSelectFor:(NSInteger)sourceId;

+ (BOOL)updateSelectAll:(BOOL)isSelect;

+ (void)unselectAll;

@end

NS_ASSUME_NONNULL_END
