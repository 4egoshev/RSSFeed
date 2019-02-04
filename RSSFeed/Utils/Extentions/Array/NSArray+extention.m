//
//  NSArray+extention.m
//  RSSFeed
//
//  Created by Александр Чегошев on 04/02/2019.
//  Copyright © 2019 Александр Чегошев. All rights reserved.
//

#import "NSArray+extention.h"

@implementation NSArray (extention)

- (BOOL)isEmpty {
    if (self.count == 0) {
        return true;
    } else {
        return false;
    }
}

@end
