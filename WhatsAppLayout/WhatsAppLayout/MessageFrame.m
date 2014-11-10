//
//  MessageFrame.m
//  WhatsAppLayout
//
//  Created by Hannibal Yang on 11/10/14.
//  Copyright (c) 2014 Hannibal Yang. All rights reserved.
//

// cell的边框
#define kCellBorderW 10

// 时间的字体
#define kTimeFont [UIFont systemFontOfSize:13]

// 内容的字体
#define kContentFont [UIFont systemFontOfSize:15]

// 内容的最大宽度
#define kContentMaxW 200

// 图片的宽高
#define kIconWH 40

#import "MessageFrame.h"
#import "Message.h"

@implementation MessageFrame

- (void)setMessage:(Message *)message {
    
    _message = message;
    
    CGFloat screenW = [UIScreen mainScreen].bounds.size.width;
    
    // 1.Time
    CGFloat timeY = kCellBorderW;
    CGSize timeSize = [message.time sizeWithFont:kTimeFont];
    CGFloat timeW = timeSize.width;
    CGFloat timeX = (screenW - timeW) * 0.5;
    CGFloat timeH = timeSize.height;
    _timeF = CGRectMake(timeX, timeY, timeW, timeH);
    
    // 2.Icon
    CGFloat iconX = kCellBorderW;
    CGFloat iconY = CGRectGetMaxY(_timeF) + kCellBorderW;
    _iconF = CGRectMake(iconX, iconY, kIconWH, kIconWH);
    
    // 3.Content
    CGFloat contentX = CGRectGetMaxX(_iconF) + kCellBorderW;
    CGFloat contentY = iconY;
    CGSize contentSize = [message.content sizeWithFont:kContentFont constrainedToSize:CGSizeMake(kContentMaxW, MAXFLOAT)];
    CGFloat contentW = contentSize.width;
    CGFloat contentH = contentSize.height;
    _contentF = CGRectMake(contentX, contentY, contentW, contentH);
    
    // 4.CellHeight
    CGFloat max = MAX(CGRectGetMaxY(_iconF), CGRectGetMaxY(_contentF));
    _cellHeight = max + kCellBorderW;
    
}

@end
