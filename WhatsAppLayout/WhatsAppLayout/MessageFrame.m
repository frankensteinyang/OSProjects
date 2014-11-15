//
//  MessageFrame.m
//  WhatsAppLayout
//
//  Created by Hannibal Yang on 11/10/14.
//  Copyright (c) 2014 Hannibal Yang. All rights reserved.
//

// cell的边框
#define kCellBorderW 10

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
    if (_showTime) {
        CGFloat timeY = kCellBorderW;
        CGSize timeSize = [message.time sizeWithFont:kTimeFont];
        CGFloat timeW = timeSize.width + 18;
        CGFloat timeX = (screenW - timeW) * 0.5;
        CGFloat timeH = timeSize.height + 6;
        _timeF = CGRectMake(timeX, timeY, timeW, timeH);
    }
    
    // 2.Icon
    CGFloat iconX = kCellBorderW;
    if (message.type == MessageTypeMe) {
        iconX = screenW - kIconWH - kCellBorderW;
    }
    
    CGFloat iconY = CGRectGetMaxY(_timeF) + kCellBorderW;
    _iconF = CGRectMake(iconX, iconY, kIconWH, kIconWH);
    
    // 3.Content
    CGFloat contentX = CGRectGetMaxX(_iconF) + kCellBorderW;
    CGFloat contentY = iconY;
    CGSize contentSize = [message.content sizeWithFont:kContentFont constrainedToSize:CGSizeMake(kContentMaxW, MAXFLOAT)];
    CGFloat contentW = contentSize.width + kContentWMinMargin + kContentWMaxMargin;
    CGFloat contentH = contentSize.height + kContentHTopMargin + kContentHBottomMargin;
    if (message.type == MessageTypeMe) {
        contentX = _iconF.origin.x - kCellBorderW - contentW;
    }
    _contentF = CGRectMake(contentX, contentY, contentW, contentH);
    
    // 4.CellHeight
    CGFloat max = MAX(CGRectGetMaxY(_iconF), CGRectGetMaxY(_contentF));
    _cellHeight = max + kCellBorderW;
    
}

- (void)setMessage:(Message *)message showTime:(BOOL)showTime {
    
    _showTime = showTime;
    
    // self.message = message 等于 [self setMessage:message]
    self.message = message;
    
}

@end
