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
#import "DetailViewController.h"
#import "News.h"

@implementation ScreenFactory

+ (UIViewController *)feedViewController {
    FeedViewController *controller = [FeedViewController new];
    return controller;
}

+ (UIViewController *)detailViewControllerWith:(News *)news {
    DetailViewController *controller = [DetailViewController new];
    controller.news = news;
    return controller;
}

@end
