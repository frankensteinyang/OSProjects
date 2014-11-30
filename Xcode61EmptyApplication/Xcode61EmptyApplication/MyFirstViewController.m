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

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
