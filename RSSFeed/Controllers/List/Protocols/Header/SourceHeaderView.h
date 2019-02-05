//
//  SourceHeaderView.h
//  RSSFeed
//
//  Created by Александр Чегошев on 03/02/2019.
//  Copyright © 2019 Александр Чегошев. All rights reserved.
//

#import "View.h"

NS_ASSUME_NONNULL_BEGIN

@class SourceHeaderView;

@protocol SourceHeaderViewDelegate

@required
- (void)readAll;
- (void)selectAll;

@end

@interface SourceHeaderView : View

@property (weak, nonatomic) id<SourceHeaderViewDelegate> delegate;

@property (assign, nonatomic) BOOL isEditing;
@property (assign, nonatomic) BOOL isReadAll;
@property (assign, nonatomic) BOOL isSelectAll;

@end

NS_ASSUME_NONNULL_END
