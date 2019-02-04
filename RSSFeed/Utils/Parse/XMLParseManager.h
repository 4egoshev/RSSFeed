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

@interface XMLParseManager : NSObject

+ (instancetype)manager;

- (void)parseSources:(NSArray *)sources;

@end

NS_ASSUME_NONNULL_END
