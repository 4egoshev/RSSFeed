//
//  FeedViewController.m
//  RSSFeed
//
//  Created by Александр Чегошев on 31/01/2019.
//  Copyright © 2019 Александр Чегошев. All rights reserved.
//

#import "FeedViewController.h"
#import "FeedViewController+TableView.h"
#import "XMLParseManager.h"

#import "Utils.h"

@interface FeedViewController () <XMLParseManagerDelegate>

@end

@implementation FeedViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self setupTableView];
    [self setupParser];
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

@end
