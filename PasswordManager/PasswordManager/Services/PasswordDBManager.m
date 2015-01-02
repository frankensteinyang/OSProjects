//
//  PasswordDBManager.m
//  PasswordManager
//
//  Created by Frankenstein Yang on 1/2/15.
//  Copyright (c) 2015 Frankenstein Yang. All rights reserved.
//

#import "PasswordDBManager.h"

// 全局变量
static PasswordDBManager *_instance;

@implementation PasswordDBManager

/**
 单例:
 1. 全局变量
 2. 重写allocWithZone
 3. Shared方法
 */
+ (id)allocWithZone:(struct _NSZone *)zone {

    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        _instance = [super allocWithZone:zone];
    });
    
    return _instance;
}

+ (instancetype)sharedPasswordDBManager {

    if (_instance == nil) {
        _instance = [[PasswordDBManager alloc] init];
    }
    return _instance;
}

- (void)addPassword:(Password *)password {

}

- (void)removePassword:(NSInteger)passwordID {

}

- (void)updatePassword:(Password *)password {

}

- (NSArray *)allPasswords {

    return nil;
}

@end
