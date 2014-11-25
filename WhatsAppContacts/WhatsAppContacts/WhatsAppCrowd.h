//
//  WhatsAppCrowd.h
//  WhatsAppContacts
//
//  Created by Hannibal Yang on 11/24/14.
//  Copyright (c) 2014 Hannibal Yang. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Common.h"

@interface WhatsAppCrowd : NSObject

@property (nonatomic, copy) NSString *crowdName; // 组名
@property (nonatomic, assign) int onlineContacts; // 在线人数
@property (nonatomic, strong) NSArray *contactsArray; // 组中联系人
@property (nonatomic, assign) BOOL crowdStatus; // 组的闭合状态

kInitH(crowd)

@end
