//
//  InterviewMainViewController.m
//  9188Interview
//
//  Created by Hannibal Yang on 12/7/14.
//  Copyright (c) 2014 Hannibal Yang. All rights reserved.
//

#import "InterviewMainViewController.h"
#import "InterviewDockItem.h"

@interface InterviewMainViewController () {

    UIView *_dock;
}

@end

@implementation InterviewMainViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    // 底部的标签栏
    UIView *dock = [[UIView alloc] init];
    CGFloat dockW = self.view.frame.size.width;
    CGFloat dockH = 45; // iPhone的点坐标系除以背景图片的像素坐标系 90 / 2
    CGFloat dockY = self.view.frame.size.height - dockH;
    CGFloat dockX = 0;
    dock.frame = CGRectMake(dockX, dockY, dockW, dockH);
    dock.backgroundColor = [UIColor yellowColor];
    // 平铺传入的图片，等于把图片转颜色
    dock.backgroundColor = [UIColor colorWithPatternImage:[UIImage imageNamed:@"bg_white.png"]];
    [self.view addSubview:dock];
    _dock = dock;
    
    // 添加Dock上的控件
    // 购彩大厅
    [self addDockItem:@"购彩大厅" icon:@"gcdt.png" selectedIcon:@"gcdt_selected.png" index:0];
    
    // 合买中心
    [self addDockItem:@"合买中心" icon:@"hm.png" selectedIcon:@"hm_selected.png" index:1];
    
    // 开奖
    [self addDockItem:@"开奖" icon:@"faxian.png" selectedIcon:@"faxianclike.png" index:2];
    
    // 我的彩票
    [self addDockItem:@"我的彩票" icon:@"mylottery.png" selectedIcon:@"mylottery_selected.png" index:3];
    
}

- (void)addDockItem:(NSString *)title icon:(NSString *)icon selectedIcon:(NSString *)selectedIcon index:(int)index {

    CGFloat itemW = _dock.frame.size.width / 4;
    CGFloat itemH = _dock.frame.size.height;
    CGFloat itemX = index * itemW;
    InterviewDockItem *item = [InterviewDockItem buttonWithType:UIButtonTypeCustom];
    item.frame = CGRectMake(itemX, 0, itemW, itemH);
    [item setImage:[UIImage imageNamed:icon] forState:UIControlStateNormal];
    [item setImage:[UIImage imageNamed:selectedIcon] forState:UIControlStateSelected];
    [item setTitle:title forState:UIControlStateNormal];
    item.imageView.contentMode = UIViewContentModeCenter;
    item.titleLabel.textAlignment = NSTextAlignmentCenter;
    [item setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    item.titleLabel.font = [UIFont systemFontOfSize:11.0];
    
    // 监听按钮的点击
    [item addTarget:self action:@selector(itemClick:) forControlEvents:UIControlEventTouchUpInside];
    [_dock addSubview:item];
}

- (void)itemClick:(InterviewDockItem *)item {

    item.selected = YES;
}

@end
