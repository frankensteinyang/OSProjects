//
//  Ticket.m
//  TicketingSystem
//
//  Created by Frankenstein Yang on 1/4/15.
//  Copyright (c) 2015 Frankenstein Yang. All rights reserved.
//

#import "Ticket.h"

// 全局静态变量
static Ticket *_instance;

@implementation Ticket

// 所有对象的实例化都会调用allocWithZone
+ (id)allocWithZone:(struct _NSZone *)zone {

    // 单线程
//    if (_instance == nil) {
//        _instance = [super allocWithZone:zone];
//    }
//    return _instance;
    
    // 多线程 dispatch_once()
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        _instance = [super allocWithZone:zone];
    });
    return _instance;
    
}

+ (instancetype)sharedTicket {

    if (_instance == nil) {
        _instance = [[Ticket alloc] init];
    }
    return _instance;
}

@end
