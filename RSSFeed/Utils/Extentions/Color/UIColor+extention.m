//
//  UIColor+extention.m
//  RSSFeed
//
//  Created by Александр Чегошев on 05/02/2019.
//  Copyright © 2019 Александр Чегошев. All rights reserved.
//

#import "UIColor+extention.h"

@implementation UIColor (extention)

+ (UIColor *)red:(NSInteger)red green:(NSInteger)green blue:(NSInteger)blue {
    return [self colorWithRed:red/255.0 green:green/255.0 blue:blue/255.0 alpha:1.0];
}

+ (UIColor *)navBarGrayColor {
    return [self red:72 green:78 blue:90];
}

+ (UIColor *)redLineColore {
    return [self red:204 green:33 blue:41];
}

@end
