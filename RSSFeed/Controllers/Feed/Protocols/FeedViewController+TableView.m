//
//  FeedViewController+TableView.m
//  RSSFeed
//
//  Created by Александр Чегошев on 31/01/2019.
//  Copyright © 2019 Александр Чегошев. All rights reserved.
//

#import "FeedViewController+TableView.h"
#import "UITableView+registerNib.h"
#import "UIView+loadFromNib.h"
#import "NSArray+extention.h"
#import "ListViewController.h"
#import "XMLParseManager.h"
#import "ScreenManager.h"
#import "RealmManager.h"
#import "NewsCell.h"
#import "FeedHeaderView.h"
#import "News.h"
#import "Utils.h"
#import "LoadingView.h"
#import "ErrorView.h"


@implementation FeedViewController (TableView)

- (void)setupTableView {
    [self.tableView registerNibFromClass:[NewsCell class]];
    [self.tableView setSeparatorStyle:UITableViewCellSeparatorStyleNone];
    NSArray *news = [RealmManager getNews];
    if (!news.isEmpty) {
        self.newsArray = [Utils sortNews:news];
        self.dateArray = [Utils createDates:news];
    }
}

@end


@interface FeedViewController (TableViewDataSource) <UITableViewDataSource>
@end

@implementation FeedViewController (TableViewDataSource)

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return self.newsArray.count;
}

- (NSInteger)tableView:(nonnull UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.newsArray[section].count;
}

- (nonnull UITableViewCell *)tableView:(nonnull UITableView *)tableView cellForRowAtIndexPath:(nonnull NSIndexPath *)indexPath {
    NewsCell *cell = [tableView dequeueReusableCellWithClass:[NewsCell class] forIndexPath:indexPath];
    cell.news = self.newsArray[indexPath.section][indexPath.row];
    [cell config];
    return cell;
}

@end

@interface FeedViewController (TableViewDelegate) <UITableViewDelegate>
@end

@implementation FeedViewController (TableViewDelegate)

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    [tableView deselectRowAtIndexPath:indexPath animated:false];
    [ScreenManager pushDetailViewContrller:self.newsArray[indexPath.section][indexPath.row]];
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
    FeedHeaderView *view = (FeedHeaderView *)[FeedHeaderView loadFromNib];
    view.date = self.dateArray[section];
    [view config];
    return view;
}

@end

@interface FeedViewController (ListViewControllerDelegate) <ListViewControllerDelegate>
@end

@implementation FeedViewController (ListViewControllerDelegate)

- (void)updateSource {
    NSArray *array = [RealmManager getReadSources];
    if (!array.isEmpty) {
        [UIView animateWithDuration:0 animations:^{
            self.navigationItem.titleView = [LoadingView loadFromNib];
        } completion:^(BOOL finished) {
            [[XMLParseManager manager] parseSources:[RealmManager getReadSources] failure:^(NSString * error) {
                [self showErrorView:error];
            }];
        }];
    } else {
        [RealmManager deleteNews];
        self.newsArray = nil;
        self.dateArray = nil;
        [self.tableView reloadData];
    }
}

@end

@interface FeedViewController (ErrorViewDelegate) <ErrorViewDelegate>
@end

@implementation FeedViewController (ErrorViewDelegate)

- (void)repeat {
    [UIView animateWithDuration:0 animations:^{
        self.navigationItem.titleView = [LoadingView loadFromNib];
        [self hideErrorView];
    } completion:^(BOOL finished) {
        [[XMLParseManager manager] parseSources:[RealmManager getReadSources] failure:^(NSString * error) {
            [self showErrorView:error];
        }];
    }];
}

@end
