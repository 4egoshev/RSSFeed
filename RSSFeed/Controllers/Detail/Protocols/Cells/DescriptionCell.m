//
//  DescriptionCell.m
//  RSSFeed
//
//  Created by Александр Чегошев on 01/02/2019.
//  Copyright © 2019 Александр Чегошев. All rights reserved.
//

#import "DescriptionCell.h"
#import "News.h"

@interface DescriptionCell () {
    __weak IBOutlet UILabel *descriptionLabel;
}

@end

@implementation DescriptionCell

- (void)awakeFromNib {
    [super awakeFromNib];
}

- (void)config {
    descriptionLabel.text = self.news.descript;
}

@end
