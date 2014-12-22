//
//  EPPainterView.m
//  EPainter
//
//  Created by Hannibal Yang on 12/21/14.
//  Copyright (c) 2014 Frankenstein Yang. All rights reserved.
//

#import "EPPainterView.h"
#import "EPDrawPath.h"

@interface EPPainterView()

@property (assign, nonatomic) CGMutablePathRef path;

// 保存所有路径
@property (strong, nonatomic) NSMutableArray *pathArray;
// 路径被释放的标记
@property (assign, nonatomic) BOOL pathReleased;

@end

@implementation EPPainterView

- (id)initWithFrame:(CGRect)frame {

    self = [super initWithFrame:frame];
    if (self) {
        self.backgroundColor = [UIColor whiteColor];
        
        // 实例化路径数组
        self.pathArray = [NSMutableArray array];
        
        // 初始化默认属性
        self.color = [UIColor blackColor];
        self.lineWidth = 8.0f;
        
        // 设置手势监听
        // 手势识别，监听两个手指的点按事件
        // 通过代理通知视图控制器，由视图控制器显示/隐藏工具视图
        UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(tap:)];
        [tap setNumberOfTouchesRequired:2];
        [self addGestureRecognizer:tap];
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
    
    for (EPDrawPath *drawPath in self.pathArray) {
        
        // 数组中可能存在（setImage:）图像，判断绘制图像还是路径
        if (drawPath.img != nil) {
            
            [drawPath.img drawAtPoint:CGPointMake(100, 100)];
            
        } else {
        
            // 用.CGPath进行类型转换
            CGContextAddPath(context, drawPath.path.CGPath);
            
            [drawPath.color set];
            CGContextSetLineWidth(context, drawPath.lineWidth);
            CGContextSetLineCap(context, kCGLineCapRound);
            
            // 绘制路径
            CGContextDrawPath(context, kCGPathStroke);
            
        }
        
    }

    if (!self.pathReleased) {
        // 将路径添加到上下文
        CGContextAddPath(context, self.path);
        
        // 设置上下文属性
        [self.color set];
        
        /*
         CGContextSetLineCap    设置线条顶点（起点、终点）的样式
         CGContextSetLineJoin   设置连接点样式
         */
        CGContextSetLineWidth(context, self.lineWidth);
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
    
    // 新路径开始
    self.pathReleased = NO;
    
    CGPoint location = [[touches anyObject] locationInView:self];
    
    CGPathMoveToPoint(self.path, NULL, location.x, location.y);
}

- (void)touchesEnded:(NSSet *)touches withEvent:(UIEvent *)event {

    // 将路径添加到数组
    // 在OC中提供了一个UIBezierPath对象，是对CGPath的封装
//    UIBezierPath *path = [UIBezierPath bezierPathWithCGPath:self.path];
    
    EPDrawPath *path = [EPDrawPath drawPathWith:self.path color:self.color lineWidth:self.lineWidth];
    
    [self.pathArray addObject:path];
    
    // 释放路径
    CGPathRelease(self.path);
    
    // 新路径结束
    self.pathReleased = YES;
    
}

#pragma mark - 手势监听方法
- (void)tap:(UITapGestureRecognizer *)recognizer {

    [_delegate painterViewBeTapped];
}

#pragma mark - 成员方法 撤销
- (void)undo {

    // 撤销：删除数组中的最后一项
    [self.pathArray removeLastObject];
    // 重新绘制
    [self setNeedsDisplay];
    
}

- (void)clear {

    [self.pathArray removeAllObjects];
    
    [self setNeedsDisplay];
}

#pragma mark Image的Setter
- (void)setImage:(UIImage *)image {

    // 使用image建立一个EPDrawPath对象
    EPDrawPath *path = [[EPDrawPath alloc] init];
    path.img = image;
    
    // 把EPDrawPath对象添加到数组
    [self.pathArray addObject:path];
    
    // 重绘视图
    [self setNeedsDisplay];
    
}

#pragma mark - 生成图像（使用绘制路径）
- (UIImage *)createImage {

    // 打开图像上下文
    UIGraphicsBeginImageContext(self.bounds.size);
    
    // 获取上下文
    CGContextRef context = UIGraphicsGetCurrentContext();
    
    for (EPDrawPath *drawPath in self.pathArray) {
        
        // 数组中可能存在（setImage:）图像，判断绘制图像还是路径
        if (drawPath.img != nil) {
            
            [drawPath.img drawAtPoint:CGPointMake(100, 100)];
            
        } else {
            
            // 用.CGPath进行类型转换
            CGContextAddPath(context, drawPath.path.CGPath);
            
            [drawPath.color set];
            CGContextSetLineWidth(context, drawPath.lineWidth);
            CGContextSetLineCap(context, kCGLineCapRound);
            
            // 绘制路径
            CGContextDrawPath(context, kCGPathStroke);
            
        }
        
    }
    
    // 获取图像
    UIImage *image = UIGraphicsGetImageFromCurrentImageContext();
    
    // 关闭上下文
    UIGraphicsEndImageContext();
    
    // 返回图像
    return image;
    
}

#pragma mark - 保存照片到相册
- (void)savePhoto {

    // 生成image，使用图像上下文重新绘制
    UIImage *img = [self createImage];
    
    // 保存到相册
    UIImageWriteToSavedPhotosAlbum(img, self, @selector(image:didFinishSavingWithError:contextInfo:), nil);
    
}

#pragma mark - 照片保存完成
- (void)image:(UIImage *)image didFinishSavingWithError:(NSError *)error contextInfo:(void *)contextInfo {

    UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"提示" message:@"保存成功！" delegate:nil cancelButtonTitle:@"确定" otherButtonTitles:nil, nil];
    [alert show];
    
}

@end
