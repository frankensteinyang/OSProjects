//
//  MHAEditViewController.m
//  MyHomepageApp
//
//  Created by Hannibal Yang on 12/2/14.
//  Copyright (c) 2014 Hannibal Yang. All rights reserved.
//

#import "MHAEditViewController.h"
#import "MHAEditedInfo.h"

@interface MHAEditViewController () <UIAlertViewDelegate>

@end

@implementation MHAEditViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"编辑个人信息";
    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemSave target:self action:@selector(save)];
    _nicknameField.text = _editedInfo.nickname;
    _phoneField.text = [NSString stringWithFormat:@"%d", _editedInfo.phoneNumber];
    if ([_phoneField.text isEqualToString:@"0"]) {
        _phoneField.text = nil;
    }
    _introduction.text = _editedInfo.introduction;
    
    self.navigationItem.leftBarButtonItem = [[UIBarButtonItem alloc] initWithTitle:@"返回" style:UIBarButtonItemStylePlain target:self action:@selector(toEnsureSaved)];
    self.navigationItem.backBarButtonItem = self.navigationItem.leftBarButtonItem;
}

- (void)toEnsureSaved {
    
    UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"友情提示" message:@"信息未保存，确定要返回吗？" delegate:self cancelButtonTitle:@"返回" otherButtonTitles:@"继续编辑", nil];
    [alert show];
}

- (void)save {
    
    if ([_delegate respondsToSelector:@selector(editViewController:didSaveEditedInfo:)]) {
        [_delegate editViewController:self didSaveEditedInfo:[MHAEditedInfo editedInfoWithName:_nicknameField.text phone:[_phoneField.text intValue] introduction:_introduction.text]];
        [self.navigationController popViewControllerAnimated:YES];
    }
}

- (void)alertView:(UIAlertView *)alertView clickedButtonAtIndex:(NSInteger)buttonIndex {
    
    if (buttonIndex) return;
    [self.navigationController popViewControllerAnimated:YES];
}

@end
