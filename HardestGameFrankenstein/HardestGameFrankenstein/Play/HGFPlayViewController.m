//
//  HGFPlayViewController.m
//  HardestGameFrankenstein
//
//  Created by Hannibal Yang on 12/11/14.
//  Copyright (c) 2014 Hannibal Yang. All rights reserved.
//

#import "HGFPlayViewController.h"

@interface HGFPlayViewController () {

    NSTimer *_timer;
}

@end

@implementation HGFPlayViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
}

- (void)viewDidDisappear:(BOOL)animated {

    [super viewDidDisappear:animated];
    [_timer invalidate];
}

- (void)viewDidAppear:(BOOL)animated {

    [super viewDidAppear:animated];
    // 创建定时器
    _timer = [NSTimer scheduledTimerWithTimeInterval:1.0 target:self selector:@selector(randomSkip) userInfo:nil repeats:YES];
}

- (void)randomSkip {
    
    CGRect frame = _footView.frame;
    int currentIndex = frame.origin.x / frame.size.width;
    int newIndex = currentIndex;
    while (newIndex == currentIndex) {
        // 生成0-2的随机数
        newIndex = arc4random_uniform(3);
    }
    frame.origin.x = newIndex * frame.size.width;
    _footView.frame = frame;
}

@end
