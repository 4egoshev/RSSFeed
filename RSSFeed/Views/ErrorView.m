//
//  ErrorView.m
//  RSSFeed
//
//  Created by Александр Чегошев on 05/02/2019.
//  Copyright © 2019 Александр Чегошев. All rights reserved.
//

#import "ErrorView.h"
#import "UIView+loadFromNib.h"

@interface ErrorView () {
    
    __weak IBOutlet UILabel *titleLabel;
    __weak IBOutlet UIButton *repeatButton;
}

@end

@implementation ErrorView

- (void)addToView:(UIView *)view {
    self.translatesAutoresizingMaskIntoConstraints = false;
    [view addSubview:self];
    [[self.leftAnchor constraintEqualToAnchor:view.leftAnchor] setActive:true];
    [[self.rightAnchor constraintEqualToAnchor:view.rightAnchor] setActive:true];
    [[self.topAnchor constraintEqualToAnchor:view.bottomAnchor] setActive:true];
    [[self.heightAnchor constraintLessThanOrEqualToConstant:140] setActive:true];
}

- (void)config {
    NSLog(@"2 = %@",_error);
    titleLabel.text = _error;
    [repeatButton addTarget:self action:@selector(repeatAction:) forControlEvents:UIControlEventTouchUpInside];
}

- (void)repeatAction:(id)sender {
    [_delegate repeat];
}

@end
