//
//  WhatsAppContacts.m
//  WhatsAppContacts
//
//  Created by Hannibal Yang on 11/24/14.
//  Copyright (c) 2014 Hannibal Yang. All rights reserved.
//

#import "WhatsAppContacts.h"

@implementation WhatsAppContacts

- (id)initWithDict:(NSDictionary *)dict {
    
    if (self = [super init]) {
        self.name = dict[@"name"];
        self.icon = dict[@"icon"];
        self.introduction = dict[@"intro"];
        self.isVip = [dict[@"vip"] boolValue];
    }
    return self;
    
}

kInitM(contacts)

@end

