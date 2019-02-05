//
//  ErrorView.h
//  RSSFeed
//
//  Created by Александр Чегошев on 05/02/2019.
//  Copyright © 2019 Александр Чегошев. All rights reserved.
//

#import "View.h"

NS_ASSUME_NONNULL_BEGIN

@class ErrorView;

@protocol ErrorViewDelegate

@required
- (void)repeat;

@end

@interface ErrorView : View

@property (weak, nonatomic) id<ErrorViewDelegate> delegate;

@property (strong, nonatomic) NSString *error;

@end

NS_ASSUME_NONNULL_END
