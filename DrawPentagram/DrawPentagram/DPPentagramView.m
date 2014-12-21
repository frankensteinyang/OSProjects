//
//  DPPentagramView.m
//  DrawPentagram
//
//  Created by Hannibal Yang on 12/21/14.
//  Copyright (c) 2014 Hannibal Yang. All rights reserved.
//

#import "DPPentagramView.h"

@interface DPPentagramView() {

    NSArray *_points;
}
@end

@implementation DPPentagramView

// 视图被加载后，计算五角星需要的点
- (void)awakeFromNib {

    _points = [self createPentagramPoint];
}

- (void)drawRect:(CGRect)rect {

    CGContextRef context = UIGraphicsGetCurrentContext();
    // 通过对上下文的形变设置缩放
//    CGContextScaleCTM(context, 0.5, 0.5);
    
    /**
     相对原点旋转上下文坐标系
     CGContextRotateCTM(<#CGContextRef c#>, <#CGFloat angle#>)
     相对原点平移上下文坐标系
     CGContextTranslateCTM(<#CGContextRef c#>, <#CGFloat tx#>, <#CGFloat ty#>)
     缩放上下文坐标系
     CGContextScaleCTM(<#CGContextRef c#>, <#CGFloat sx#>, <#CGFloat sy#>)
     */
    
    for (NSInteger i = 0; i < 50; i++) {
        // 保存上下文的状态
        CGContextSaveGState(context);
        
        // 随机坐标点
        CGFloat x = arc4random_uniform(self.bounds.size.width);
        CGFloat y = arc4random_uniform(self.bounds.size.height);
        // 平移
        CGContextTranslateCTM(context, x, y);
        
        // 随机角度
        CGFloat angle = arc4random_uniform(180) / 180.0f * M_PI;
        // 旋转
        CGContextRotateCTM(context, angle);
        
        // 随机缩放 0.6~1.0的随机缩放比例
        CGFloat scale = arc4random_uniform(5) / 10.0 + 0.2;
        CGContextScaleCTM(context, scale, scale);
        
//        [self drawPentagram:context center:CGPointMake(x, y) radius:r];
        [self drawPentagram:context];
        
        // 恢复上下文的状态
        CGContextRestoreGState(context);
        
    }
    
//    [self drawPentagram:context center:CGPointMake(160, 240) radius:100];
//    [self drawPentagram:context center:CGPointMake(80, 60) radius:30];
}

// 计算相对于原点（0，0）的坐标数组
- (NSArray *)createPentagramPoint {
    
    // 原始半径
    CGFloat radius = 100;
    // 五等分 2 * M_PI / 5 * 2
    CGFloat angle = 4 * M_PI / 5;
    
    CGPoint p = CGPointMake(0, - radius);
    
    // 定义可变数组，可以使用M做后缀
    // 在实例化数组时，如果指定数组的容量，可以提升性能
    NSMutableArray *arrayM = [NSMutableArray arrayWithCapacity:5];
    
    [arrayM addObject:[NSValue valueWithCGPoint:p]];
    for (NSInteger i = 1; i < 5; i++) {
        // cosf()返回参数的余弦值
        CGFloat x = cosf(i * angle - M_PI_2) * radius;
        // sinf()返回参数的正弦值
        CGFloat y = sinf(i * angle - M_PI_2) * radius;
        
        CGPoint point = CGPointMake(x, y);
        [arrayM addObject:[NSValue valueWithCGPoint:point]];
    }
    
    return arrayM;
}

// 随机颜色
- (UIColor *)randomColor {

    CGFloat r = arc4random_uniform(256) / 255.0f;
    CGFloat g = arc4random_uniform(256) / 255.0f;
    CGFloat b = arc4random_uniform(256) / 255.0f;
    return [UIColor colorWithRed:r green:g blue:b alpha:1.0f];
}

// 绘制五角星方法的改进
- (void)drawPentagram:(CGContextRef)context {

    // 先取出第一个点
    CGPoint p = [_points[0] CGPointValue];
    CGContextMoveToPoint(context, p.x, p.y);
    
    // 循环添加点坐标
    for (NSInteger i = 1; i < _points.count; i++) {
        CGPoint p = [_points[i] CGPointValue];
        CGContextAddLineToPoint(context, p.x, p.y);
    }
    
    // 关闭路径
    CGContextClosePath(context);
    
    [[self randomColor] set];
    
    CGContextDrawPath(context, kCGPathFill);
}

// 绘制五角星
- (void)drawPentagram:(CGContextRef)context center:(CGPoint)center radius:(CGFloat)radius {
    
    // 五等分 2 * M_PI / 5 * 2
    CGFloat angle = 4 * M_PI / 5;
    
    CGPoint p = CGPointMake(center.x, center.y - radius);
    
    CGContextMoveToPoint(context, p.x, p.y);
    
    for (NSInteger i = 1; i < 5; i++) {
        // cosf()返回参数的余弦值
        CGFloat x = cosf(i * angle - M_PI_2) * radius;
        // sinf()返回参数的正弦值
        CGFloat y = sinf(i * angle - M_PI_2) * radius;
        
        CGContextAddLineToPoint(context, x + center.x, y + center.y);
    }
    
    CGContextClosePath(context);
    
    // 设置颜色
    [[self randomColor] set];
    
    CGContextDrawPath(context, kCGPathFill);
}

@end
