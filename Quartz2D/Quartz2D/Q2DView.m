//
//  Q2DView.m
//  Quartz2D
//
//  Created by Hannibal Yang on 12/20/14.
//  Copyright (c) 2014 Hannibal Yang. All rights reserved.
//

#import "Q2DView.h"

@implementation Q2DView

- (void)drawRect:(CGRect)rect {

    [self drawText];
}

- (void)drawText {

    NSString *text = @"Frankenstein! Frankenstein!";
    
    UIFont *font = [UIFont systemFontOfSize:17];
    // 在iOS 7中，所有文本绘制属性，均需要使用属性字典进行设置
    NSDictionary *dict = @{NSFontAttributeName : font, NSForegroundColorAttributeName : [UIColor blueColor]};
    CGRect rect = [text boundingRectWithSize:CGSizeMake(12, 10000) options:NSStringDrawingUsesLineFragmentOrigin attributes:dict context:nil];
    
    rect.origin = CGPointMake(100, 50);
    
    [[UIColor brownColor] set];
    UIRectFill(rect);
    
    [text drawInRect:rect withAttributes:dict];
//    [text drawAtPoint:CGPointMake(100, 100) withAttributes:dict];
}

// 绘制图像
- (void)drawImage {

    // 绘制的图像，不能交互，性能比UIImageView高
    UIImage *image = [UIImage imageNamed:@"Icon"];
    
    // 指定坐标绘制
//    [image drawAtPoint:CGPointMake(80, 80)];
    
    // 指定区域内拉伸绘制
//    [image drawInRect:self.bounds];
//    [image drawInRect:CGRectMake(200, 200, 50, 80)];
    
    // 平铺绘制
    [image drawAsPatternInRect:self.bounds];
}

- (void)drawArc {

    CGContextRef context = UIGraphicsGetCurrentContext();
    /*
     x,y 弧线所在圆上的圆心
     半径
     开始角度、结束角度，0度是圆形最右侧的点
     顺时针：0，逆时针：1
     */
//    CGContextAddArc(context, 160, 240, 100, 0, M_PI_2, 0);
    CGContextAddArc(context, 160, 240, 100, 0, -M_PI_2, 1);
    CGContextDrawPath(context, kCGPathStroke);
}

- (void)drawCircle {

    CGContextRef context = UIGraphicsGetCurrentContext();
    // 在iOS中，如果要绘制圆形，需要先指定一个矩形
    // 绘制出来的圆形是内切于该矩形的
    CGRect rect = CGRectMake(100, 100, 150, 150);
    // 添加圆形到上下文路径
    CGContextAddEllipseInRect(context, rect);
    CGContextDrawPath(context, kCGPathFill);
}

- (void)drawRectangle {

    CGRect firstRect = CGRectMake(100, 100, 200, 200);
    [[UIColor brownColor] set];
    // 绘制实心矩形
    UIRectFill(firstRect);
    
    CGRect secondRect = CGRectMake(150, 150, 50, 50);
    [[UIColor blueColor] set];
    // 绘制空心矩形
    UIRectFrame(secondRect);
}

- (void)drawLineWithContext {

    // 获取上下文
    CGContextRef context = UIGraphicsGetCurrentContext();
    // 设置上下文中的路径
    CGContextMoveToPoint(context, 100, 100);
    CGContextAddLineToPoint(context, 200, 200);
    CGContextAddLineToPoint(context, 100, 200);
//    CGContextAddLineToPoint(context, 100, 100);
    
    // 关闭路径
    CGContextClosePath(context);
    
    // 设置边线颜色和填充颜色
//    [[UIColor blueColor] setStroke];
//    [[UIColor redColor] setFill];
    // 同时设置边线和填充颜色
    [[UIColor brownColor] set];
    
    // 绘制上下文
    CGContextDrawPath(context, kCGPathFillStroke);
}

- (void)drawLine {

    // 在C语言中，所有的对象，都是通过对象的引用地址来使用的，因此不需要使用*号
    // 获取当前图形的上下文，就是要绘制到屏幕
    CGContextRef context = UIGraphicsGetCurrentContext();
    
    // 设置路径
    CGMutablePathRef path = CGPathCreateMutable();
    
    // 移动到某一个点
    CGPathMoveToPoint(path, NULL, 100, 100);
    
    // 增加一条直线
    CGPathAddLineToPoint(path, NULL, 200, 200);
    
//    [self createLinePath];
    
    // 将路径添加到上下文
    CGContextAddPath(context, path);
    
    // 设置上下文，设置线条颜色
    CGContextSetRGBStrokeColor(context, 1.0, 0.0, 0.0, 1.0);
    
    // 绘制路径
    /**
     kCGPathFill 填充绘制，针对关闭的路径使用
     kCGPathStroke 绘制线条
     kCGPathFillStroke 填充并绘制线条
     kCGPathEOFill 异或填充，针对关闭路径使用
     kCGPathEOFillStroke 异或填充并画线
     */
    CGContextDrawPath(context, kCGPathStroke);
    
    // 释放路径
    CGPathRelease(path);
}

- (CGPathRef)createLinePath {

    CGMutablePathRef path = CGPathCreateMutable();
    CGPathMoveToPoint(path, NULL, 100, 100);
    CGPathAddLineToPoint(path, NULL, 200, 200);
    return path;
}

@end
