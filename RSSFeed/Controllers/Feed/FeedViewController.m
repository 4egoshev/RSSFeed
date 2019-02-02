//
//  FeedViewController.m
//  RSSFeed
//
//  Created by Александр Чегошев on 31/01/2019.
//  Copyright © 2019 Александр Чегошев. All rights reserved.
//

#import "FeedViewController.h"
#import "FeedViewController+TableView.h"
#import "UIViewController+LGSideMenuController.h"
#import "XMLParseManager.h"
#import "ScreenManager.h"

#import "Utils.h"

@interface FeedViewController () <XMLParseManagerDelegate>

@end

@implementation FeedViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self setupNavBar];
    [self setupTableView];
    [self setupParser];
}

- (void)setupNavBar {
    self.navigationItem.leftBarButtonItem = [[UIBarButtonItem alloc] initWithImage:[UIImage imageNamed:@"list"] style:UIBarButtonItemStylePlain target:self action:@selector(listAction:)];
}

- (void)setupParser {
    XMLParseManager *parser = [XMLParseManager manager];
    [parser setDelegate:self];
    [parser start];
}

- (void)updateNews:(NSArray *)news {
    self.newsArray = [Utils sortNews:news];
    self.dateArray = [Utils createDates:news];
    [self.tableView reloadData];
}

- (void)listAction:(id)sender {
    [ScreenManager showList];
}

@end
