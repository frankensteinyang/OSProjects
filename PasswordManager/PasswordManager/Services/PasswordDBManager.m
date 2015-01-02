//
//  PasswordDBManager.m
//  PasswordManager
//
//  Created by Frankenstein Yang on 1/2/15.
//  Copyright (c) 2015 Frankenstein Yang. All rights reserved.
//

#import "PasswordDBManager.h"
#import <sqlite3.h>
#import "NSString+DocDir.h"

// 全局变量
static PasswordDBManager *_instance;

@interface PasswordDBManager() {
    
    // 全局数据库句柄
    sqlite3 *_db;
}

@end

@implementation PasswordDBManager

#pragma mark - 单例
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

#pragma mark - 数据库操作
- (id)init {

    self = [super init];
    
    // 懒加载数据库连接及创建数据表
    if (self) {
        [self openDB];
        [self createTable];
    }
    return self;
}

#pragma mark 打开数据库
- (void)openDB {
    
    // 设置沙盒中的文件路径
    NSString *dbPath = [@"Frankenstein.db" appendDocumentDir];
    NSLog(@"#%@", dbPath);
    
    _db = NULL;
    if (SQLITE_OK == sqlite3_open([dbPath UTF8String], &_db)) {
        NSLog(@"数据库打开成功！");
    } else {
        NSLog(@"数据库打开失败！");
    }
    
}

#pragma mark 创建数据表
- (void)createTable {
    
    // 定义SQL语句
    NSString *sql = @"CREATE TABLE IF NOT EXISTS PasswordManager (ID integer NOT NULL, account text, password text, info text, PRIMARY KEY(ID))";
    [self executeSQL:sql message:@"创建数据表"];
    
}

#pragma mark 单步执行SQL
- (void)executeSQL:(NSString *)sql message:(NSString *)msg {
    
    char *errmsg = NULL;
    if (SQLITE_OK == sqlite3_exec(_db, [sql UTF8String], NULL, NULL, &errmsg)) {
        NSLog(@"%@成功！", msg);
    } else {
        NSLog(@"%@失败！ - %s", msg, errmsg);
    }
    
}

#pragma mark - 成员方法
- (void)addPassword:(Password *)password {

    NSString *sql = [NSString stringWithFormat:@"INSERT INTO PasswordManager (account, password, info) VALUES ('%@', '%@', '%@')", password.account, password.password, password.info];
    [self executeSQL:sql message:@"添加密码"];
}

- (void)removePassword:(NSInteger)passwordID {

}

- (void)updatePassword:(Password *)password {

}

- (NSArray *)allPasswords {

    NSString *sql = @"SELECT ID, account, password, info FROM PasswordManager ORDER BY account";
    sqlite3_stmt *stmt = NULL;
    
    NSMutableArray *passwords = nil;
    
    if (SQLITE_OK == sqlite3_prepare_v2(_db, [sql UTF8String], -1, &stmt, NULL)) {
        NSLog(@"查询语句正确！");
        
        passwords = [NSMutableArray array];
        
        while (SQLITE_ROW == sqlite3_step(stmt)) {
            int ID = sqlite3_column_int(stmt, 0);
            const unsigned char *account = sqlite3_column_text(stmt, 1);
            NSString *accountUTF8 = [NSString stringWithUTF8String:(const char *)account];
            const unsigned char *password = sqlite3_column_text(stmt, 2);
            NSString *passwordUTF8 = [NSString stringWithUTF8String:(const char *)password];
            const unsigned char *info = sqlite3_column_text(stmt, 3);
            NSString *infoUTF8 = [NSString stringWithUTF8String:(const char *)info];
            
            Password *p = [Password passwordWithID:ID account:accountUTF8 password:passwordUTF8 info:infoUTF8];
            [passwords addObject:p];
            NSLog(@"%@", p);
        }
    } else {
        NSLog(@"查询语句错误！");
    }
    return passwords;
}

@end
