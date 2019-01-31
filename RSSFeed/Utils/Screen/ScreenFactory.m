//
//  ScreenFactory.m
//  RSSFeed
//
//  Created by Александр Чегошев on 31/01/2019.
//  Copyright © 2019 Александр Чегошев. All rights reserved.
//

#import <UIKit/UIKit.h>

#import "ScreenFactory.h"
#import "FeedViewController.h"

@implementation ScreenFactory

+ (UIViewController *)feedViewController {
    return [FeedViewController new];
}

@end
