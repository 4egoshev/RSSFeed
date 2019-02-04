//
//  ListViewController.h
//  RSSFeed
//
//  Created by Александр Чегошев on 02/02/2019.
//  Copyright © 2019 Александр Чегошев. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef enum : NSInteger {
    AddType,
    SourceType,
    SectionCount
} SectionType;

NS_ASSUME_NONNULL_BEGIN

@class ListViewController;
@class Source;

@protocol ListViewControllerDelegate

@required
- (void)updateSource;

@end

@interface ListViewController : UIViewController

@property (weak, nonatomic) IBOutlet UITableView *tableView;

@property (weak, nonatomic) id<ListViewControllerDelegate> delegate;

@property (strong, nonatomic) NSArray<Source*> *sourceArray;

@property (assign, nonatomic) BOOL isEditing;
@property (assign, nonatomic) BOOL isReadAll;
@property (assign, nonatomic) BOOL isSelectAll;
@property (assign, nonatomic) BOOL isAdd;

- (void)setupNavBar;

@end

NS_ASSUME_NONNULL_END
