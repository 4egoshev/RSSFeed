//
//  NSString+extention.m
//  RSSFeed
//
//  Created by Александр Чегошев on 03/02/2019.
//  Copyright © 2019 Александр Чегошев. All rights reserved.
//

#import "NSString+extention.h"

@implementation NSString (extention)

- (BOOL)isEmpty {
    if ([self isEqualToString:@""]) {
        return true;
    } else {
        return false;
    }
}

@end
