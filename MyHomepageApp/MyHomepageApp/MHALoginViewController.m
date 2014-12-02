//
//  MHALoginViewController.m
//  MyHomepageApp
//
//  Created by Hannibal Yang on 12/2/14.
//  Copyright (c) 2014 Hannibal Yang. All rights reserved.
//

#import "MHALoginViewController.h"
#import "MHAAboutViewController.h"

@interface MHALoginViewController ()

@end

@implementation MHALoginViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    self.navigationItem.title = @"登录界面";
    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc] initWithTitle:@"关于" style:UIBarButtonItemStylePlain target:self action:@selector(goToAbout)];
}

- (void)goToAbout {

    MHAAboutViewController *about = [[MHAAboutViewController alloc] init];
    self.navigationItem.backBarButtonItem = [[UIBarButtonItem alloc] initWithTitle:@"返回" style:UIBarButtonItemStylePlain target:nil action:nil];
    // 压入栈
    [self.navigationController pushViewController:about animated:YES];
    
}

@end
