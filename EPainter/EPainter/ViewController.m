//
//  ViewController.m
//  EPainter
//
//  Created by Hannibal Yang on 12/21/14.
//  Copyright (c) 2014 Frankenstein Yang. All rights reserved.
//

#import "ViewController.h"
#import "EPPainterView.h"

@interface ViewController ()

@property (weak, nonatomic) EPPainterView *painterView;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    // 实例化视图
    EPPainterView *view = [[EPPainterView alloc] initWithFrame:self.view.bounds];
    // self.view对view进行强引用，如不作此操作，{}结束后，被标识为weak的view会消失
    [self.view addSubview:view];
    self.painterView = view;
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
