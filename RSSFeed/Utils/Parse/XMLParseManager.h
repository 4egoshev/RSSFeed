//
//  XMLParseManager.h
//  RSSFeed
//
//  Created by Александр Чегошев on 01/02/2019.
//  Copyright © 2019 Александр Чегошев. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@class News;

@protocol XMLParseManagerDelegate

@required
- (void)updateNews:(NSArray<News *> *)news;

@end

@interface XMLParseManager : NSObject

@property (weak, nonatomic) id<XMLParseManagerDelegate> delegate;

+ (instancetype)manager;

- (void)setupParser;

@end

NS_ASSUME_NONNULL_END
