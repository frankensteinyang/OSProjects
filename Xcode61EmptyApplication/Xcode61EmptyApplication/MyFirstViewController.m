//
//  MyFirstViewController.m
//  Xcode61EmptyApplication
//
//  Created by Hannibal Yang on 12/1/14.
//  Copyright (c) 2014 Hannibal Yang. All rights reserved.
//

#import "MyFirstViewController.h"

@interface MyFirstViewController ()

@end

@implementation MyFirstViewController
// 延迟加载机制
- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    self.view.backgroundColor = [UIColor brownColor];
    UIButton *btn = [UIButton buttonWithType:UIButtonTypeContactAdd];
    btn.center = CGPointMake(100, 100);
    [self.view addSubview:btn];
}

@end
