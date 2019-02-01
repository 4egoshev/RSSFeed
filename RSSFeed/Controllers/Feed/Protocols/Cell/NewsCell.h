//
//  NewsCell.h
//  RSSFeed
//
//  Created by Александр Чегошев on 31/01/2019.
//  Copyright © 2019 Александр Чегошев. All rights reserved.
//

#import <UIKit/UIKit.h>

@class News;

NS_ASSUME_NONNULL_BEGIN

@interface NewsCell : UITableViewCell

@property (strong, nonatomic) News *news;

- (void)config;

@end

NS_ASSUME_NONNULL_END
