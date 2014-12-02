//
//  MHAHomepageViewController.m
//  MyHomepageApp
//
//  Created by Hannibal Yang on 12/2/14.
//  Copyright (c) 2014 Hannibal Yang. All rights reserved.
//

#import "MHAHomepageViewController.h"
#import "MHAEditViewController.h"

@interface MHAHomepageViewController ()

@end

@implementation MHAHomepageViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"个人主页";
    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemCompose target:self action:@selector(goToEdit)];
}

- (void)goToEdit {

    MHAEditViewController *edit = [[MHAEditViewController alloc] init];
    [self.navigationController pushViewController:edit animated:YES];
    self.navigationItem.backBarButtonItem = [[UIBarButtonItem alloc] initWithTitle:@"返回" style:UIBarButtonItemStylePlain target:nil action:nil];
}

@end
