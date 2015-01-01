//
//  Password.m
//  PasswordManager
//
//  Created by Hannibal Yang on 1/1/15.
//  Copyright (c) 2015 Frankenstein Yang. All rights reserved.
//

#import "Password.h"

@implementation Password

+ (id)passwordWithID:(NSInteger)ID account:(NSString *)account password:(NSString *)password info:(NSString *)info {

    Password *p = [[Password alloc] init];
    p.ID = ID;
    p.account = account;
    p.password = password;
    p.info = info;
    
    return p;
    
}

@end
