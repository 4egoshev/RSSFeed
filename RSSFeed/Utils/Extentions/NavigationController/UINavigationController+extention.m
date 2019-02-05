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
    [self.navigationBar setTranslucent:NO];
}

@end
