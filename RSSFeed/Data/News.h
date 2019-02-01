//
//  News.h
//  RSSFeed
//
//  Created by Александр Чегошев on 01/02/2019.
//  Copyright © 2019 Александр Чегошев. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface News : NSObject

@property (strong, nonatomic) NSString *title;
@property (strong, nonatomic) NSString *descript;
@property (strong, nonatomic) NSURL *link;
@property (strong, nonatomic) NSDate *date;

-(void) setValue:(NSString*)value forProperty:(NSString*)property;

@end

NS_ASSUME_NONNULL_END
