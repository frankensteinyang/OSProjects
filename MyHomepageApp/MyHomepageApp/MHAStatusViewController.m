//
//  MHAStatusViewController.m
//  MyHomepageApp
//
//  Created by Hannibal Yang on 12/3/14.
//  Copyright (c) 2014 Hannibal Yang. All rights reserved.
//

#import "MHAStatusViewController.h"

@interface MHAStatusViewController () <UIAlertViewDelegate>

@end

@implementation MHAStatusViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"编辑状态";
    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc] initWithTitle:@"发布" style:UIBarButtonItemStylePlain target:self action:@selector(sendStatus)];
    self.navigationItem.leftBarButtonItem = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemCancel target:self action:@selector(toEnsureSaved)];
    
//    [self.navigationItem setHidesBackButton:YES];
    [self.navigationItem setBackBarButtonItem:self.navigationItem.leftBarButtonItem];
    
}

- (void)sendStatus {

    [self.navigationController popViewControllerAnimated:YES];
}

- (void)alertView:(UIAlertView *)alertView clickedButtonAtIndex:(NSInteger)buttonIndex {

    if (buttonIndex) return;
    [self.navigationController popViewControllerAnimated:YES];
    
}

- (void)toEnsureSaved {

    UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"友情提示" message:@"状态未保存，确定要退出吗？" delegate:self cancelButtonTitle:@"确定" otherButtonTitles:@"继续编辑", nil];
    [alert show];
}

@end
