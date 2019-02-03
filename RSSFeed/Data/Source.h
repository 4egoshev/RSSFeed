//
//  Source.h
//  RSSFeed
//
//  Created by Александр Чегошев on 03/02/2019.
//  Copyright © 2019 Александр Чегошев. All rights reserved.
//

#import "RLMObject.h"

NS_ASSUME_NONNULL_BEGIN

@interface Source : RLMObject

@property NSInteger sourceId;
@property NSString *name;
@property NSString *urlString;
@property BOOL isRead;
@property BOOL isSelect;

@end

NS_ASSUME_NONNULL_END
