//
//  Password.h
//  PasswordManager
//
//  Created by Hannibal Yang on 1/1/15.
//  Copyright (c) 2015 Frankenstein Yang. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Password : NSObject

@property (nonatomic, assign) NSInteger ID;
@property (nonatomic, strong) NSString *account;
@property (nonatomic, strong) NSString *password;
@property (nonatomic, strong) NSString *info;

// 工厂方法
+ (id)passwordWithID:(NSInteger)ID account:(NSString *)account password:(NSString *)password info:(NSString *)info;

@end
