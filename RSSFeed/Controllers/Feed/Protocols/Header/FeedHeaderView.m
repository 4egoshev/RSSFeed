//
//  FeedHeaderView.m
//  RSSFeed
//
//  Created by Александр Чегошев on 02/02/2019.
//  Copyright © 2019 Александр Чегошев. All rights reserved.
//

#import "FeedHeaderView.h"
#import "UIView+loadFromNib.h"
#import "Formatter.h"
#import "Utils.h"

@interface FeedHeaderView () {
    __weak IBOutlet UILabel *dayLabel;
}

@end

@implementation FeedHeaderView

- (void)config {
    if ([Utils isToday:_date]) {
        dayLabel.text = @"Сегодня";
    } else {
        dayLabel.text = [Formatter dateStrngForHaeder:_date];
    }
}

@end
