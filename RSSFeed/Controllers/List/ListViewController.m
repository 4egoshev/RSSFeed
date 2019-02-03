//
//  ListViewController.m
//  RSSFeed
//
//  Created by Александр Чегошев on 02/02/2019.
//  Copyright © 2019 Александр Чегошев. All rights reserved.
//

#import "ListViewController.h"
#import "ListViewController+TableView.h"
#import "RealmManager.h"

@interface ListViewController () {
    UITapGestureRecognizer *tap;
}

@end

@implementation ListViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self setupNavBar];
    [self setupTableView];
}

- (void)setupNavBar {
    self.navigationItem.leftBarButtonItem = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemEdit target:self action:@selector(editAction:)];
    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemAdd target:self action:@selector(addAction:)];
    self.isEditing = false;
    self.isAdd = false;
}

#pragma mark - Action

- (void)editAction:(id)sender {
    self.isEditing = true;
    self.navigationItem.leftBarButtonItem = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemDone target:self action:@selector(doneAction:)];
    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemTrash target:self action:@selector(deletAction:)];
    [self.tableView reloadData];
}

- (void)doneAction:(id)sender {
    self.isEditing = false;
    self.navigationItem.leftBarButtonItem = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemEdit target:self action:@selector(editAction:)];
    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemAdd target:self action:@selector(addAction:)];
    [RealmManager unselectAll];
    [self.tableView reloadData];
}

- (void)addAction:(id)sender {
    if (!self.isAdd) {
        self.isAdd = true;
        self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemCancel target:self action:@selector(addAction:)];
        [self.tableView reloadSections:[NSIndexSet indexSetWithIndex:AddType] withRowAnimation:UITableViewRowAnimationBottom];
        [self.navigationItem.leftBarButtonItem setEnabled:false];
    } else {
        self.isAdd = false;
        self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemAdd target:self action:@selector(addAction:)];
        [self.tableView reloadSections:[NSIndexSet indexSetWithIndex:AddType] withRowAnimation:UITableViewRowAnimationTop];
        [self.navigationItem.leftBarButtonItem setEnabled:true];
    }
}

- (void)deletAction:(id)sender {
    
}

- (void)dismissKeyboard {
    [self.view endEditing:true];
//    [self.tableView removeGestureRecognizer:tap];
}

//- (void)addTapGesture {
//    tap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(dismissKeyboard)];
//    [self.tableView addGestureRecognizer:tap];
//}

@end
