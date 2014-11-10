//
//  MessageFrame.h
//  WhatsAppLayout
//
//  Created by Hannibal Yang on 11/10/14.
//  Copyright (c) 2014 Hannibal Yang. All rights reserved.
//  一个frame对象对应一个cell，一个frame对象描述一个cell内部所有子控件的位置和尺寸

// 时间的字体
#define kTimeFont [UIFont systemFontOfSize:13]

// 内容的字体
#define kContentFont [UIFont systemFontOfSize:15]

#import <UIKit/UIKit.h>

@class Message;

@interface MessageFrame : NSObject

// 此处用readonly，不允许别人改值，编程经验的体现
@property (nonatomic, assign, readonly) CGRect iconF;
@property (nonatomic, assign, readonly) CGRect contentF;
@property (nonatomic, assign, readonly) CGRect timeF;

@property (nonatomic, assign, readonly) CGFloat cellHeight;

@property (nonatomic, strong) Message *message;

@end
