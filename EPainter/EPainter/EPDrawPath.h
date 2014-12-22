//
//  EPDrawPath.h
//  EPainter
//
//  Created by Hannibal Yang on 12/21/14.
//  Copyright (c) 2014 Frankenstein Yang. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@interface EPDrawPath : NSObject

@property (nonatomic, strong) UIBezierPath *path;

@property (nonatomic, strong) UIColor *color;

@property (nonatomic, assign) CGFloat lineWidth;

// 用户选择的照片
@property (nonatomic, strong) UIImage *img;

// 通常在自定义模型类时，为了简化模型类的创建，编写一个工厂方法
+ (id)drawPathWith:(CGPathRef)cgPath color:(UIColor *)color lineWidth:(CGFloat)width;

@end
