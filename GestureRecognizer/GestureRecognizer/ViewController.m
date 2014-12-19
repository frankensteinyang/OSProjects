//
//  ViewController.m
//  GestureRecognizer
//
//  Created by Hannibal Yang on 12/19/14.
//  Copyright (c) 2014 Hannibal Yang. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

/*
 步骤：
 1. 实例化手势识别
 2. 设置手势识别属性
 3. 将手势识别附加到指定的视图
 4. 编写监听方法
 */

- (void)viewDidLoad {
    [super viewDidLoad];
    UIImage *img = [UIImage imageNamed:@"001"];
    UIImageView *imgView = [[UIImageView alloc] initWithImage:img];
    [imgView setFrame:CGRectMake(10, 120, 300, 196)];
    [self.view addSubview:imgView];
}

@end
