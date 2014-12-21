//
//  EPPainterView.m
//  EPainter
//
//  Created by Hannibal Yang on 12/21/14.
//  Copyright (c) 2014 Frankenstein Yang. All rights reserved.
//

#import "EPPainterView.h"

@interface EPPainterView()

@property (assign, nonatomic) CGPoint point;

@end

@implementation EPPainterView

- (instancetype)initWithFrame:(CGRect)frame {

    self = [super initWithFrame:frame];
    if (self) {
        self.backgroundColor = [UIColor whiteColor];
    }
    return self;
}

- (void)drawRect:(CGRect)rect {

    CGContextRef context = UIGraphicsGetCurrentContext();
    
    [self drawViewWithContext:context];
}

#pragma mark - 重绘视图
- (void)drawViewWithContext:(CGContextRef)context {

    // 设置一个临时点
    CGContextMoveToPoint(context, 0, 0);
    
    // 添加目标点
    CGContextAddLineToPoint(context, self.point.x, self.point.y);
    
    // 设置上下文属性
    
    // 绘制路径
    CGContextDrawPath(context, kCGPathStroke);
}

- (void)touchesMoved:(NSSet *)touches withEvent:(UIEvent *)event {

    // 取出手势
    UITouch *touch = [touches anyObject];
    // 取出点
    CGPoint location = [touch locationInView:self];
    // 使用成员变量记录手指点
    self.point = location;
    // 重绘视图
    [self setNeedsDisplay];
    
}

@end
