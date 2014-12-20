//
//  Q2DView.m
//  Quartz2D
//
//  Created by Hannibal Yang on 12/20/14.
//  Copyright (c) 2014 Hannibal Yang. All rights reserved.
//

#import "Q2DView.h"

@implementation Q2DView

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

- (void)drawRect:(CGRect)rect {

    [self drawLine];
}

- (void)drawLine {

    CGContextRef context = UIGraphicsGetCurrentContext();
    
    CGMutablePathRef path = CGPathCreateMutable();
    
    CGPathMoveToPoint(path, NULL, 100, 100);
    
    CGPathAddLineToPoint(path, NULL, 200, 200);
    
    CGContextAddPath(context, path);
    
    CGContextSetRGBStrokeColor(context, 1.0, 0.0, 0.0, 1.0);
    
    CGContextDrawPath(context, kCGPathStroke);
    
    CGPathRelease(path);
}

@end
