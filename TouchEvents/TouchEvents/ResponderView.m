//
//  ResponderView.m
//  TouchEvents
//
//  Created by Hannibal Yang on 12/18/14.
//  Copyright (c) 2014 Hannibal Yang. All rights reserved.
//

#import "ResponderView.h"

@implementation ResponderView

/*
 接收用户触摸响应的条件：
 1. self.userInteractionEnabled = YES;
 2. self.alpha > 0.01;
 3. self.hidden = NO;
 */

// 此方法用于检测具体响应用户的触摸点的视图，会被递归调用
- (UIView *)hitTest:(CGPoint)point withEvent:(UIEvent *)event {

    NSLog(@"hitTest! %@", NSStringFromCGPoint(point));
//    return [super hitTest:point withEvent:event];
    return nil;
}

@end
