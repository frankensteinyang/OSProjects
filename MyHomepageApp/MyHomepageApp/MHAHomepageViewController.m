//
//  MHAHomepageViewController.m
//  MyHomepageApp
//
//  Created by Hannibal Yang on 12/2/14.
//  Copyright (c) 2014 Hannibal Yang. All rights reserved.
//

#import "MHAHomepageViewController.h"
#import "MHAEditViewController.h"

@interface MHAHomepageViewController () <UIActionSheetDelegate, MHAEditViewControllerDelegate>

@end

@implementation MHAHomepageViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"个人主页";
    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemCompose target:self action:@selector(goToEdit)];
    self.navigationItem.leftBarButtonItem = [[UIBarButtonItem alloc] initWithTitle:@"注销" style:UIBarButtonItemStylePlain target:self action:@selector(logout)];
}

- (void)goToEdit {

    MHAEditViewController *edit = [[MHAEditViewController alloc] init];
    edit.delegate = self;
    [self.navigationController pushViewController:edit animated:YES];
    self.navigationItem.backBarButtonItem = [[UIBarButtonItem alloc] initWithTitle:@"返回" style:UIBarButtonItemStylePlain target:nil action:nil];
}

- (void)logout {

    UIActionSheet *sheet = [[UIActionSheet alloc] initWithTitle:@"是否要注销？" delegate:self cancelButtonTitle:@"取消" destructiveButtonTitle:@"注销" otherButtonTitles:nil, nil];
    [sheet showInView:self.view];
}

- (void)actionSheet:(UIActionSheet *)actionSheet clickedButtonAtIndex:(NSInteger)buttonIndex {

    // if (buttonIndex) = if (buttonIndex != 0)
    if (buttonIndex) return;
    [self.navigationController popViewControllerAnimated:YES];
    
}

- (void)editViewController:(MHAEditViewController *)edit didSaveWithName:(NSString *)name phoneNumber:(NSString *)number intro:(NSString *)intro {

    _nicknameLabel.text = name;
    _phoneLabel.text = number;
    _introductionView.text = intro;
    
}

@end
