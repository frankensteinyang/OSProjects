//
//  MHAEditViewController.m
//  MyHomepageApp
//
//  Created by Hannibal Yang on 12/2/14.
//  Copyright (c) 2014 Hannibal Yang. All rights reserved.
//

#import "MHAEditViewController.h"

@interface MHAEditViewController ()

@end

@implementation MHAEditViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"编辑个人信息";
    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemSave target:self action:@selector(save)];
}

- (void)save {
    
    if ([_delegate respondsToSelector:@selector(editViewController:didSaveWithName:phoneNumber:intro:)]) {
        [_delegate editViewController:self didSaveWithName:_nicknameField.text phoneNumber:_phoneField.text intro:_introduction.text];
        [self.navigationController popViewControllerAnimated:YES];
    }
}

@end
