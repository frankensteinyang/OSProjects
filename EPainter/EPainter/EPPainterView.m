//
//  EPPainterView.m
//  EPainter
//
//  Created by Hannibal Yang on 12/21/14.
//  Copyright (c) 2014 Frankenstein Yang. All rights reserved.
//

#import "EPPainterView.h"

@interface EPPainterView()

//@property (assign, nonatomic) CGPoint point;
//@property (assign, nonatomic) CGPoint previousPoint;
@property (assign, nonatomic) CGMutablePathRef path;

// 保存所有路径
@property (strong, nonatomic) NSMutableArray *pathArray;

@end

@implementation EPPainterView

- (instancetype)initWithFrame:(CGRect)frame {

    self = [super initWithFrame:frame];
    if (self) {
        self.backgroundColor = [UIColor whiteColor];
        
        // 实例化路径数组
        self.pathArray = [NSMutableArray array];
    }
    return self;
}

/*
 在重绘视图内容时，会清空原有所有内容，全部重新绘制
 */
- (void)drawRect:(CGRect)rect {

    CGContextRef context = UIGraphicsGetCurrentContext();
    
    [self drawViewWithContext:context];
}

#pragma mark - 重绘视图
- (void)drawViewWithContext:(CGContextRef)context {
    
    for (UIBezierPath *path in self.pathArray) {
        // path.CGPath类型转换
        CGContextAddPath(context, path.CGPath);
        
        [[UIColor brownColor] set];
        CGContextSetLineWidth(context, 10.0f);
        CGContextSetLineCap(context, kCGLineCapRound);
        
        // 绘制路径
        CGContextDrawPath(context, kCGPathStroke);
    }

    // 将路径添加到上下文
    CGContextAddPath(context, self.path);
    
    // 设置上下文属性
    [[UIColor blueColor] set];
    
    /*
     CGContextSetLineCap    设置线条顶点（起点、终点）的样式
     CGContextSetLineJoin   设置连接点样式
     */
    CGContextSetLineWidth(context, 10.0f);
    CGContextSetLineCap(context, kCGLineCapRound);
//    CGContextSetLineJoin(context, kCGLineJoinBevel);
    
    /*
     C 语言
     绘制虚线的参数：
     1. 上下文
     2. 相位：虚线开始的位置，通常设置为0
     3. 虚线段的长度数组
     4. 虚线段数组的个数
     */
//    CGFloat length[] = {10.0, 20.0f};
//    CGContextSetLineDash(context, 0, length, 2);
    
    // 绘制路径
    CGContextDrawPath(context, kCGPathStroke);
}

- (void)touchesMoved:(NSSet *)touches withEvent:(UIEvent *)event {

    // 取出手势
    UITouch *touch = [touches anyObject];
    // 取出点
    CGPoint location = [touch locationInView:self];
    CGPathAddLineToPoint(self.path, NULL, location.x, location.y);
    
//    self.previousPoint = [touch previousLocationInView:self];
//    // 使用成员变量记录手指点
//    self.point = location;
    
    // 重绘视图
    [self setNeedsDisplay];
    
}

- (void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event {

    // 实例化路径
    self.path = CGPathCreateMutable();
    
    CGPoint location = [[touches anyObject] locationInView:self];
    
    CGPathMoveToPoint(self.path, NULL, location.x, location.y);
}

- (void)touchesEnded:(NSSet *)touches withEvent:(UIEvent *)event {

    // 将路径添加到数组
    // 在OC中提供了一个UIBezierPath对象，是对CGPath的封装
    UIBezierPath *path = [UIBezierPath bezierPathWithCGPath:self.path];
    [self.pathArray addObject:path];
    // 释放路径
    CGPathRelease(self.path);
}

@end
