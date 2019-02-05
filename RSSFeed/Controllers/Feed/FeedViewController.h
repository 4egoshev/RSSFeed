//
//  FeedViewController.h
//  RSSFeed
//
//  Created by Александр Чегошев on 31/01/2019.
//  Copyright © 2019 Александр Чегошев. All rights reserved.
//

#import <UIKit/UIKit.h>

@class MainViewController;
@class ErrorView;
@class News;

@interface FeedViewController : UIViewController

@property (weak, nonatomic) IBOutlet UITableView *tableView;

@property (weak, nonatomic) ErrorView *errorView;

@property (strong, nonatomic) NSXMLParser *parser;

@property (strong, nonatomic) NSArray *dateArray;
@property (strong, nonatomic) NSArray<NSArray<News*>*> *newsArray;

- (void)showErrorView:(NSString *)error;

- (void)hideErrorView;

@end
