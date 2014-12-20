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
    
    // 四、捏合
    UIPinchGestureRecognizer *pinch = [[UIPinchGestureRecognizer alloc] initWithTarget:self action:@selector(pinch:)];
    [imgView addGestureRecognizer:pinch];
    
    // 五、旋转
    UIRotationGestureRecognizer *rotation = [[UIRotationGestureRecognizer alloc] initWithTarget:self action:@selector(rotation:)];
    [imgView addGestureRecognizer:rotation];
    
    // 六、轻扫/滑动
    // 轻扫手势需要分别实例化4个方向的手势
    UISwipeGestureRecognizer *swipeUp = [[UISwipeGestureRecognizer alloc] initWithTarget:self action:@selector(swipe:)];
    // 并
    swipeUp.direction = UISwipeGestureRecognizerDirectionUp | UISwipeGestureRecognizerDirectionDown | UISwipeGestureRecognizerDirectionLeft | UISwipeGestureRecognizerDirectionRight;
    [self.view addGestureRecognizer:swipeUp];
    
//    UISwipeGestureRecognizer *swipeDown = [[UISwipeGestureRecognizer alloc] initWithTarget:self action:@selector(swipe:)];
//    swipeDown.direction = UISwipeGestureRecognizerDirectionDown;
//    [self.view addGestureRecognizer:swipeDown];
//    
//    UISwipeGestureRecognizer *swipeRight = [[UISwipeGestureRecognizer alloc] initWithTarget:self action:@selector(swipe:)];
//    swipeRight.direction = UISwipeGestureRecognizerDirectionRight;
//    [self.view addGestureRecognizer:swipeRight];
//    
//    UISwipeGestureRecognizer *swipeLeft = [[UISwipeGestureRecognizer alloc] initWithTarget:self action:@selector(swipe:)];
//    swipeLeft.direction = UISwipeGestureRecognizerDirectionLeft;
//    [self.view addGestureRecognizer:swipeLeft];
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

#pragma mark - 捏合手势
- (void)pinch:(UIPinchGestureRecognizer *)recognizer {

    if (UIGestureRecognizerStateChanged == recognizer.state) {
        [recognizer.view setTransform:CGAffineTransformScale(recognizer.view.transform, recognizer.scale, recognizer.scale)];
        // 在设置累加形变参数时，需要重置手势的缩放比例 CGAffineTransformScale
        recognizer.scale = 1.0f;
    }
}

#pragma mark - 旋转手势
- (void)rotation:(UIRotationGestureRecognizer *)recognizer {

    if (UIGestureRecognizerStateChanged == recognizer.state) {
        recognizer.view.transform = CGAffineTransformRotate(recognizer.view.transform, recognizer.rotation);
        // 重置旋转量 CGAffineTransformRotate
        recognizer.rotation = 0.0f;
    }
}

#pragma mark - 轻扫/滑动手势
- (void)swipe:(UISwipeGestureRecognizer *)recognizer {

    /*
     二进制位移：
     UISwipeGestureRecognizerDirectionRight = 1 << 0,
     UISwipeGestureRecognizerDirectionLeft  = 1 << 1,
     UISwipeGestureRecognizerDirectionUp    = 1 << 2,
     UISwipeGestureRecognizerDirectionDown  = 1 << 3
     */
    NSLog(@"%d", recognizer.direction);
    if (UISwipeGestureRecognizerDirectionUp == recognizer.direction) {
        NSLog(@"向上！");
    } else if (UISwipeGestureRecognizerDirectionDown == recognizer.direction) {
        NSLog(@"向下！");
    } else if (UISwipeGestureRecognizerDirectionRight == recognizer.direction) {
        NSLog(@"向右！");
    } else if (UISwipeGestureRecognizerDirectionLeft == recognizer.direction) {
        NSLog(@"向左！");
    }
}
@end
