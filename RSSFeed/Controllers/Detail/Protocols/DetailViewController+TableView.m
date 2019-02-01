//
//  DetailViewController+TableView.m
//  RSSFeed
//
//  Created by Александр Чегошев on 01/02/2019.
//  Copyright © 2019 Александр Чегошев. All rights reserved.
//

#import "DetailViewController+TableView.h"
#import "UITableView+registerNib.h"

#import "TitleCell.h"
#import "DescriptionCell.h"
#import "DateCell.h"
#import "ButtonCell.h"
#import "News.h"

@implementation DetailViewController (TableView)

- (void)setupTableView {
    [self.tableView registerNibFromArrayClass:@[[TitleCell class],
                                                [DescriptionCell class],
                                                [DateCell class],
                                                [ButtonCell class]]];
    [self.tableView setSeparatorStyle:UITableViewCellSeparatorStyleNone];
}

@end

@interface DetailViewController (TableViewDataSource) <UITableViewDataSource>

typedef enum : NSInteger {
    TitleTipe,
    DescriptionType,
    DateType,
    ButtonType,
    CellCount
} CellType;

@end

@implementation DetailViewController (TableViewDataSource)

- (NSInteger)tableView:(nonnull UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return CellCount;
}

- (nonnull UITableViewCell *)tableView:(nonnull UITableView *)tableView cellForRowAtIndexPath:(nonnull NSIndexPath *)indexPath {
    NewsCell *cell;
    switch (indexPath.row) {
        case TitleTipe:
            cell = [tableView dequeueReusableCellWithClass:[TitleCell class] forIndexPath:indexPath];
            break;
        case DescriptionType:
            cell = [tableView dequeueReusableCellWithClass:[DescriptionCell class] forIndexPath:indexPath];
            break;
        case DateType:
            cell = [tableView dequeueReusableCellWithClass:[DateCell class] forIndexPath:indexPath];
            break;
        case ButtonType:
        {
            ButtonCell *buttonCell = [tableView dequeueReusableCellWithClass:[ButtonCell class] forIndexPath:indexPath];
            buttonCell.delegate = (id<ButtonCellDelegate>)self;
            [buttonCell config];
            return buttonCell;
        }
           // break;
        default:
            break;
    }
    cell.news = self.news;
    [cell config];
    return cell;
}

@end

@interface DetailViewController (TableViewDelegate) <UITableViewDelegate>
@end

@implementation DetailViewController (TableViewDelegate)

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return UITableViewAutomaticDimension;
}

- (CGFloat)tableView:(UITableView *)tableView estimatedHeightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return 44.0;
}

@end

@interface DetailViewController (ButtonCellDelegate) <ButtonCellDelegate>
@end

@implementation DetailViewController (ButtonCellDelegate)

- (void)openSafari {
    NSLog(@"open");
}

@end
