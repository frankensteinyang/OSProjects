//
//  EPDrawPath.m
//  EPainter
//
//  Created by Hannibal Yang on 12/21/14.
//  Copyright (c) 2014 Frankenstein Yang. All rights reserved.
//

#import "EPDrawPath.h"

@implementation EPDrawPath

+ (id)drawPathWith:(CGPathRef)cgPath
             color:(UIColor *)color
         lineWidth:(CGFloat)width {

    EPDrawPath *path = [[EPDrawPath alloc] init];
    path.path = [UIBezierPath bezierPathWithCGPath:cgPath];
    path.color = color;
    path.lineWidth = width;
    
    return path;
}

@end
