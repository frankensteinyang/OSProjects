//
//  ViewController.m
//  Friendshake
//
//  Created by Hannibal Yang on 12/19/14.
//  Copyright (c) 2014 Hannibal Yang. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

// 成为第一响应者
- (BOOL)canBecomeFirstResponder {

    return YES;
}

// 在视图出现时，让视图控制器成为第一响应者
- (void)viewDidAppear:(BOOL)animated {

    [self becomeFirstResponder];
}

// 在视图消失时，让视图控制器注销第一响应者身份
- (void)viewDidDisappear:(BOOL)animated {

    [self resignFirstResponder];
}

#pragma mark - 摇晃开始事件
// 监听摇晃运动事件
- (void)motionBegan:(UIEventSubtype)motion withEvent:(UIEvent *)event {

    if (motion == UIEventSubtypeMotionShake) {
        NSLog(@"摇晃了！");
    }
}

@end
