//
//  News.h
//  RSSFeed
//
//  Created by Александр Чегошев on 01/02/2019.
//  Copyright © 2019 Александр Чегошев. All rights reserved.
//

#import "RLMObject.h"

NS_ASSUME_NONNULL_BEGIN

@interface News : RLMObject

@property NSString *sourceName;
@property NSString *title;
@property NSString *descript;
@property NSString *linkString;
@property NSString *dateString;

-(void) setValue:(NSString *)value forProperty:(NSString *)property from:(NSString *)sourse ;

@end

NS_ASSUME_NONNULL_END
