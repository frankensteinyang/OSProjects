//
//  WhatsAppCrowd.m
//  WhatsAppContacts
//
//  Created by Hannibal Yang on 11/24/14.
//  Copyright (c) 2014 Hannibal Yang. All rights reserved.
//

#import "WhatsAppCrowd.h"
#import "WhatsAppContacts.h"

@implementation WhatsAppCrowd

- (id)initWithDict:(NSDictionary *)dict {

    if (self = [super init]) {
        self.crowdName = dict[@"name"];
        self.onlineContacts = [dict[@"onlineContacts"] intValue];
        
        // 解析contacts
        NSMutableArray *temp = [NSMutableArray array];
        NSArray *arrayContacts = dict[@"contacts"];
        for (NSDictionary *cDict in arrayContacts) {
            WhatsAppContacts *wac = [WhatsAppContacts contactsWithDict:cDict];
            [temp addObject:wac];
        }
        self.contactsArray = temp;
    }
    return self;
}

kInitM(crowd)

@end
