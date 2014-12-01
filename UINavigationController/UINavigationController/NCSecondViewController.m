//
//  NCSecondViewController.m
//  UINavigationController
//
//  Created by Hannibal Yang on 12/2/14.
//  Copyright (c) 2014 Hannibal Yang. All rights reserved.
//

#import "NCSecondViewController.h"
#import "NCThirdViewController.h"

@interface NCSecondViewController ()

@end

@implementation NCSecondViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    self.navigationItem.title = @"Second";
    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemCamera target:nil action:nil];
}

- (void)skipToThird {

    NCThirdViewController *third = [[NCThirdViewController alloc] init];
    [self.navigationController pushViewController:third animated:YES];
}

@end
