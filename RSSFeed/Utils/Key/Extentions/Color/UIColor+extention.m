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

+ (UIColor *)red:(NSInteger)red green:(NSInteger)green blue:(NSInteger)blue alpha:(CGFloat)alpha {
    return [self colorWithRed:red/255.0 green:green/255.0 blue:blue/255.0 alpha:alpha];
}

+ (UIColor *)navBarGrayColor {
    return [self red:72 green:78 blue:90];
}

+ (UIColor *)redLineColor {
    return [self red:204 green:33 blue:41];
}

+ (UIColor *)clearBlackColor {
    return [self red:0 green:0 blue:0 alpha:0.7];
}

+ (UIColor *)yellowCheckColor {
    return [self red:224 green:208 blue:141];
}

+ (UIColor *)grayCheckColor {
     return [self red:179 green:180 blue:185];
}

@end
