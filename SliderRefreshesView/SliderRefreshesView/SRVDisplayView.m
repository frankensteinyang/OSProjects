//
//  SRVDisplayView.m
//  SliderRefreshesView
//
//  Created by Hannibal Yang on 12/21/14.
//  Copyright (c) 2014 Frankenstein Yang. All rights reserved.
//

#import "SRVDisplayView.h"

@implementation SRVDisplayView

- (void)drawRect:(CGRect)rect {

    // 指定文本的对齐方式前，需要指定文本的段落样式
    NSMutableParagraphStyle *paragraph = [[NSMutableParagraphStyle alloc] init];
    paragraph.alignment = NSTextAlignmentCenter;
    // 属性字典
    NSDictionary *dict = @{NSFontAttributeName : [UIFont systemFontOfSize:_fontSize],
                           NSForegroundColorAttributeName : [UIColor blueColor],
                           NSParagraphStyleAttributeName : paragraph};
    // 绘制文本
    [self.text drawInRect:self.bounds withAttributes:dict];
}

- (void)setFontSize:(CGFloat)fontSize {

    _fontSize = fontSize;
    [self setNeedsDisplay];
}

@end
