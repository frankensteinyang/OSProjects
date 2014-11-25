//
//  WhatsAppCrowdHeader.m
//  WhatsAppContacts
//
//  Created by Hannibal Yang on 11/25/14.
//  Copyright (c) 2014 Hannibal Yang. All rights reserved.
//

#import "WhatsAppCrowdHeader.h"
#import "WhatsAppCrowd.h"

@implementation WhatsAppCrowdHeader

#pragma mark 当一个对象从xib文件中创建完毕的时候调用一次
- (void)awakeFromNib { // 如想让某一个对象在xib文件创建完毕后做一些事情，用awakeFromNib

    // 居中模式（不拉伸图片），如imageView的矩形长宽不一样，旋转后内容图片的部分会超出imageView
    _nameBtn.imageView.contentMode = UIViewContentModeCenter;
    _nameBtn.imageView.clipsToBounds = NO; // 不裁剪图片超出imageView的部分
}

- (IBAction)crowdClick:(UIButton *)sender {
    
    // 组的闭合的取反
    _crowd.crowdStatus = !_crowd.crowdStatus;
    
    // 通知代理
//    [self.delegate crowdHeaderClick] = [_delegate crowdHeaderClick];
    if ([_delegate respondsToSelector:@selector(crowdHeaderClick:)]) { // 判断是否实现了代理的方法
        [self.delegate crowdHeaderClick:self];
    } else {
        NSLog(@"代理的方法没有实现！");
    }
    
    // 执行动画：crowd箭头图标的旋转
    [UIView animateWithDuration:0.3 animations:^{
        if (_crowd.crowdStatus) {
            // 顺时针旋转90度，二分之PI
            _nameBtn.imageView.transform = CGAffineTransformMakeRotation(M_PI_2);
        } else {
            _nameBtn.imageView.transform = CGAffineTransformIdentity; // 清空
        }
    }];
}

+ (id)crowdHeader {
    
    return [[NSBundle mainBundle] loadNibNamed:@"WhatsAppCrowdHeader" owner:nil options:nil][0];
}

- (void)setCrowd:(WhatsAppCrowd *)crowd {

    _crowd = crowd;
    // 组名
    [_nameBtn setTitle:crowd.crowdName forState:UIControlStateNormal];
    
    // 在线联系人人数
    _onlineLabel.text = [NSString stringWithFormat:@"%d/%d", crowd.onlineContacts, crowd.contactsArray.count];
}

@end
