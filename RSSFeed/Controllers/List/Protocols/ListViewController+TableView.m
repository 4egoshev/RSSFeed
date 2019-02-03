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
#import "AddSourseCell.h"
#import "Source.h"
#import "RealmManager.h"

@implementation ListViewController (TableView)

- (void)setupTableView {
    [self.tableView registerNibFromArrayClass:@[[SourceCell class],
                                                [AddSourseCell class]]];
    [self.tableView setSeparatorStyle:UITableViewCellSeparatorStyleNone];
    self.sourceArray = [RealmManager getSources];
    self.isReadAll = false;
    self.isSelectAll = false;
}

@end

@interface ListViewController (TableViewDataSource) <UITableViewDataSource>

@end

@implementation ListViewController (TableViewDataSource)

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return SectionCount;
}

- (NSInteger)tableView:(nonnull UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    switch (section) {
        case AddType:
            if (self.isAdd) {
                return 1;
            } else {
                return 0;
            }
        case SourceType:
            return self.sourceArray.count;
        default:
            return 0;
    }
}

- (nonnull UITableViewCell *)tableView:(nonnull UITableView *)tableView cellForRowAtIndexPath:(nonnull NSIndexPath *)indexPath {
    switch (indexPath.section) {
        case AddType:
        {
            AddSourseCell *cell = [tableView dequeueReusableCellWithClass:[AddSourseCell class] forIndexPath:indexPath];
            cell.delegate = (id<AddSourseCellDelegate>)self;
            [cell config];
            return cell;
        }
        case SourceType:
        {
            SourceCell *cell = [tableView dequeueReusableCellWithClass:[SourceCell class] forIndexPath:indexPath];
            cell.source = self.sourceArray[indexPath.row];
            cell.isEditing = self.isEditing;
            [cell config];
            return cell;
        }
        default:
            return [UITableViewCell new];
    }
}

@end

@interface ListViewController (TableViewDelegate) <UITableViewDelegate>
@end

@implementation ListViewController (TableViewDelegate)

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    if (!self.isAdd) {
        if (self.isEditing) {
            [RealmManager updateSelectFor:self.sourceArray[indexPath.row].sourceId];
        } else {
            [RealmManager updateReadFor:self.sourceArray[indexPath.row].sourceId];
            self.sourceArray = [RealmManager getSources];
        }
        [tableView reloadData];
    }
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
    switch (section) {
        case SourceType:
            if (!self.isAdd) {
                return 44.0;
            } else {
                return 0;
            }
        default:
            return 0;
    }
}

- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section {
    switch (section) {
        case SourceType:
        {
            if (!self.isAdd) {
                SourceHeaderView *view = (SourceHeaderView *)[SourceHeaderView loadFromNib];
                view.delegate = (id<SourceHeaderViewDelegate>)self;
                view.isEditing = self.isEditing;
                [view config];
                return view;
            } else {
                return nil;
            }
        }
        default:
            return nil;
    }
}

@end

@interface ListViewController (SourceHeaderViewDelegate) <SourceHeaderViewDelegate>
@end

@implementation ListViewController (SourceHeaderViewDelegate)

- (void)readAll {
    self.isReadAll = [RealmManager updateReadAll:self.isReadAll];
    self.sourceArray = [RealmManager getSources];
    [self.tableView reloadData];
}

- (void)selectAll {
    self.isSelectAll = [RealmManager updateSelectAll:self.isSelectAll];
    self.sourceArray = [RealmManager getSources];
    [self.tableView reloadData];
}

@end

@interface ListViewController (LGSideMenuDelegate) <LGSideMenuDelegate>
@end

@implementation ListViewController (LGSideMenuDelegate)

- (void)didHideLeftView:(UIView *)leftView sideMenuController:(LGSideMenuController *)sideMenuController {
    [RealmManager unselectAll];
    [self setupNavBar];
    self.sourceArray = [RealmManager getSources];
    [self.tableView reloadData];
}

@end

@interface ListViewController (AddSourseCellDelegate) <AddSourseCellDelegate>
@end

@implementation ListViewController (AddSourseCellDelegate)

- (void)addSource:(Source *)source {
    self.isAdd = false;
    [self.view endEditing:true];
    [RealmManager saveSource:source];;
    [UIView animateWithDuration:0 animations:^{
        [self setupNavBar];
        self.sourceArray = [RealmManager getSources];
    } completion:^(BOOL finished) {
        [self.tableView reloadSections:[NSIndexSet indexSetWithIndex:SourceType] withRowAnimation:UITableViewRowAnimationNone];
    }];
    [self.tableView reloadData];
}

@end
