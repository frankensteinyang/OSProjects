//
//  InterviewDock.m
//  9188Interview
//
//  Created by Hannibal Yang on 12/8/14.
//  Copyright (c) 2014 Hannibal Yang. All rights reserved.
//

#import "InterviewDock.h"
#import "InterviewDockItem.h"

#define kDockItemCount 4

@interface InterviewDock () {

    InterviewDockItem *_selectedItem;
}
@end

@implementation InterviewDock

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

- (void)addDockItem:(NSString *)title icon:(NSString *)icon selectedIcon:(NSString *)selectedIcon index:(int)index {
    
    CGFloat itemW = self.frame.size.width / kDockItemCount;
    CGFloat itemH = self.frame.size.height;
    CGFloat itemX = index * itemW;
    InterviewDockItem *item = [InterviewDockItem buttonWithType:UIButtonTypeCustom];
    
    // 绑定位置Tag
    item.tag = index;
    
    item.frame = CGRectMake(itemX, 0, itemW, itemH);
    [item setImage:[UIImage imageNamed:icon] forState:UIControlStateNormal];
    [item setImage:[UIImage imageNamed:selectedIcon] forState:UIControlStateSelected];
    [item setTitle:title forState:UIControlStateNormal];
    [item setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    
    // 自定义选项卡按钮设计原则：用UIControlEventTouchDown，按下去就要触发点击事件，优化用户体验
    [item addTarget:self action:@selector(itemClick:) forControlEvents:UIControlEventTouchDown];
    if (index == 0) {
        [self itemClick:item];
    }
    [self addSubview:item];
}

- (void)itemClick:(InterviewDockItem *)item {
    
    // 通知代理
    if ([_delegate respondsToSelector:@selector(dock:didSelectedFromIndex:toIndex:)]) {
        [_delegate dock:self didSelectedFromIndex:_selectedItem.tag toIndex:item.tag];
    }
    
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
