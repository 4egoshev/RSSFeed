//
//  NewsCell.m
//  RSSFeed
//
//  Created by Александр Чегошев on 31/01/2019.
//  Copyright © 2019 Александр Чегошев. All rights reserved.
//

#import "NewsCell.h"
#import "News.h"
#import "Formatter.h"

@interface NewsCell () {

    __weak IBOutlet UILabel *titleLabel;
    __weak IBOutlet UILabel *descriptionLabel;
    __weak IBOutlet UILabel *dateLabel;
}

@end

@implementation NewsCell

- (void)awakeFromNib {
    [super awakeFromNib];
}

- (void)config {
    titleLabel.text = _news.title;
    descriptionLabel.text = _news.descript;
    dateLabel.text = [Formatter dateStringForFeed:_news.date];
}

-(void)prepareForReuse{
    [super prepareForReuse];
    titleLabel = nil;
    descriptionLabel = nil;
    dateLabel = nil;
}

@end
