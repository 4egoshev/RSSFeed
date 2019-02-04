//
//  ListNavigationViewController.m
//  RSSFeed
//
//  Created by Александр Чегошев on 02/02/2019.
//  Copyright © 2019 Александр Чегошев. All rights reserved.
//

#import "ListNavigationViewController.h"

@interface ListNavigationViewController ()

@end

@implementation ListNavigationViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self.navigationBar setBackgroundImage:[UIImage new] forBarMetrics:UIBarMetricsDefault];
    self.navigationBar.shadowImage = [UIImage new];
    self.navigationBar.translucent = true;
}

- (BOOL)prefersStatusBarHidden {
    return true;
}

- (UIViewController *)childViewControllerForStatusBarHidden {
    return self.childViewControllers.firstObject;
}

@end
