//
//  MHAEditViewController.m
//  UsingStoryboard
//
//  Created by Hannibal Yang on 12/4/14.
//  Copyright (c) 2014 Hannibal Yang. All rights reserved.
//

#import "MHAEditViewController.h"
#import "MHAInformation.h"

@interface MHAEditViewController () <UIAlertViewDelegate>

@end

@implementation MHAEditViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.navigationItem.leftBarButtonItem = [[UIBarButtonItem alloc] initWithTitle:@"退出编辑" style:UIBarButtonItemStylePlain target:self action:@selector(toEnsureSaved)];
    _nicknameField.text = _temporaryName;
}

- (IBAction)save {
    
    if ([_delegate respondsToSelector:@selector(editViewController:didSaveInfo:)]) {
        [_delegate editViewController:self didSaveInfo:[MHAInformation informationWithName:_nicknameField.text]];
        [self.navigationController popViewControllerAnimated:YES];
    }
}

- (void)toEnsureSaved {
    
    UIAlertView *alertView = [[UIAlertView alloc] initWithTitle:@"友情提示" message:@"编辑内容还没保存，确定要退出吗？" delegate:self cancelButtonTitle:@"退出编辑" otherButtonTitles:@"继续编辑", nil];
    [alertView show];
}

- (void)alertView:(UIAlertView *)alertView clickedButtonAtIndex:(NSInteger)buttonIndex {

    if (buttonIndex) return;
    [self.navigationController popViewControllerAnimated:YES];
}
@end
