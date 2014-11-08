//
//  Twitter.m
//  UsingCodeToCreateCell
//
//  Created by Hannibal Yang on 11/8/14.
//  Copyright (c) 2014 Hannibal Yang. All rights reserved.
//

#import "Twitter.h"

@implementation Twitter

- (id)initWithDict:(NSDictionary *)dict {
    if (self = [super init]) {
        self.nickname = dict[@"name"];
        self.source = dict[@"source"];
        self.time = dict[@"time"];
        self.isVip = [dict[@"vip"] boolValue];
        self.icon = dict[@"icon"];
        self.image = dict[@"image"];
        self.content = dict[@"content"];
    }
    return self;
}

+ (id)twitterWithDick:(NSDictionary *)dict {
    return  [[self alloc] initWithDict:dict];
}

@end
