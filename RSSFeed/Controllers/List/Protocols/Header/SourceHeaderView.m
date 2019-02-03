//
//  SourceHeaderView.m
//  RSSFeed
//
//  Created by Александр Чегошев on 03/02/2019.
//  Copyright © 2019 Александр Чегошев. All rights reserved.
//

#import "SourceHeaderView.h"
#import "UIView+loadFromNib.h"

@interface SourceHeaderView () {
    
    __weak IBOutlet UIButton *readAllButton;
    __weak IBOutlet UIButton *selectAllButton;
}

@end

@implementation SourceHeaderView

- (void)config {
    if (_isEditing) {
        [readAllButton setHidden:true];
        [selectAllButton setHidden:false];
    } else {
        [selectAllButton setHidden:true];
        [readAllButton setHidden:false];
    }
    [readAllButton addTarget:self action:@selector(readAllAction:) forControlEvents:UIControlEventTouchUpInside];
    [selectAllButton addTarget:self action:@selector(selectAllAction:) forControlEvents:UIControlEventTouchUpInside];
    
}

- (void)readAllAction:(id)sender {
    [_delegate readAll];
}

- (void)selectAllAction:(id)sender {
    [_delegate selectAll];
}

@end
