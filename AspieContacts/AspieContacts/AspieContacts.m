//
//  AspieContacts.m
//  AspieContacts
//
//  Created by Hannibal Yang on 12/7/14.
//  Copyright (c) 2014 Hannibal Yang. All rights reserved.
//

#import "AspieContacts.h"

@implementation AspieContacts

- (void)encodeWithCoder:(NSCoder *)aCoder {

    [aCoder encodeObject:_name forKey:@"name"];
    [aCoder encodeObject:_phone forKey:@"phone"];
}

- (id)initWithCoder:(NSCoder *)aDecoder {

    if (self = [super init]) {
        self.name = [aDecoder decodeObjectForKey:@"name"];
        self.phone = [aDecoder decodeObjectForKey:@"phone"];
    }
    return self;
}

@end
