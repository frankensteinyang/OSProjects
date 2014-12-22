//
//  EPLineWidthView.m
//  EPainter
//
//  Created by Hannibal Yang on 12/22/14.
//  Copyright (c) 2014 Frankenstein Yang. All rights reserved.
//

#import "EPLineWidthView.h"

@interface EPLineWidthView()

@property (strong, nonatomic) NSArray *linewidths;

@end

@implementation EPLineWidthView

- (id)initWithFrame:(CGRect)frame {

    self = [super initWithFrame:frame];
    if (self) {
        self.backgroundColor = [UIColor whiteColor];
        self.linewidths = @[@(1.0), @(2.0), @(5.0), @(8.0), @(10.0), @(12.0)];
        [self createButtonsWithArray:_linewidths];
    }
    
    return self;
    
}

- (void)createButtonsWithArray:(NSArray *)array {
    
    CGFloat w = self.bounds.size.width / array.count;
    CGFloat h = self.bounds.size.height;
    
    [array enumerateObjectsUsingBlock:^(id obj, NSUInteger idx, BOOL *stop) {
        
        UIButton *btn = [UIButton buttonWithType:UIButtonTypeCustom];
        NSString *text = [NSString stringWithFormat:@"%@点", array[idx]];
        [btn setTitle:text forState:UIControlStateNormal];
        
        CGRect rect = CGRectMake(idx * w, 0, w, h);
        [btn setFrame:rect];
        [btn setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
        [btn.titleLabel setFont:[UIFont systemFontOfSize:14.0f]];
        
        btn.tag = idx;
        
        [btn addTarget:self action:@selector(tapBtn:) forControlEvents:UIControlEventTouchUpInside];
        
        [self addSubview:btn];
        
    }];
    
}

#pragma mark 线宽按钮监听方法
- (void)tapBtn:(UIButton *)btn {

    [_delegate lineWidthViewSelectedLineWidth:[_linewidths[btn.tag] floatValue]];
}

@end
