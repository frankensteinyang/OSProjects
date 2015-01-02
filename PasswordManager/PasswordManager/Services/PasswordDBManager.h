//
//  PasswordDBManager.h
//  PasswordManager
//
//  Created by Frankenstein Yang on 1/2/15.
//  Copyright (c) 2015 Frankenstein Yang. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Password.h"

@interface PasswordDBManager : NSObject

/**
 面向接口开发
 */
// 新增
- (void)addPassword:(Password *)password;

// 更新
- (void)updatePassword:(Password *)password;

// 删除
- (void)removePassword:(NSInteger)passwordID;

// 查询
- (NSArray *)allPasswords;

+ (instancetype)sharedPasswordDBManager;

@end
