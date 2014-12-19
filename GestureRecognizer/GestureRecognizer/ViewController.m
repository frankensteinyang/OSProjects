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
    // 设置支持交互
    [imgView setUserInteractionEnabled:YES];
    
    // 一、点按
    // numberOfTapsRequired 点击次数：单击/双击
    // numberOfTouchesRequired 几根手指
    UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(tap:)];
    // 定义双击
    tap.numberOfTapsRequired = 2;
    [imgView addGestureRecognizer:tap];
    
    // 二、长按
    UILongPressGestureRecognizer *longTap = [[UILongPressGestureRecognizer alloc] initWithTarget:self action:@selector(longTap:)];
    [imgView addGestureRecognizer:longTap];
    
    // 三、拖动
    UIPanGestureRecognizer *pan = [[UIPanGestureRecognizer alloc] initWithTarget:self action:@selector(pan:)];
    [imgView addGestureRecognizer:pan];
}

#pragma mark - 点按手势
// UIGestureRecognizer所有手势识别的父类
- (void)tap:(UITapGestureRecognizer *)recognizer {
    
    UIImageView *imageView = (UIImageView *)recognizer.view;
    [UIView animateWithDuration:0.8f animations:^{
        [imageView setTransform:CGAffineTransformScale(imageView.transform, 2.0, 2.0)];
    } completion:^(BOOL finished) {
        [UIView animateWithDuration:0.5 animations:^{
            [imageView setTransform:CGAffineTransformScale(imageView.transform, 0.5, 0.5)];
        }];
    }];
    
}
#pragma mark - 长按手势
- (void)longTap:(UILongPressGestureRecognizer *)recognizer {

    // 开始长按
    if (UIGestureRecognizerStateBegan == recognizer.state) {
        [UIView animateWithDuration:0.8f animations:^{
            [recognizer.view setTransform:CGAffineTransformRotate(recognizer.view.transform, M_PI + 0.01)];
        }];
    } else if (UIGestureRecognizerStateEnded == recognizer.state) {
        [UIView animateWithDuration:0.8f animations:^{
            [recognizer.view setTransform:CGAffineTransformRotate(recognizer.view.transform, M_PI)];
        } completion:^(BOOL finished) {
            // 清除所有的形变属性
            [recognizer.view setTransform:CGAffineTransformIdentity];
        }];
    }
}

#pragma mark - 拖动手势
- (void)pan:(UIPanGestureRecognizer *)recognizer {

    CGPoint translation = [recognizer translationInView:self.view];
    // 让图片根据手指移动
    if (UIGestureRecognizerStateChanged == recognizer.state) {
        
//        [recognizer.view setTransform:CGAffineTransformMakeTranslation(translation.x, translation.y)];
        // 形变参数，有Make，是相对初始位置计算，没有Make是递增修改形变CGAffineTransformMakeTranslation/CGAffineTransformTranslate
        [recognizer.view setTransform:CGAffineTransformTranslate(recognizer.view.transform, translation.x, translation.y)];
        // CGAffineTransformTranslate会累加，需要用CGPointZero清零位移量
        [recognizer setTranslation:CGPointZero inView:recognizer.view];
    }
    
}

#pragma mark - 捏合

#pragma mark - 旋转

#pragma mark - 轻扫

@end
