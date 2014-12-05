//
//  MLThirdViewController.m
//  ModalLearning
//
//  Created by Hannibal Yang on 12/5/14.
//  Copyright (c) 2014 Hannibal Yang. All rights reserved.
//

#import "MLThirdViewController.h"

@interface MLThirdViewController ()

@end

@implementation MLThirdViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    UIButton *btn = [UIButton buttonWithType:UIButtonTypeContactAdd];
    btn.frame = CGRectMake(0, 45, 44, 44);
    [self.view addSubview:btn];
    
    UIView *view = [[UIView alloc] init];
    view.frame = CGRectMake(0, 200, 200, 200);
    view.backgroundColor = [UIColor redColor];
    [self.view addSubview:view];
    
    self.navigationItem.leftBarButtonItem = [[UIBarButtonItem alloc] initWithTitle:@"返回" style:UIBarButtonItemStylePlain target:self action:@selector(back2Second)];
}

- (void)back2Second {
    
    [self dismissViewControllerAnimated:YES completion:nil];
}

@end
