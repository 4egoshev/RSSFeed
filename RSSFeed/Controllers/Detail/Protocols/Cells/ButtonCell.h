//
//  ButtonCell.h
//  RSSFeed
//
//  Created by Александр Чегошев on 01/02/2019.
//  Copyright © 2019 Александр Чегошев. All rights reserved.
//

#import "Cell.h"

NS_ASSUME_NONNULL_BEGIN

@class ButtonCell;

@protocol ButtonCellDelegate

@required
- (void)openSafari;

@end

@interface ButtonCell : Cell

@property (weak, nonatomic) id<ButtonCellDelegate> delegate;

@end

NS_ASSUME_NONNULL_END
