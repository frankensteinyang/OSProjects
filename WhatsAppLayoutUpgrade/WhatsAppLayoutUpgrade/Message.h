//
//  Message.h
//  WhatsAppLayout
//
//  Created by Hannibal Yang on 11/10/14.
//  Copyright (c) 2014 Hannibal Yang. All rights reserved.
//

#import <Foundation/Foundation.h>

typedef enum {
    MessageTypeMe = 0, // 我发的信息状态
    MessageTypeOther = 1 // 别人发的信息状态
} MessageType;
@interface Message : NSObject

@property (nonatomic, copy) NSString *content;
@property (nonatomic, copy) NSString *icon;
@property (nonatomic, copy) NSString *time;
@property (nonatomic, assign) MessageType type;

- (id)initWithDict:(NSDictionary *)dict;
+ (id)messageWithDict:(NSDictionary *)dict;

@end
