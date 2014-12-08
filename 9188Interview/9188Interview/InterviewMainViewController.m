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
}

@end

@implementation InterviewMainViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    InterviewLotteryHallViewController *lotteryHall = [[InterviewLotteryHallViewController alloc] init];
    InterviewSyndicateViewController *syndicate = [[InterviewSyndicateViewController alloc] init];
    InterviewRunLotteryViewController *runLottery = [[InterviewRunLotteryViewController alloc] init];
    InterviewMyLotteriesViewController *myLotteries = [[InterviewMyLotteriesViewController alloc] init];
    
    // 杨进忠个人项目能力提升总结：
    // 选项卡有顺序，控制器要有顺序，用数组
    // Apple官方设计原则：当两个控制器互为父子关系的时候，他们的view一般也是互为父子关系
    // 如果自定义一个成员变量数组后把控制器塞进去，InterviewMainViewController与这些控制器不能产生父子关系，而父子关系是用来传递一些事件的，如（屏幕旋转，viewDidAppear等一系列view生命周期方法的统一控制）
    // 通过addChildViewController方法，可以将控制器添加到self.childViewControllers数组中（self在childViewControllers在，控制器不会被销毁）
    [self addChildViewController:lotteryHall];
    [self addChildViewController:syndicate];
    [self addChildViewController:runLottery];
    [self addChildViewController:myLotteries];
    
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
    [_dock addDockItem:@"购彩大厅" icon:@"gcdt.png" selectedIcon:@"gcdt_selected.png"];
    
    // 合买中心
    [_dock addDockItem:@"合买中心" icon:@"hm.png" selectedIcon:@"hm_selected.png"];
    
    // 开奖
    [_dock addDockItem:@"开奖" icon:@"faxian.png" selectedIcon:@"faxianclike.png"];
    
    // 我的彩票
    [_dock addDockItem:@"我的彩票" icon:@"mylottery.png" selectedIcon:@"mylottery_selected.png"];
    
}

#pragma mark - 实现InterviewDock的代理方法
- (void)dock:(InterviewDock *)dock didSelectedFromIndex:(int)fIndex toIndex:(int)tIndex {

    // 切换控制器
    // 个人总结：控制器创建好，不一定代表view也创建了，创建的控制器不耗内存，耗内存的是view，view的结构太深
    // 移除旧控制器的view
        UIViewController *oldController = self.childViewControllers[fIndex];
        [oldController.view removeFromSuperview];
    
    // 添加新控制器的view
        UIViewController *newController = self.childViewControllers[tIndex];
        CGFloat viewW = self.view.frame.size.width;
        CGFloat viewH = self.view.frame.size.height - _dock.frame.size.height;
        newController.view.frame = CGRectMake(0, 0, viewW, viewH);
        [self.view addSubview:newController.view];
}

@end
