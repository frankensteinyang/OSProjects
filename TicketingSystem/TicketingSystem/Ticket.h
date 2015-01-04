//
//  Ticket.h
//  TicketingSystem
//
//  Created by Frankenstein Yang on 1/4/15.
//  Copyright (c) 2015 Frankenstein Yang. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Ticket : NSObject

@property (nonatomic, assign) NSInteger tickets;

// instancetype限制类型
+ (instancetype)sharedTicket;

@end
