//
//  FeedViewController+TableView.m
//  RSSFeed
//
//  Created by Александр Чегошев on 31/01/2019.
//  Copyright © 2019 Александр Чегошев. All rights reserved.
//

#import "FeedViewController+TableView.h"
#import "UITableView+registerNib.h"

#import "NewsCell.h"


@implementation FeedViewController (TableView)

- (void)setupTableView {
    [self.tableView registerNibFromClass:[NewsCell class]];
}

@end


@interface FeedViewController (TableViewDataSource) <UITableViewDataSource>
@end

@implementation FeedViewController (TableViewDataSource)

- (NSInteger)tableView:(nonnull UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 100;
}

- (nonnull UITableViewCell *)tableView:(nonnull UITableView *)tableView cellForRowAtIndexPath:(nonnull NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithClass:[NewsCell class] forIndexPath:indexPath];
    //cell.backgroundColor = [UIColor redColor];
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

@end
