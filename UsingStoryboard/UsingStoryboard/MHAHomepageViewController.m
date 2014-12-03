//
//  MHAHomepageViewController.m
//  UsingStoryboard
//
//  Created by Hannibal Yang on 12/4/14.
//  Copyright (c) 2014 Hannibal Yang. All rights reserved.
//

#import "MHAHomepageViewController.h"
#import "MHAEditViewController.h"
#import "MHAInformation.h"

@interface MHAHomepageViewController () <MHAEditViewControllerDelegate, UIActionSheetDelegate>

@end

@implementation MHAHomepageViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.navigationItem.leftBarButtonItem = [[UIBarButtonItem alloc] initWithTitle:@"注销" style:UIBarButtonItemStylePlain target:self action:@selector(logout)];
    [self.navigationItem setBackBarButtonItem:self.navigationItem.leftBarButtonItem];
}

- (void)editViewController:(MHAEditViewController *)edit didSaveInfo:(MHAInformation *)info {
    
    _nicknameLabel.text = info.nickname;
}

- (void)logout {

    UIActionSheet *sheet = [[UIActionSheet alloc] initWithTitle:@"友情提示" delegate:self cancelButtonTitle:@"取消" destructiveButtonTitle:@"注销" otherButtonTitles:nil, nil];
    [sheet showInView:self.view];
}

- (void)actionSheet:(UIActionSheet *)actionSheet clickedButtonAtIndex:(NSInteger)buttonIndex {

    if (buttonIndex) return;
    [self.navigationController popViewControllerAnimated:YES];
}

#pragma mark 在执行segue跳转之前会调用一次（自动调用）
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {

    // 取得目标控制器
    MHAEditViewController *dest = segue.destinationViewController;
    // 设置MHAEditViewController的代理
    dest.delegate = self;
    // 给MHAEditViewController传递数据
    dest.temporaryName = _nicknameLabel.text;
    
}

@end
