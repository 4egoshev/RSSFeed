//
//  ListViewController.h
//  RSSFeed
//
//  Created by Александр Чегошев on 02/02/2019.
//  Copyright © 2019 Александр Чегошев. All rights reserved.
//

#import <UIKit/UIKit.h>

@class Source;

NS_ASSUME_NONNULL_BEGIN

@interface ListViewController : UIViewController

@property (weak, nonatomic) IBOutlet UITableView *tableView;
@property (strong, nonatomic) NSArray<Source*> *sourceArray;

@property (assign, nonatomic) BOOL isEditing;
@property (assign, nonatomic) BOOL isReadAll;
@property (assign, nonatomic) BOOL isSelectAll;

- (void)setupNavBar;

@end

NS_ASSUME_NONNULL_END
