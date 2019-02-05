//
//  FeedHeaderView.m
//  RSSFeed
//
//  Created by Александр Чегошев on 02/02/2019.
//  Copyright © 2019 Александр Чегошев. All rights reserved.
//

#import "FeedHeaderView.h"
#import "UIView+loadFromNib.h"
#import "UIColor+extention.h"
#import "Formatter.h"
#import "Utils.h"

@implementation FeedHeaderView

- (void)config {
    CATextLayer* text = [CATextLayer new];
    text.font = CFBridgingRetain([UIFont systemFontOfSize:21.0]);
    text.fontSize=25;
    text.frame = CGRectMake(16,8,self.frame.size.width-60,self.frame.size.height-16);
    
    CGFloat width = 0;
    if ([Utils isToday:_date]) {
        text.string = @"Сегодня";
        width = self.frame.size.width-230;
    } else {
        text.string = [Formatter dateStrngForHaeder:_date];
        width = self.frame.size.width-60;
    }
    
     CGMutablePathRef path = CGPathCreateMutable();
     CGPathMoveToPoint(path,NULL,0.0,2.0);
     CGPathAddLineToPoint(path, NULL, width, 2.0);
     CGPathAddLineToPoint(path, NULL, width+20, self.frame.size.height);
     CGPathAddLineToPoint(path, NULL, 0.0, self.frame.size.height);
     CGPathAddLineToPoint(path, NULL, 0.0, 0.0);
     
     CAShapeLayer *shapeLayer = [CAShapeLayer layer];
     [shapeLayer setPath:path];
     [shapeLayer setFillColor:[[UIColor redLineColore] CGColor]];
     [shapeLayer setBounds:CGRectMake(0.0, 0.0, self.frame.size.width, self.frame.size.height)];
     [shapeLayer setAnchorPoint:CGPointMake(0.0, 0.0)];
     [shapeLayer setPosition:CGPointMake(0.0, 0.0)];
     [[self layer] addSublayer:shapeLayer];
     
//     CATextLayer* text = [CATextLayer new];
//     if ([Utils isToday:_date]) {
//         text.string = @"Сегодня";
//     } else {
//         text.string = [Formatter dateStrngForHaeder:_date];
//     }
//     text.font = CFBridgingRetain([UIFont systemFontOfSize:21.0]);
//     text.fontSize=25;
//     text.frame = CGRectMake(16,8,self.frame.size.width-60,self.frame.size.height-16);
     [shapeLayer addSublayer:text];
}

@end
