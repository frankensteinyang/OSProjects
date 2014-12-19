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

/*
 WeChat摇一摇的实现思路：
 1. 进入界面，利用CoreLocation（MapKit）判断用户当前的位置
 2. 用户摇动，将用户的经纬度，用户帐号，摇晃时间，发送到WeChat的服务器
 3. 1）后台处理，计算当前时间的一定范围内摇晃手机的用户
    2）产生列表，发送到用户手机
 4. 用户接收到数据后，使用UITableView展现数据
 */

// 成为第一响应者是监听摇晃事件的关键
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
        NSLog(@"已摇晃！");
    }
}

@end
