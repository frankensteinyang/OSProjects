//
//  WhatsAppContacts.h
//  WhatsAppContacts
//
//  Created by Hannibal Yang on 11/24/14.
//  Copyright (c) 2014 Hannibal Yang. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Common.h"

@interface WhatsAppContacts : NSObject

@property (nonatomic, copy) NSString *name; // 昵称
@property (nonatomic, copy) NSString *icon; // 头像
@property (nonatomic, copy) NSString *introduction; // 个性签名
@property (nonatomic, assign) BOOL isVip; // 是否为会员

kInitH(contacts)

@end
