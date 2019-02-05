//
//  UINavigationController+extention.m
//  RSSFeed
//
//  Created by Александр Чегошев on 05/02/2019.
//  Copyright © 2019 Александр Чегошев. All rights reserved.
//

#import "UINavigationController+extention.h"
#import "UIColor+extention.h"

@implementation UINavigationController (extention)

- (void)grayBar {
    [self.navigationBar setBarTintColor:[UIColor navBarGrayColor]];
    [self.navigationBar setTintColor:[UIColor whiteColor]];
    [self.navigationBar setTranslucent:false];
}

- (void)blurBar {
    [self.navigationBar setBarTintColor:[UIColor clearBlackColor]];
    [self.navigationBar setTintColor:[UIColor whiteColor]];
    [self.navigationBar setTranslucent:true];
    UIBlurEffect *blur = [UIBlurEffect effectWithStyle:UIBlurEffectStyleDark];
    UIVisualEffectView *view = [[UIVisualEffectView alloc] initWithEffect:blur];
    view.frame = self.navigationBar.bounds;
    [self.navigationBar addSubview:view];
    [self.navigationBar sendSubviewToBack:view];
}

@end
