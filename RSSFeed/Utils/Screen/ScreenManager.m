//
//  ScreenManager.m
//  RSSFeed
//
//  Created by Александр Чегошев on 31/01/2019.
//  Copyright © 2019 Александр Чегошев. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "UIViewController+LGSideMenuController.h"

#import "ScreenManager.h"
#import "ScreenFactory.h"
#import "FeedViewController.h"
#import "LGSideMenuController.h"

@implementation ScreenManager

+ (void)configMainWindow:(UIWindow *)window {
    window.rootViewController = (LGSideMenuController *)[ScreenFactory mainViewController];
}

#pragma mark - Getters
+ (UINavigationController *)rootNavigationController {
    UIWindow *window = [[UIApplication sharedApplication] keyWindow];
    LGSideMenuController *mainController = (LGSideMenuController *)[window rootViewController];
    UINavigationController *navController = (UINavigationController *)mainController.rootViewController;
    return navController;
}

+ (void)push:(UIViewController *)controller {
    [[self rootNavigationController] pushViewController:controller animated:true];
}

#pragma mark - Controllers

+ (void)pushDetailViewContrller:(News *)news {
    [self push:[ScreenFactory detailViewControllerWith:news]];
}

+ (void)showList {
    FeedViewController *controller = [self rootNavigationController].viewControllers.firstObject;
    [controller.sideMenuController showLeftViewAnimated:YES completionHandler:nil];
}

@end
