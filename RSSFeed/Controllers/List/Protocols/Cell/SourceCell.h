//
//  SourceCell.h
//  RSSFeed
//
//  Created by Александр Чегошев on 03/02/2019.
//  Copyright © 2019 Александр Чегошев. All rights reserved.
//

#import "Cell.h"

@class Source;

NS_ASSUME_NONNULL_BEGIN

@interface SourceCell : Cell

@property (strong, nonatomic) Source *source;
@property (assign, nonatomic) BOOL isEditing;

@end

NS_ASSUME_NONNULL_END
