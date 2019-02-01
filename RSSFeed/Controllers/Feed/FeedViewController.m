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

@interface FeedViewController () <XMLParseManagerDelegate>

@end

@implementation FeedViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self setupTableView];
    XMLParseManager *parser = [XMLParseManager manager];
    [parser setDelegate:self];
    [parser setupParser];
}

- (void)updateNews:(NSArray *)news {
    self.newsArray = news;
    [self.tableView reloadData];
}

@end
