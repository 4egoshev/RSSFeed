//
//  TitleCell.m
//  RSSFeed
//
//  Created by Александр Чегошев on 01/02/2019.
//  Copyright © 2019 Александр Чегошев. All rights reserved.
//

#import "TitleCell.h"
#import "News.h"

@interface TitleCell () {
    __weak IBOutlet UILabel *titleLabel;
}

@end

@implementation TitleCell

- (void)awakeFromNib {
    [super awakeFromNib];
}

- (void)config {
    titleLabel.text = self.news.title;
}

@end
