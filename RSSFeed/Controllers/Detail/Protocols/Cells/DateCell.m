//
//  DateCell.m
//  RSSFeed
//
//  Created by Александр Чегошев on 01/02/2019.
//  Copyright © 2019 Александр Чегошев. All rights reserved.
//

#import "DateCell.h"
#import "News.h"
#import "Formatter.h"

@interface DateCell () {
    __weak IBOutlet UILabel *dateLabel;
}

@end

@implementation DateCell

- (void)awakeFromNib {
    [super awakeFromNib];
}

- (void)config {
    dateLabel.text = [Formatter dateString:self.news.date];
}

@end
