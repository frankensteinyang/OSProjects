//
//  MultiTouchViewController.m
//  TouchEvents
//
//  Created by Hannibal Yang on 12/17/14.
//  Copyright (c) 2014 Hannibal Yang. All rights reserved.
//

#import "MultiTouchViewController.h"

@interface MultiTouchViewController () {

    NSArray *_images;
}
@end

@implementation MultiTouchViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    // 初始化图像
    _images = @[[UIImage imageNamed:@"spark_blue"],
                [UIImage imageNamed:@"spark_red"]];
    
    // 让视图支持多点触摸
    [self.view setMultipleTouchEnabled:YES];
}

- (void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event {

    // 单点触摸，取出UITouch对象
//    UITouch *touch = [touches anyObject];
//    NSInteger i = 0;
//    for (UITouch *touch in touches) {
//        // 取出手指触摸位置
//        CGPoint location = [touch locationInView:self.view];
//        // 在相应位置绘制图像
//        UIImageView *imageView = [[UIImageView alloc] initWithImage:_images[i]];
//        imageView.center = location;
//        [self.view addSubview:imageView];
//        i++;
//    }
    
}

- (void)touchesMoved:(NSSet *)touches withEvent:(UIEvent *)event {

    NSInteger i = 0;
    for (UITouch *touch in touches) {
        CGPoint location = [touch locationInView:self.view];
        UIImageView *imageView = [[UIImageView alloc] initWithImage:_images[i]];
        imageView.center = location;
        [self.view addSubview:imageView];
        i++;
    }
}

- (void)touchesEnded:(NSSet *)touches withEvent:(UIEvent *)event {

    NSLog(@"%d", self.view.subviews.count);
}

@end
