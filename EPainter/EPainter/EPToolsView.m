//
//  EPToolsView.m
//  EPainter
//
//  Created by Hannibal Yang on 12/21/14.
//  Copyright (c) 2014 Frankenstein Yang. All rights reserved.
//

#import "EPToolsView.h"
#import "EPLinesView.h"

#define kButtonHeight 44

@interface EPToolsView()

@property (weak, nonatomic) UIButton *preSelectedBtn;
@property (weak, nonatomic) EPLinesView *selectedLine;

@end

@implementation EPToolsView

- (id)initWithFrame:(CGRect)frame {

    self = [super initWithFrame:frame];
    if (self) {
        self.backgroundColor = [UIColor brownColor];
        [self createMenuBar];
    }
    return self;
}

#pragma mark - 创建界面工具栏
- (void)createMenuBar {

    NSArray *array = @[@"颜色", @"线宽", @"橡皮", @"撤销", @"清屏", @"相机", @"保存"];
    // 循环创建按钮
    CGFloat btnWidth = self.bounds.size.width / array.count;
    CGFloat y = IS_IOS7 ? 20 : 0;
    
    // Block遍历
    [array enumerateObjectsUsingBlock:^(NSString *text, NSUInteger idx, BOOL *stop) {
        UIButton *btn = [UIButton buttonWithType:UIButtonTypeCustom];
        [btn setTitle:text forState:UIControlStateNormal];
        CGFloat x = idx * btnWidth;
        [btn setFrame:CGRectMake(x, y, btnWidth, kButtonHeight)];
        
        // 设置按钮属性
        [btn setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
        [btn.titleLabel setFont:[UIFont systemFontOfSize:14]];
        [btn setTitleColor:[UIColor blueColor] forState:UIControlStateSelected];
        [self addSubview:btn];
        
        [btn addTarget:self action:@selector(tapButton:) forControlEvents:UIControlEventTouchUpInside];
        
    }];
    
}

#pragma mark - 按钮监听
- (void)tapButton:(UIButton *)button {

    if (self.preSelectedBtn == nil || self.preSelectedBtn != button) {
        self.preSelectedBtn.selected = NO;
    }
    
    [button setSelected:YES];
    self.preSelectedBtn = button;
    
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

@end
