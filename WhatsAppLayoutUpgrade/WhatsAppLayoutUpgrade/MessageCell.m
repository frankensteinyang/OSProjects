//
//  MessageCell.m
//  WhatsAppLayout
//
//  Created by Hannibal Yang on 11/10/14.
//  Copyright (c) 2014 Hannibal Yang. All rights reserved.
//

#import "MessageCell.h"
#import "MessageFrame.h"
#import "Message.h"
#import "UIImage+Resize.h"

// 创建的子控件要拿到setMessageFrame中装配子控件，用成员变量，所以用类扩展
@interface MessageCell() {
    UIButton *_timeBtn;
    UIImageView *_iconView;
    UIButton *_contentBtn;
}

@end

@implementation MessageCell

#pragma mark [创建子控件] 注：凡是一次性的设置，都在init方法中进行
- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        _timeBtn = [[UIButton alloc] init];
        _timeBtn.enabled = NO;
        // 设置文字颜色
        [_timeBtn setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
        _timeBtn.titleLabel.font = kTimeFont;
        [_timeBtn setBackgroundImage:[UIImage resizedImage:@"chat_timeline_bg.png"] forState:UIControlStateNormal];
        [self.contentView addSubview:_timeBtn];
        
        _iconView = [[UIImageView alloc] init];
        [self.contentView addSubview:_iconView];
        
        _contentBtn = [UIButton buttonWithType:UIButtonTypeCustom];
        // 设置字体颜色
        [_contentBtn setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
        // 设置字体
        _contentBtn.titleLabel.font = kContentFont;
        // 是否换行
        _contentBtn.titleLabel.numberOfLines = 0;
        [self.contentView addSubview:_contentBtn];
    }
    return self;
}

#pragma mark 传递了模型数据和frame数据 [装配子控件]
- (void)setMessageFrame:(MessageFrame *)messageFrame {
    
    _messageFrame = messageFrame;
    
    // 具体数据
    Message *msg = messageFrame.message;
    
    // Time
    if (messageFrame.showTime) {
        _timeBtn.hidden = NO;
        _timeBtn.frame = messageFrame.timeF;
        [_timeBtn setTitle:msg.time forState:UIControlStateNormal];
    } else {
        _timeBtn.hidden = YES;
    }
    
    // Icon
    _iconView.frame = messageFrame.iconF;
    _iconView.image = [UIImage imageNamed:msg.icon];
    
    // Content
    _contentBtn.frame = messageFrame.contentF;
    [_contentBtn setTitle:msg.content forState:UIControlStateNormal];
    
    NSString *normal = nil, *focused = nil;
    if (msg.type == MessageTypeMe) {
        normal = @"chatto_bg_normal.png";
        focused = @"chatto_bg_focused.png";
        _contentBtn.contentEdgeInsets = UIEdgeInsetsMake(kContentHTopMargin, kContentWMinMargin, kContentHBottomMargin, kContentWMaxMargin);
    } else {
        normal = @"chatfrom_bg_normal.png";
        focused = @"chatfrom_bg_focused.png";
        _contentBtn.contentEdgeInsets = UIEdgeInsetsMake(kContentHTopMargin, kContentWMaxMargin, kContentHBottomMargin, kContentWMinMargin);
    }
    
    [_contentBtn setBackgroundImage:[UIImage resizedImage:normal left:0.5 top:0.7] forState:UIControlStateNormal];
    [_contentBtn setBackgroundImage:[UIImage resizedImage:focused left:0.5 top:0.7] forState:UIControlStateHighlighted];
    
}

+ (id)ID {
    return @"MessageIdentifier";
}

@end
