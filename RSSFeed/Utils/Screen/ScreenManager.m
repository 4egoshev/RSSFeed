//
//  ScreenManager.m
//  RSSFeed
//
//  Created by Александр Чегошев on 31/01/2019.
//  Copyright © 2019 Александр Чегошев. All rights reserved.
//

#import <UIKit/UIKit.h>

#import "ScreenManager.h"
#import "ScreenFactory.h"
#import "FeedViewController.h"

@implementation ScreenManager

#pragma mark - Getters
+ (UINavigationController *)rootNavigationController {
    UIWindow *window = [[UIApplication sharedApplication] keyWindow];
    UINavigationController *controller = (UINavigationController *)[window rootViewController];
    return controller;
}

+ (void)push:(UIViewController *)controller {
    [[self rootNavigationController] pushViewController:controller animated:true];
}

#pragma mark - Controllers

+ (void)configMainWindow:(UIWindow *)window {
    window.rootViewController = [[UINavigationController alloc] initWithRootViewController:[ScreenFactory feedViewController]];
}

+ (void)pushDetailViewContrller:(News *)news {
    [self push:[ScreenFactory detailViewControllerWith:news]];
}

@end
