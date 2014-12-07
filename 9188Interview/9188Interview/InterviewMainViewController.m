//
//  InterviewMainViewController.m
//  9188Interview
//
//  Created by Hannibal Yang on 12/7/14.
//  Copyright (c) 2014 Hannibal Yang. All rights reserved.
//

#import "InterviewMainViewController.h"
#import "InterviewDockItem.h"
#import "InterviewLotteryHallViewController.h"
#import "InterviewSyndicateViewController.h"
#import "InterviewRunLotteryViewController.h"
#import "InterviewMyLotteriesViewController.h"

#define kDockItemCount 4

@interface InterviewMainViewController () {

    UIView *_dock;
    InterviewDockItem *_selectedItem;
    NSArray *_allViewControllers;
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
    
    InterviewLotteryHallViewController *lotteryHall = [[InterviewLotteryHallViewController alloc] init];
    InterviewSyndicateViewController *syndicate = [[InterviewSyndicateViewController alloc] init];
    InterviewRunLotteryViewController *runLottery = [[InterviewRunLotteryViewController alloc] init];
    InterviewMyLotteriesViewController *myLotteries = [[InterviewMyLotteriesViewController alloc] init];
    
    // 选项卡有顺序，控制器要有顺序，用数组
    _allViewControllers = @[lotteryHall, syndicate, runLottery, myLotteries];
    
}

- (void)addDockItem:(NSString *)title icon:(NSString *)icon selectedIcon:(NSString *)selectedIcon index:(int)index {

    CGFloat itemW = _dock.frame.size.width / kDockItemCount;
    CGFloat itemH = _dock.frame.size.height;
    CGFloat itemX = index * itemW;
    InterviewDockItem *item = [InterviewDockItem buttonWithType:UIButtonTypeCustom];
    
    // 绑定位置Tag
    item.tag = index;
    
    item.frame = CGRectMake(itemX, 0, itemW, itemH);
    [item setImage:[UIImage imageNamed:icon] forState:UIControlStateNormal];
    [item setImage:[UIImage imageNamed:selectedIcon] forState:UIControlStateSelected];
    [item setTitle:title forState:UIControlStateNormal];
    item.imageView.contentMode = UIViewContentModeCenter;
    item.titleLabel.textAlignment = NSTextAlignmentCenter;
    [item setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    item.titleLabel.font = [UIFont systemFontOfSize:11.0];
    
    // 自定义选项卡按钮设计原则：用UIControlEventTouchDown，按下去就要触发点击事件，优化用户体验
    [item addTarget:self action:@selector(itemClick:) forControlEvents:UIControlEventTouchDown];
    if (index == 0) {
        [self itemClick:item];
    }
    [_dock addSubview:item];
}

- (void)itemClick:(InterviewDockItem *)item {
    
    // 切换控制器
    // （个人面试项目总结：控制器创建好，不一定代表view也创建了，创建的控制器不耗内存，耗内存的是view，view的结构太深）
    // 移除旧控制器的view
    UIViewController *oldController = _allViewControllers[_selectedItem.tag];
    [oldController.view removeFromSuperview];
    
    // 添加新控制器的view
    UIViewController *newController = _allViewControllers[item.tag];
    CGFloat viewW = self.view.frame.size.width;
    CGFloat viewH = self.view.frame.size.height - _dock.frame.size.height;
    newController.view.frame = CGRectMake(0, 0, viewW, viewH);
    [self.view addSubview:newController.view];

    // 方法一
    _selectedItem.selected = NO;
    item.selected = YES;
    _selectedItem = item;
    
    // 方法二
//    for (InterviewDockItem *item in _dock.subviews) {
//        item.selected = NO;
//    }
//    item.selected = YES;
    
}

@end
