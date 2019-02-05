//
//  SourceCell.m
//  RSSFeed
//
//  Created by Александр Чегошев on 03/02/2019.
//  Copyright © 2019 Александр Чегошев. All rights reserved.
//

#import "SourceCell.h"
#import "Source.h"
#import "UIColor+extention.h"

@interface SourceCell () {
    
    __weak IBOutlet UILabel *titleLabel;
    __weak IBOutlet UIImageView *readCheckmarkView;
    __weak IBOutlet UIImageView *selectCheckmarkView;
    __weak IBOutlet NSLayoutConstraint *leftConstraint;
}

@end


@implementation SourceCell

- (void)awakeFromNib {
    [super awakeFromNib];
    _isEditing = false;
}

- (void)config {
    titleLabel.text = _source.name;
    if (_isEditing) {
        [selectCheckmarkView setHidden:false];
        [readCheckmarkView setHidden:true];
        if (_source.isSelect) {
            selectCheckmarkView.image = [UIImage imageNamed:@"selected"];
            selectCheckmarkView.tintColor = [UIColor redLineColor];
        } else {
            selectCheckmarkView.image = [UIImage imageNamed:@"unselected"];
            selectCheckmarkView.tintColor = [UIColor grayCheckColor];
        }
    } else {
        [selectCheckmarkView setHidden:true];
        [readCheckmarkView setHidden:false];
        if (_source.isRead) {
            readCheckmarkView.image = [UIImage imageNamed:@"checked"];
            readCheckmarkView.tintColor = [UIColor yellowCheckColor];
        } else {
            readCheckmarkView.image = [UIImage imageNamed:@"unchecked"];
            readCheckmarkView.tintColor = [UIColor grayCheckColor];
        }
    }
    [self updateConstraint];
}

- (void)updateConstraint {
    if (_isEditing) {
        leftConstraint.constant = 16;
    } else {
        leftConstraint.constant = 48;
    }
}

@end
