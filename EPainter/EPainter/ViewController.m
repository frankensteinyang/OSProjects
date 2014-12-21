//
//  ViewController.m
//  EPainter
//
//  Created by Hannibal Yang on 12/21/14.
//  Copyright (c) 2014 Frankenstein Yang. All rights reserved.
//

#import "ViewController.h"
#import "EPPainterView.h"
#import "EPToolsView.h"

@interface ViewController ()

@property (weak, nonatomic) EPPainterView *painterView;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    // 实例化绘图视图
    EPPainterView *view = [[EPPainterView alloc] initWithFrame:self.view.bounds];
    // self.view对view进行强引用，如不作此操作，{}结束后，被标识为weak的view会消失
    [self.view addSubview:view];
    self.painterView = view;
    
    // 实例化工具视图
    // 判断系统的版本
    EPToolsView *toolsView = toolsView = [[EPToolsView alloc] initWithFrame:CGRectMake(0, 0, self.view.bounds.size.width, kToolsViewHeight)];
    
    [self.view addSubview:toolsView];
    
}

@end
