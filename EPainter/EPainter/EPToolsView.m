//
//  EPToolsView.m
//  EPainter
//
//  Created by Hannibal Yang on 12/21/14.
//  Copyright (c) 2014 Frankenstein Yang. All rights reserved.
//

#import "EPToolsView.h"
#import "EPLinesView.h"
#import "EPColorView.h"
#import "EPLineWidthView.h"

#define kMenuBarCommonHeight 44

@interface EPToolsView() <EPColorViewDelegate, EPLineWidthViewDelegate>

@property (weak, nonatomic) UIButton *preSelectedBtn;
@property (weak, nonatomic) EPLinesView *selectedLine;
@property (weak, nonatomic) EPColorView *colorView;
@property (weak, nonatomic) EPLineWidthView *lineWidthView;

@end

@implementation EPToolsView

- (id)initWithFrame:(CGRect)frame {

    self = [super initWithFrame:frame];
    if (self) {
        self.backgroundColor = [UIColor lightGrayColor];
        [self createMenuBar];
    }
    return self;
    
}

#pragma mark - 创建界面工具栏
- (void)createMenuBar {

    NSArray *array = @[@"颜色", @"线宽", @"橡皮", @"撤销", @"清屏", @"相机", @"保存"];
    // 循环创建按钮
    CGFloat w = self.bounds.size.width / array.count;
    CGFloat y = IS_IOS7 ? 20 : 0;
    CGFloat h = self.bounds.size.height - y;
    
    // Block循环遍历
    [array enumerateObjectsUsingBlock:^(NSString *text, NSUInteger idx, BOOL *stop) {
        
        UIButton *btn = [UIButton buttonWithType:UIButtonTypeCustom];
        [btn setTitle:text forState:UIControlStateNormal];
        
        CGRect rect = CGRectMake(idx * w, y, w, h);
        [btn setFrame:rect];
        
        // 设置按钮属性
        [btn setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
        [btn.titleLabel setFont:[UIFont systemFontOfSize:14]];
        
        btn.tag = idx;
        [btn addTarget:self action:@selector(tapButton:) forControlEvents:UIControlEventTouchUpInside];
        [self addSubview:btn];
        
    }];
    
}

#pragma mark - 按钮监听
- (void)tapButton:(UIButton *)button {

    if (self.preSelectedBtn == nil || self.preSelectedBtn != button) {
        self.preSelectedBtn.selected = NO;
    }
    
    [button setSelected:YES];
    self.preSelectedBtn = button;
    
    // 绘制下划线
    [self drawUnderlineWithBtn:button];
    
    switch (button.tag) {
        case kToolsViewColor: // 颜色
            [self showOrHideColorView];
            break;
        
        case kToolsViewLineWidth:
            // 显示/隐藏线宽视图
            [self showOrHideLineWidthView];
            break;
            
        default:
            [self hideColorView];
            [self hideLineWidthView];
            // 通知视图控制器，选中了某项功能
            [_delegate toolsViewSelectedFunction:button.tag];
            break;
    }
    
}

#pragma mark - 绘制按钮底部下划线
- (void)drawUnderlineWithBtn:(UIButton *)button {

    // 计算下划线的位置
    CGFloat x = button.frame.origin.x + button.titleLabel.frame.origin.x;
    CGFloat y = button.frame.origin.y + button.titleLabel.frame.origin.y + button.titleLabel.frame.size.height + 2.0f;
    CGFloat w = button.titleLabel.frame.size.width;
    
    // 实例化线条视图，懒加载（延迟加载）
    if (self.selectedLine == nil) {
        EPLinesView *line = [[EPLinesView alloc] initWithFrame:CGRectMake(x, y, w, 2.0)];
        [self addSubview:line];
        self.selectedLine = line;
    }
    
    [UIView animateWithDuration:0.4f animations:^{
        [self.selectedLine setFrame:CGRectMake(x, y, w, 2.0)];
    }];
    
}

#pragma mark - 子视图操作

// 显示隐藏视图
- (void)showOrHideView:(UIView *)view {
    
    // 切换
    CGRect frame = self.frame;
    CGRect viewFrame = view.frame;
    if (viewFrame.origin.y < 0) {
        viewFrame.origin.y = self.bounds.size.height;
        frame.size.height = kToolsViewHeight + kMenuBarCommonHeight;
    } else {
        viewFrame.origin.y = -self.bounds.size.height;
        frame.size.height = kToolsViewHeight;
    }
    
    [UIView animateWithDuration:0.4f animations:^{
        [view setFrame:viewFrame];
        self.frame = frame;
    }];
    
}

// 显示/隐藏颜色视图
- (void)showOrHideColorView {

    if (self.colorView == nil) {
        // 初始在屏幕外面-self.bounds.size.height
        EPColorView *view = [[EPColorView alloc] initWithFrame:CGRectMake(0, -self.bounds.size.height, self.bounds.size.width, kMenuBarCommonHeight)];
        
        // 在视图的最底层插入视图
        [self insertSubview:view atIndex:0];
        
        // 设置代理
        view.delegate = self;
        
        self.colorView = view;
    }
    
    [self hideLineWidthView];
    [self showOrHideView:self.colorView];
    
}

// 关闭颜色视图
- (void)hideColorView {

    if (self.colorView.frame.origin.y > 0) {
        [self showOrHideView:self.colorView];
    }
    
}

// 显示/隐藏线宽视图
- (void)showOrHideLineWidthView {

    // 懒（延迟）加载线宽视图
    if (self.lineWidthView == nil) {
        CGRect rect = CGRectMake(0, -self.frame.size.height, self.frame.size.width, kMenuBarCommonHeight);
        EPLineWidthView *view = [[EPLineWidthView alloc] initWithFrame:rect];
        [self insertSubview:view atIndex:0];
        
        view.delegate = self;
        self.lineWidthView = view;
    }
    
    [self hideColorView];
    [self showOrHideView:self.lineWidthView];
    
}

// 关闭线宽视图
- (void)hideLineWidthView {

    if (self.lineWidthView.frame.origin.y > 0) {
        [self showOrHideView:self.lineWidthView];
    }
    
}

#pragma mark - 选择颜色代理的方法实现
// 代理（委托）模式，通常是用于上下级之间的消息传递
- (void)colorViewSelectedColor:(UIColor *)color {

    // 工具视图将颜色向上传递给视图控制器
    [_delegate toolsViewSelectedColor:color];
    
    // 隐藏颜色视图
    [self showOrHideColorView];
    
}

#pragma mark - 选择线宽代理方法
- (void)lineWidthViewSelectedLineWidth:(CGFloat)lineWidth {

    [_delegate toolsViewSelectedLineWidth:lineWidth];
    
}
@end
