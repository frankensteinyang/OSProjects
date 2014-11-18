//
//  Message.m
//  WhatsAppLayout
//
//  Created by Hannibal Yang on 11/10/14.
//  Copyright (c) 2014 Hannibal Yang. All rights reserved.
//

#import "Message.h"

@implementation Message

// self只能放在构造方法中赋值，构造方法必须以init开头，并且init后面单词的首字母必须大写
- (id)initWithDict:(NSDictionary *)dict {
    
    if (self = [super init]) {
        self.time = dict[@"time"];
        self.icon = dict[@"icon"];
        self.type = [dict[@"type"] intValue];
        self.content = dict[@"content"];
    }
    return self;
}

+ (id)messageWithDict:(NSDictionary *)dict {
    
    return [[self alloc] initWithDict:dict];
}

@end
