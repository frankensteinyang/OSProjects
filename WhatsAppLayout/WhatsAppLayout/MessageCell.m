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
        [_timeBtn setBackgroundImage:[UIImage imageNamed:@"chat_timeline_bg.png"] forState:UIControlStateNormal];
        [self.contentView addSubview:_timeBtn];
  
        // 按钮中默认有两个子控件_timeBtn.titleLabel和_timeBtn.imageView
        // 设置按钮上面的图片，调用setImage设置的图片，都设置到了_timeBtn.imageView上面
        // [_timeBtn setImage:<#(UIImage *)#> forState:<#(UIControlState)#>];
        // 设置背景图片，调用setBackgroundImage设置的图片跟_timeBtn.imageView没关系
        // [_timeBtn setBackgroundImage:<#(UIImage *)#> forState:<#(UIControlState)#>];
        
        // **********************************************************
        // _timeBtn.titleLabel.text = @"hannibal";
        // _timeBtn.titleLabel.textColor = [UIColor blackColor];
        // 按钮是讲究状态的，上面两行代码均未传forState的状态，所以用上面两行代码代替下面两行没有任何效果
        // [_timeBtn setTitle:<#(NSString *)#> forState:<#(UIControlState)#>];
        // [_timeBtn setTitleColor:<#(UIColor *)#> forState:<#(UIControlState)#>];
        // _contentBtn.titleLabel.numberOfLines不分状态，故可用
        // **********************************************************
        
        _iconView = [[UIImageView alloc] init];
        [self.contentView addSubview:_iconView];
        
        // iOS SDK 7 控件特性 UIButtonTypeRoundedRect圆角失效
        // iOS SDK 6 按钮显示Border；iOS SDK 7中默认为透明无Border
        // iOS SDK 7 下按钮四角都是方形，UIButtonTypeRoundedRect无效
        _contentBtn = [UIButton buttonWithType:UIButtonTypeCustom];
        // 设置按钮圆角半径
        [_contentBtn.layer setCornerRadius:8];
        [_contentBtn setBackgroundColor:[UIColor redColor]];
        
        // 设置字体颜色
        [_contentBtn setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
        // 设置字体
        _contentBtn.titleLabel.font = kContentFont;
        // 是否换行
        _contentBtn.titleLabel.numberOfLines = 0;
        // 设置按钮内边缘的空白间距（此范围中不会显示文字以及图片）
        _contentBtn.contentEdgeInsets = UIEdgeInsetsMake(kContentHMargin, kContentWMargin, kContentHMargin, kContentWMargin);
        [self.contentView addSubview:_contentBtn];
    }
    return self;
}

#pragma mark 传递了模型数据和frame数据 [装配子控件]
- (void)setMessageFrame:(MessageFrame *)messageFrame {
    
    _messageFrame = messageFrame;
    
    // 具体数据
    Message *msg = messageFrame.message;
    
    _timeBtn.frame = messageFrame.timeF;
    [_timeBtn setTitle:msg.time forState:UIControlStateNormal];
    
    _iconView.frame = messageFrame.iconF;
    _iconView.image = [UIImage imageNamed:msg.icon];
    
    _contentBtn.frame = messageFrame.contentF;
    [_contentBtn setTitle:msg.content forState:UIControlStateNormal];
    
}

+ (id)ID {
    return @"MessageIdentifier";
}

@end
