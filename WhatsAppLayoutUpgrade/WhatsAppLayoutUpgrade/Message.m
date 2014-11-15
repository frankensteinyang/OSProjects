//
//  Message.m
//  WhatsAppLayout
//
//  Created by Hannibal Yang on 11/10/14.
//  Copyright (c) 2014 Hannibal Yang. All rights reserved.
//

#import "Message.h"

@implementation Message

+ (id)messageWithDict:(NSDictionary *)dict {
    
    Message *msg = [[self alloc] init];
    msg.time = dict[@"time"];
    msg.icon = dict[@"icon"];
    msg.type = [dict[@"type"] intValue];
    msg.content = dict[@"content"];
    return msg;
}

@end
