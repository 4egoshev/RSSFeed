//
//  ButtonCell.h
//  RSSFeed
//
//  Created by Александр Чегошев on 01/02/2019.
//  Copyright © 2019 Александр Чегошев. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN


@class ButtonCell;

@protocol ButtonCellDelegate

@required
- (void)openSafari;

@end

@interface ButtonCell : UITableViewCell

@property (weak, nonatomic) id<ButtonCellDelegate> delegate;

- (void)config;

@end

NS_ASSUME_NONNULL_END
