//
//  ScreenFactory.h
//  RSSFeed
//
//  Created by Александр Чегошев on 31/01/2019.
//  Copyright © 2019 Александр Чегошев. All rights reserved.
//

#import <Foundation/Foundation.h>

@class News;

NS_ASSUME_NONNULL_BEGIN

@interface ScreenFactory : NSObject

+ (UIViewController *)feedViewController;
+ (UIViewController *)detailViewControllerWith:(News *)news;

@end

NS_ASSUME_NONNULL_END
