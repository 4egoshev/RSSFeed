//
//  AddSourseCell.m
//  RSSFeed
//
//  Created by Александр Чегошев on 03/02/2019.
//  Copyright © 2019 Александр Чегошев. All rights reserved.
//

#import "AddSourseCell.h"
#import "Source.h"
#import "NSString+extention.h"
#import "UITextField+extention.h"
#import "StringKeys.h"

@interface AddSourseCell () {
    
    __weak IBOutlet UITextField *nameField;
    __weak IBOutlet UITextField *urlField;
    __weak IBOutlet UIButton *addButton;
    
    Source *source;
}

@end

@implementation AddSourseCell

- (void)awakeFromNib {
    [super awakeFromNib];
    nameField.delegate = (id<UITextFieldDelegate>)self;
    urlField.delegate = (id<UITextFieldDelegate>)self;
}

- (void)config {
    source = [Source new];
    source.isRead = true;
    nameField.text = @"";
    urlField.text = @"";
    nameField.returnKeyType = UIReturnKeyNext;
    [addButton addTarget:self action:@selector(addAction:) forControlEvents:UIControlEventTouchUpInside];
}

- (void)addAction:(id)sender {
    [_delegate addSource:source];
}

@end

@interface AddSourseCell (TextFieldDelegate) <UITextFieldDelegate>
@end

@implementation AddSourseCell (TextFieldDelegate)

- (void)textFieldDidEndEditing:(UITextField *)textField {
    if ([textField isEqual:nameField]) {
        source.name = textField.text;
    }
    if ([textField isEqual:urlField]) {
        source.urlString = textField.text;
    }
}

- (BOOL)textFieldShouldReturn:(UITextField *)textField {
    if ([textField isEqual:nameField]) {
        [urlField becomeFirstResponder];
    }
    if ([textField isEqual:urlField]) {
        if ([nameField.text isEmpty]) {
            [nameField redPlaceholder];
            [nameField becomeFirstResponder];
        } else if ([urlField.text isEmpty]) {
            [urlField redPlaceholder];
            if ([nameField.text isEmpty]) {
                [nameField redPlaceholder];
                [nameField becomeFirstResponder];
            } else {
                [urlField becomeFirstResponder];
            }
        } else {
            NSInteger sourceId = [[NSUserDefaults standardUserDefaults] integerForKey:[StringKeys sourceIdKey]];
            sourceId++;
            [[NSUserDefaults standardUserDefaults] setInteger:sourceId forKey:[StringKeys sourceIdKey]];
            source.sourceId = sourceId;
            [_delegate addSource:source];
        }
    }
    return false;
}

@end
