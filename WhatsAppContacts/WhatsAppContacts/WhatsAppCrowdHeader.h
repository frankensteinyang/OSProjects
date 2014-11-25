//
//  WhatsAppCrowdHeader.h
//  WhatsAppContacts
//
//  Created by Hannibal Yang on 11/25/14.
//  Copyright (c) 2014 Hannibal Yang. All rights reserved.
//

#import <UIKit/UIKit.h>
@class WhatsAppCrowd, WhatsAppCrowdHeader;

@protocol WhatsAppCrowdHeaderDelegate <NSObject>
@optional
- (void)crowdHeaderClick:(WhatsAppCrowdHeader *)header;
@end

@interface WhatsAppCrowdHeader : UIView

@property (nonatomic, strong) WhatsAppCrowd *crowd;

@property (weak, nonatomic) IBOutlet UIButton *nameBtn;

@property (weak, nonatomic) IBOutlet UILabel *onlineLabel;

// 代理属性
@property (nonatomic, weak) id<WhatsAppCrowdHeaderDelegate> delegate;

// 监听组点击
- (IBAction)crowdClick:(UIButton *)sender;

// 返回创建好的Header控件对象
+ (id)crowdHeader;

@end
