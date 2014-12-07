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

// - (id)init方法内部会调用initWithFrame:，故不用实现init
- (id)initWithFrame:(CGRect)frame {

    self = [super initWithFrame:frame];
    if (self) {
        self.imageView.contentMode = UIViewContentModeCenter;
        self.titleLabel.textAlignment = NSTextAlignmentCenter;
        self.titleLabel.font = [UIFont systemFontOfSize:11.0];
    }
    return self;
}

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

// 重写覆盖父类默认的高亮处理
- (void)setHighlighted:(BOOL)highlighted {
    
//    [super setHighlighted:highlighted];
}

@end
