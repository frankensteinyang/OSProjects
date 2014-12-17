//
//  ViewController.m
//  TouchEvents
//
//  Created by Hannibal Yang on 12/17/14.
//  Copyright (c) 2014 Hannibal Yang. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@property (weak, nonatomic) UIView *greenView;

@end

@implementation ViewController

/*
 1.触摸开始
 2.触摸移动
 3.触摸结束
 4.触摸被取消（因为系统事件，例如电话呼叫）
 */
- (void)viewDidLoad {
    [super viewDidLoad];
    
    UIView *view = [[UIView alloc] initWithFrame:CGRectMake(80, 80, 100, 100)];
    view.backgroundColor = [UIColor greenColor];
    [self.view addSubview:view];
    self.greenView = view;
}

- (void)touchesMoved:(NSSet *)touches withEvent:(UIEvent *)event {

    // 对于单点触摸，经常使用anyObject从集合中取到触摸对象
    UITouch *touch = [touches anyObject];
    
    CGPoint location = [touch locationInView:self.view];
    
    // 解决移动时视图跳跃的情况
    CGPoint preLocation = [touch previousLocationInView:self.view];
    CGPoint offset = CGPointMake(location.x - preLocation.x, location.y - preLocation.y);
    CGPoint center = CGPointMake(_greenView.center.x + offset.x, _greenView.center.y + offset.y);
    
//    self.greenView.center = location;
    self.greenView.center = center;
}

@end
