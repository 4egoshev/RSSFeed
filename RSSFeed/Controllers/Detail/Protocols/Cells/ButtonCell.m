//
//  ButtonCell.m
//  RSSFeed
//
//  Created by Александр Чегошев on 01/02/2019.
//  Copyright © 2019 Александр Чегошев. All rights reserved.
//

#import "ButtonCell.h"

@interface ButtonCell () {
    __weak IBOutlet UIButton *button;
}

@end

@implementation ButtonCell

- (void)awakeFromNib {
    [super awakeFromNib];
}

- (void)config {
    [button addTarget:self action:@selector(buttonAction:) forControlEvents:UIControlEventTouchUpInside];
}

- (void)buttonAction:(id)sender {
    [_delegate openSafari];
}

@end
