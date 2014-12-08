//
//  InterviewDock.m
//  9188Interview
//
//  Created by Hannibal Yang on 12/8/14.
//  Copyright (c) 2014 Hannibal Yang. All rights reserved.
//

#import "InterviewDock.h"
#import "InterviewDockItem.h"

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

- (void)addDockItem:(NSString *)title icon:(NSString *)icon selectedIcon:(NSString *)sIcon {
    
    InterviewDockItem *item = [InterviewDockItem buttonWithType:UIButtonTypeCustom];
    
    [item setImage:[UIImage imageNamed:icon] forState:UIControlStateNormal];
    [item setImage:[UIImage imageNamed:sIcon] forState:UIControlStateSelected];
    [item setTitle:title forState:UIControlStateNormal];
    [item setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    
    // 自定义选项卡按钮设计原则：用UIControlEventTouchDown，按下去就要触发点击事件，优化用户体验
    [item addTarget:self action:@selector(itemClick:) forControlEvents:UIControlEventTouchDown];

    [self addSubview:item];
    
    // 校正排列frame
    [ self adjustItemFrame];
}

- (void)adjustItemFrame {

    int count = self.subviews.count;
    CGFloat itemW = self.frame.size.width / count;
    CGFloat itemH = self.frame.size.height;
    CGFloat itemY = 0;
    for (int i = 0; i < count; i++) {
        CGFloat itemX = i * itemW;
        InterviewDockItem *child = self.subviews[i];
        child.frame = CGRectMake(itemX, itemY, itemW, itemH);
        
        // 绑定位置Tag
        child.tag = i;
        
        if (i == 0) {
            // 默认选中最左边的按钮（相当于点击了这个按钮）
            [self itemClick:child];
        }
    }
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
