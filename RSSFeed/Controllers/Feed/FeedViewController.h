//
//  FeedViewController.h
//  RSSFeed
//
//  Created by Александр Чегошев on 31/01/2019.
//  Copyright © 2019 Александр Чегошев. All rights reserved.
//

#import <UIKit/UIKit.h>

@class ViewController;
@class News;

@interface FeedViewController : UIViewController

@property (weak, nonatomic) IBOutlet UITableView *tableView;

@property (strong, nonatomic) NSXMLParser *parser;

@property (strong, nonatomic) NSArray<News *> *newsArray;

@end
