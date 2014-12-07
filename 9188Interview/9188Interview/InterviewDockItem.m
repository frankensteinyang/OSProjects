//
//  InterviewDockItem.m
//  9188Interview
//
//  Created by Hannibal Yang on 12/8/14.
//  Copyright (c) 2014 Hannibal Yang. All rights reserved.
//

#define kContentScale 0.65

#import "InterviewDockItem.h"

@implementation InterviewDockItem

- (CGRect)imageRectForContentRect:(CGRect)contentRect {

    CGFloat imgW = contentRect.size.width;
    CGFloat imgH = contentRect.size.height * kContentScale;
    return CGRectMake(0, 0, imgW, imgH);
}

- (CGRect)titleRectForContentRect:(CGRect)contentRect {

    CGFloat titleW = contentRect.size.width;
    CGFloat titleY = contentRect.size.height * kContentScale;
    CGFloat titleH = contentRect.size.height - titleY;
    return  CGRectMake(0, titleY, titleW, titleH);
}

@end
