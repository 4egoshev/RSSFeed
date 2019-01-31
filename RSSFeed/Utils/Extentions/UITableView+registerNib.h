//
//  UITableView+registerNib.h
//  RSSFeed
//
//  Created by Александр Чегошев on 31/01/2019.
//  Copyright © 2019 Александр Чегошев. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface UITableView (registerNib)

- (void)registerNibFromClass:(Class)className;

- (nonnull __kindof UITableViewCell *)dequeueReusableCellWithClass:(nonnull Class)className
                                                      forIndexPath:(nonnull NSIndexPath *)indexPath;

@end

NS_ASSUME_NONNULL_END
