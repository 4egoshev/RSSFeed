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
#import "UINavigationController+extention.h"
#import "UIView+loadFromNib.h"
#import "XMLParseManager.h"
#import "ScreenManager.h"
#import "Utils.h"
#import "RealmManager.h"
#import "StringKeys.h"
#import "LoadingView.h"
#import "ErrorView.h"

@interface FeedViewController () {
    
    BOOL isError;
}

@end

@implementation FeedViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [RealmManager createDefaultSource];
    [self setupNavBar];
    [self setupErrorView];
    [self setupTableView];
    [[NSOperationQueue mainQueue] addOperationWithBlock:^{
        [[XMLParseManager manager] parseSources:[RealmManager getReadSources] failure:^(NSString * error) {
            NSLog(@"1 = %@",error);
            [self showErrorView:error];
        }];
    }];
}

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    [self addObserver];
}

- (void)viewDidDisappear:(BOOL)animated {
    [super viewDidDisappear:animated];
    [self removeObserver];
}

- (void)setupNavBar {
    self.navigationItem.leftBarButtonItem = [[UIBarButtonItem alloc] initWithImage:[UIImage imageNamed:@"list"] style:UIBarButtonItemStylePlain target:self action:@selector(listAction:)];
    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemRefresh target:self action:@selector(reloadNews:)];
    [self.navigationController grayBar];
    self.navigationItem.titleView = [LoadingView loadFromNib];
}

- (void)setupErrorView {
    self.errorView = (ErrorView *)[ErrorView loadFromNib];
    self.errorView.delegate = (id<ErrorViewDelegate>)self;
    [self.errorView addToView:self.view];
}

- (void)updateNavBar {
    self.navigationItem.titleView = nil;
    self.navigationItem.title = @"Новости";
    [self.navigationController.navigationBar setTitleTextAttributes:
     @{NSForegroundColorAttributeName:[UIColor whiteColor],
       NSFontAttributeName:[UIFont systemFontOfSize:21.0]}];

}

- (void)updateNews {
    [self updateNavBar];
    NSArray *news = [RealmManager getNews];
    BOOL isEmpty = false;
    if (!self.dateArray) {
        isEmpty = true;
    }
    self.newsArray = [Utils sortNews:news];
    self.dateArray = [Utils createDates:news];
    [self.tableView beginUpdates];
    NSIndexSet *index = [NSIndexSet indexSetWithIndexesInRange:NSMakeRange(0, self.dateArray.count)];
    if (isEmpty) {
        [self.tableView insertSections:index withRowAnimation:UITableViewRowAnimationBottom];
    } else {
        [self.tableView reloadSections:index withRowAnimation:UITableViewRowAnimationBottom];
    }
    [self.tableView endUpdates];
}

- (void)showErrorView:(NSString *)error {
    [self updateNavBar];
    if (!isError) {
        isError = true;
        self.errorView.error = error;
        [self.errorView config];
        [UIView animateWithDuration:0.5 animations:^{
            [self.errorView setTransform:CGAffineTransformMakeTranslation(0, -self.errorView.frame.size.height)];
        }];
    }
}
- (void)hideErrorView {
    isError = false;
    [UIView animateWithDuration:0.5 animations:^{
        [self.errorView setTransform:CGAffineTransformMakeTranslation(0, self.errorView.frame.size.height)];
    }];
}

#pragma mark - Action

- (void)listAction:(id)sender {
    [ScreenManager showList];
}

- (void)reloadNews:(id)sender {
    [UIView animateWithDuration:0 animations:^{
        self.navigationItem.title = nil;
        self.navigationItem.titleView = [LoadingView loadFromNib];
    } completion:^(BOOL finished) {
        [[XMLParseManager manager] parseSources:[RealmManager getReadSources] failure:^(NSString * error) {
            [self showErrorView:error];
        }];
    }];
}

#pragma mark - Observer

- (void)addObserver {
    [[NSNotificationCenter defaultCenter] addObserver:self
                                             selector:@selector(updateNews)
                                                 name:[StringKeys kUpdateNewsNotification]
                                               object:nil];
}

- (void)removeObserver {
    [[NSNotificationCenter defaultCenter] removeObserver:self];
}

@end
