//
//  UIView+loadFromNib.m
//  RSSFeed
//
//  Created by Александр Чегошев on 02/02/2019.
//  Copyright © 2019 Александр Чегошев. All rights reserved.
//

#import "UIView+loadFromNib.h"

@implementation UIView (loadFromNib)

+ (UIView *)loadFromNib {
    return [[NSBundle mainBundle] loadNibNamed:NSStringFromClass([self class]) owner:self options:nil].firstObject;
}

- (void)config {
}

@end
