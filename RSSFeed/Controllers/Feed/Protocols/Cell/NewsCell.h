//
//  NewsCell.h
//  RSSFeed
//
//  Created by Александр Чегошев on 31/01/2019.
//  Copyright © 2019 Александр Чегошев. All rights reserved.
//

#import "Cell.h"

@class News;

NS_ASSUME_NONNULL_BEGIN

@interface NewsCell : Cell

@property (strong, nonatomic) News *news;

@end

NS_ASSUME_NONNULL_END
