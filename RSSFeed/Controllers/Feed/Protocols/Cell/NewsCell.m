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

    __weak IBOutlet UILabel *sourceNameLabel;
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
    sourceNameLabel.text = _news.sourceName;
    titleLabel.text = _news.title;
    descriptionLabel.text = _news.descript;
    dateLabel.text = [Formatter dateStringForFeed:[Formatter dateFromString:_news.dateString]];
}

-(void)prepareForReuse{
    [super prepareForReuse];
    
    sourceNameLabel.text = nil;
    titleLabel.text = nil;
    descriptionLabel.text = nil;
    dateLabel.text = nil;
}

@end
