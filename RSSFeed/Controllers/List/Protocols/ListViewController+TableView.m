//
//  ListViewController+TableView.m
//  RSSFeed
//
//  Created by Александр Чегошев on 02/02/2019.
//  Copyright © 2019 Александр Чегошев. All rights reserved.
//

#import "ListViewController+TableView.h"

@implementation ListViewController (TableView)

- (void)setupTableView {
    [self.tableView setSeparatorStyle:UITableViewCellSeparatorStyleNone];
}

@end

@interface ListViewController (TableViewDataSource) <UITableViewDataSource>
@end

@implementation ListViewController (TableViewDataSource)

- (NSInteger)tableView:(nonnull UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 10;
}

- (nonnull UITableViewCell *)tableView:(nonnull UITableView *)tableView cellForRowAtIndexPath:(nonnull NSIndexPath *)indexPath {
//    NewsCell *cell = [tableView dequeueReusableCellWithClass:[NewsCell class] forIndexPath:indexPath];
//    cell.news = self.newsArray[indexPath.section][indexPath.row];
//    [cell config];
    UITableViewCell *cell = [UITableViewCell new];
    return cell;
}

@end

@interface ListViewController (TableViewDelegate) <UITableViewDelegate>
@end

@implementation ListViewController (TableViewDelegate)

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
//    [tableView deselectRowAtIndexPath:indexPath animated:false];
//    [ScreenManager pushDetailViewContrller:self.newsArray[indexPath.section][indexPath.row]];
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return UITableViewAutomaticDimension;
}

- (CGFloat)tableView:(UITableView *)tableView estimatedHeightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return 44.0;
}

@end
