//
//  UITableView+registerNib.m
//  RSSFeed
//
//  Created by Александр Чегошев on 31/01/2019.
//  Copyright © 2019 Александр Чегошев. All rights reserved.
//

#import "UITableView+registerNib.h"

@implementation UITableView (registerNib)

- (void)registerNibFromClass:(Class)className {
    if([className isSubclassOfClass:[UITableViewCell class]]) {
        [self registerNib:[UINib nibWithNibName:NSStringFromClass(className) bundle:nil] forCellReuseIdentifier:NSStringFromClass(className)];
    }
}

- (void)registerNibFromArrayClass:(NSArray<Class> *)array {
    for (Class class in array) {
        [self registerNibFromClass:class];
    }
}

- (nonnull __kindof UITableViewCell *)dequeueReusableCellWithClass:(nonnull Class)className
                                                      forIndexPath:(nonnull NSIndexPath *)indexPath {
    return [self dequeueReusableCellWithIdentifier:NSStringFromClass(className)
                                      forIndexPath:indexPath];
}

@end
