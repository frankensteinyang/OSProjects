//
//  NCThirdViewController.m
//  UINavigationController
//
//  Created by Hannibal Yang on 12/2/14.
//  Copyright (c) 2014 Hannibal Yang. All rights reserved.
//

#import "NCThirdViewController.h"

@interface NCThirdViewController ()

@end

@implementation NCThirdViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
//    self.navigationItem.title = @"Third";
    self.title = @"第三个";
    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemUndo target:nil action:nil];
}

- (IBAction)skipToSecond {
    
    [self.navigationController popViewControllerAnimated:YES];
}

- (IBAction)skipToFirst {
    
    [self.navigationController popToRootViewControllerAnimated:YES];
}
@end
