//
//  InterviewMainViewController.m
//  9188Interview
//
//  Created by Hannibal Yang on 12/7/14.
//  Copyright (c) 2014 Hannibal Yang. All rights reserved.
//

#import "InterviewMainViewController.h"
#import "InterviewLotteryHallViewController.h"
#import "InterviewSyndicateViewController.h"
#import "InterviewRunLotteryViewController.h"
#import "InterviewMyLotteriesViewController.h"
#import "InterviewDock.h"

@interface InterviewMainViewController () <InterviewDockDelegate> {

    InterviewDock *_dock;
    NSArray *_allViewControllers;
}

@end

@implementation InterviewMainViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    InterviewLotteryHallViewController *lotteryHall = [[InterviewLotteryHallViewController alloc] init];
    InterviewSyndicateViewController *syndicate = [[InterviewSyndicateViewController alloc] init];
    InterviewRunLotteryViewController *runLottery = [[InterviewRunLotteryViewController alloc] init];
    InterviewMyLotteriesViewController *myLotteries = [[InterviewMyLotteriesViewController alloc] init];
    
    // 选项卡有顺序，控制器要有顺序，用数组
    _allViewControllers = @[lotteryHall, syndicate, runLottery, myLotteries];
    
    // 底部的标签栏
    InterviewDock *dock = [[InterviewDock alloc] init];
    CGFloat dockW = self.view.frame.size.width;
    CGFloat dockH = 45; // iPhone的点坐标系除以背景图片的像素坐标系 90 / 2
    CGFloat dockY = self.view.frame.size.height - dockH;
    CGFloat dockX = 0;
    dock.frame = CGRectMake(dockX, dockY, dockW, dockH);
    // colorWithPatternImage平铺传入的图片，等于把图片转颜色
    dock.backgroundColor = [UIColor colorWithPatternImage:[UIImage imageNamed:@"bg_white.png"]];
    
    dock.delegate = self;
    
    [self.view addSubview:dock];
    _dock = dock;
    
    // 添加Dock上的控件
    // 购彩大厅
    [_dock addDockItem:@"购彩大厅" icon:@"gcdt.png" selectedIcon:@"gcdt_selected.png" index:0];
    
    // 合买中心
    [_dock addDockItem:@"合买中心" icon:@"hm.png" selectedIcon:@"hm_selected.png" index:1];
    
    // 开奖
    [_dock addDockItem:@"开奖" icon:@"faxian.png" selectedIcon:@"faxianclike.png" index:2];
    
    // 我的彩票
    [_dock addDockItem:@"我的彩票" icon:@"mylottery.png" selectedIcon:@"mylottery_selected.png" index:3];
    
}

#pragma mark - 实现InterviewDock的代理方法
- (void)dock:(InterviewDock *)dock didSelectedFromIndex:(int)fIndex toIndex:(int)tIndex {

    // 切换控制器
    // 个人总结：控制器创建好，不一定代表view也创建了，创建的控制器不耗内存，耗内存的是view，view的结构太深
    // 移除旧控制器的view
        UIViewController *oldController = _allViewControllers[fIndex];
        [oldController.view removeFromSuperview];
    
    // 添加新控制器的view
        UIViewController *newController = _allViewControllers[tIndex];
        CGFloat viewW = self.view.frame.size.width;
        CGFloat viewH = self.view.frame.size.height - _dock.frame.size.height;
        newController.view.frame = CGRectMake(0, 0, viewW, viewH);
        [self.view addSubview:newController.view];
}

@end
