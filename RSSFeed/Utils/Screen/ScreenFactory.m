//
//  ScreenFactory.m
//  RSSFeed
//
//  Created by Александр Чегошев on 31/01/2019.
//  Copyright © 2019 Александр Чегошев. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <LGSideMenuController/LGSideMenuController.h>
#import <LGSideMenuController/UIViewController+LGSideMenuController.h>

#import "ScreenFactory.h"
#import "FeedViewController.h"
#import "ListNavigationViewController.h"
#import "ListViewController.h"
#import "DetailViewController.h"
#import "News.h"

@implementation ScreenFactory

+ (UINavigationController *)wrapToNavigationController:(UIViewController *)controller {
    UINavigationController *navController = [[UINavigationController alloc] initWithRootViewController:controller];
    navController.modalPresentationCapturesStatusBarAppearance = true;
    return navController;
}

+ (UINavigationController *)wrapListToNavigationController:(UIViewController *)controller {
    ListNavigationViewController *navController = [[ListNavigationViewController alloc] initWithRootViewController:controller];
    return navController;
}

#pragma mark - Controllers

+ (LGSideMenuController *)mainViewController {
    LGSideMenuController *mainController = [[LGSideMenuController alloc] initWithRootViewController:[self feedViewController]];
    FeedViewController *feedController = (FeedViewController *)[self feedViewController];
    ListViewController *listontroller = (ListViewController *)[self listViewControllerWithDelegate:(id<ListViewControllerDelegate>)feedController];
    mainController.delegate = (id<LGSideMenuDelegate>)listontroller;
    mainController.rootViewController = [self wrapListToNavigationController:feedController];
    mainController.leftViewController = [self wrapListToNavigationController:listontroller];
    mainController.leftViewWidth = mainController.view.bounds.size.width * 0.80;
    mainController.leftViewPresentationStyle = LGSideMenuPresentationStyleSlideAbove;
    mainController.leftViewBackgroundColor = [UIColor colorWithRed:0.5 green:0.65 blue:0.5 alpha:1.0];
    mainController.rootViewCoverColorForLeftView = [UIColor colorWithRed:0.0 green:1.0 blue:0.0 alpha:0.05];
    return mainController;
}

+ (UIViewController *)feedViewController {
    FeedViewController *controller = [FeedViewController new];
    return controller;
}

+ (UIViewController *)listViewControllerWithDelegate:(id<ListViewControllerDelegate>)delegate {
    ListViewController *controller = [ListViewController new];
    controller.delegate = delegate;
    return controller;
}

+ (UIViewController *)detailViewControllerWith:(News *)news {
    DetailViewController *controller = [DetailViewController new];
    controller.news = news;
    return controller;
}

@end
