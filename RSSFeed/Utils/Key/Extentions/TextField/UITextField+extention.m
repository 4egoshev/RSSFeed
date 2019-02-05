//
//  UITextField+extention.m
//  RSSFeed
//
//  Created by Александр Чегошев on 03/02/2019.
//  Copyright © 2019 Александр Чегошев. All rights reserved.
//

#import "UITextField+extention.h"

@implementation UITextField (extention)

- (void)redPlaceholder {
    UIColor *color = [UIColor colorWithRed:212.0f/255.0f green:63.0f/255.0f blue:57.0f/255.0f alpha:1.0];
    self.attributedPlaceholder = [[NSAttributedString alloc] initWithString:self.placeholder attributes:@{NSForegroundColorAttributeName: color}];
}

@end
