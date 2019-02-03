//
//  AddSourseCell.h
//  RSSFeed
//
//  Created by Александр Чегошев on 03/02/2019.
//  Copyright © 2019 Александр Чегошев. All rights reserved.
//

#import "Cell.h"

NS_ASSUME_NONNULL_BEGIN

@class AddSourseCell;
@class Source;

@protocol AddSourseCellDelegate

@required
- (void)addSource:(Source *)source;

@end

@interface AddSourseCell : Cell

@property (weak, nonatomic) id<AddSourseCellDelegate> delegate;

@end

NS_ASSUME_NONNULL_END
