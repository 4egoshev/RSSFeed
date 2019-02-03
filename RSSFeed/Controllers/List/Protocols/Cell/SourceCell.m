//
//  SourceCell.m
//  RSSFeed
//
//  Created by Александр Чегошев on 03/02/2019.
//  Copyright © 2019 Александр Чегошев. All rights reserved.
//

#import "SourceCell.h"
#import "Source.h"

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
        } else {
            selectCheckmarkView.image = [UIImage imageNamed:@"unselected"];
        }
    } else {
        [selectCheckmarkView setHidden:true];
        [readCheckmarkView setHidden:false];
        if (_source.isRead) {
            readCheckmarkView.image = [UIImage imageNamed:@"checked"];
        } else {
            readCheckmarkView.image = [UIImage imageNamed:@"unchecked"];
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
