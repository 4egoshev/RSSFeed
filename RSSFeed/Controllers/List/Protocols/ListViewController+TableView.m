//
//  ListViewController+TableView.m
//  RSSFeed
//
//  Created by Александр Чегошев on 02/02/2019.
//  Copyright © 2019 Александр Чегошев. All rights reserved.
//

#import <Realm/Realm.h>
#import <LGSideMenuController/LGSideMenuController.h>

#import "ListViewController+TableView.h"
#import "UITableView+registerNib.h"
#import "UIView+loadFromNib.h"
#import "SourceHeaderView.h"
#import "SourceCell.h"
#import "Source.h"
#import "RealmManager.h"

@implementation ListViewController (TableView)

- (void)setupTableView {
    [self.tableView registerNibFromClass:[SourceCell class]];
    [self.tableView setSeparatorStyle:UITableViewCellSeparatorStyleNone];
    [self getDate];
    self.isReadAll = false;
    self.isSelectAll = false;
}

- (void)getDate {
    RLMResults *result = [Source allObjects];
    NSMutableArray *array = [NSMutableArray new];
    for (Source *source in result) {
        [array addObject:source];
    }
    self.sourceArray = array;
}

@end

@interface ListViewController (TableViewDataSource) <UITableViewDataSource>

typedef enum : NSInteger {
    ReadType,
    UnreadType,
    HeaderCount
} HeaderType;

@end

@implementation ListViewController (TableViewDataSource)

- (NSInteger)tableView:(nonnull UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.sourceArray.count;
}

- (nonnull UITableViewCell *)tableView:(nonnull UITableView *)tableView cellForRowAtIndexPath:(nonnull NSIndexPath *)indexPath {
    SourceCell *cell = [tableView dequeueReusableCellWithClass:[SourceCell class] forIndexPath:indexPath];
    cell.source = self.sourceArray[indexPath.row];
    cell.isEditing = self.isEditing;
    [cell config];
    return cell;
}

@end

@interface ListViewController (TableViewDelegate) <UITableViewDelegate>
@end

@implementation ListViewController (TableViewDelegate)

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    if (self.isEditing) {
        [RealmManager updateSelectFor:self.sourceArray[indexPath.row].sourceId];
    } else {
        [RealmManager updateReadFor:self.sourceArray[indexPath.row].sourceId];
        [self getDate];
    }
    [tableView reloadData];
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return UITableViewAutomaticDimension;
}

- (CGFloat)tableView:(UITableView *)tableView estimatedHeightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return 44.0;
}

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section {
    return UITableViewAutomaticDimension;
}

- (CGFloat)tableView:(UITableView *)tableView estimatedHeightForHeaderInSection:(NSInteger)section {
    return 44.0;
}

- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section {
    SourceHeaderView *view = (SourceHeaderView *)[SourceHeaderView loadFromNib];
    view.delegate = (id<SourceHeaderViewDelegate>)self;
    view.isEditing = self.isEditing;
    [view config];
    return view;
}

@end

@interface ListViewController (SourceHeaderViewDelegate) <SourceHeaderViewDelegate>
@end

@implementation ListViewController (SourceHeaderViewDelegate)

- (void)readAll {
    self.isReadAll = [RealmManager updateReadAll:self.isReadAll];
    [self getDate];
    [self.tableView reloadData];
}

- (void)selectAll {
    self.isSelectAll = [RealmManager updateSelectAll:self.isSelectAll];
    [self getDate];
    [self.tableView reloadData];
}

@end

@interface ListViewController (LGSideMenuDelegate) <LGSideMenuDelegate>
@end

@implementation ListViewController (LGSideMenuDelegate)

- (void)didHideLeftView:(UIView *)leftView sideMenuController:(LGSideMenuController *)sideMenuController {
    [RealmManager unselectAll];
    [self setupNavBar];
    [self getDate];
    [self.tableView reloadData];
}

@end
