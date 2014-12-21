//
//  DPPentagramView.m
//  DrawPentagram
//
//  Created by Hannibal Yang on 12/21/14.
//  Copyright (c) 2014 Hannibal Yang. All rights reserved.
//

#import "DPPentagramView.h"

@implementation DPPentagramView

- (void)drawRect:(CGRect)rect {

    [self drawPentagram:CGPointMake(160, 240) radius:100];
    [self drawPentagram:CGPointMake(80, 60) radius:30];
}

- (void)drawPentagram:(CGPoint)center radius:(CGFloat)radius {

//    CGPoint center = CGPointMake(160, 240);
//    CGFloat radius = 100;
    
    // 五等分 2 * M_PI / 5 * 2
    CGFloat angle = 4 * M_PI / 5;
    
    CGContextRef context = UIGraphicsGetCurrentContext();
    
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
    [[UIColor yellowColor] setStroke];
    
    CGContextDrawPath(context, kCGPathFillStroke);
}

@end
