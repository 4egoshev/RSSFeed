//
//  FeedViewController+TableView.m
//  RSSFeed
//
//  Created by Александр Чегошев on 31/01/2019.
//  Copyright © 2019 Александр Чегошев. All rights reserved.
//

#import "FeedViewController+TableView.h"
#import "UITableView+registerNib.h"

#import "ScreenManager.h"
#import "NewsCell.h"
#import "News.h"


@implementation FeedViewController (TableView)

- (void)setupTableView {
    [self.tableView registerNibFromClass:[NewsCell class]];
    [self.tableView setSeparatorStyle:UITableViewCellSeparatorStyleNone];
}

@end


@interface FeedViewController (TableViewDataSource) <UITableViewDataSource>
@end

@implementation FeedViewController (TableViewDataSource)

- (NSInteger)tableView:(nonnull UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.newsArray.count;
}

- (nonnull UITableViewCell *)tableView:(nonnull UITableView *)tableView cellForRowAtIndexPath:(nonnull NSIndexPath *)indexPath {
    NewsCell *cell = [tableView dequeueReusableCellWithClass:[NewsCell class] forIndexPath:indexPath];
    cell.news = self.newsArray[indexPath.row];
    [cell config];
    return cell;
}

@end

@interface FeedViewController (TableViewDelegate) <UITableViewDelegate>
@end

@implementation FeedViewController (TableViewDelegate)

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return UITableViewAutomaticDimension;
}

- (CGFloat)tableView:(UITableView *)tableView estimatedHeightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return 44.0;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    [tableView deselectRowAtIndexPath:indexPath animated:true];
    [ScreenManager pushDetailViewContrller:self.newsArray[indexPath.row]];
}

@end
