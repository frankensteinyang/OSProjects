//
//  ViewController.m
//  PasswordManager
//
//  Created by Hannibal Yang on 12/31/14.
//  Copyright (c) 2014 Frankenstein Yang. All rights reserved.
//

#import "ViewController.h"
#import <sqlite3.h>
#import "NSString+DocDir.h"
#import "Password.h"

@interface ViewController () {

    // 数据库句柄
    sqlite3 *_db;
}

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self openDB];
    [self createTable];
    Password *p = [Password passwordWithID:0 account:@"fredisalmighty@hotmail.com" password:@"jinzhong" info:@"密保问题不是这个。"];
    [self insertData:p];
    [self allPasswords];
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

#pragma mark 插入数据
- (void)insertData:(Password *)password {

    NSString *sql = [NSString stringWithFormat:@"INSERT INTO PasswordManager (account, password, info) VALUES ('%@', '%@', '%@')", password.account, password.password, password.info];
    [self executeSQL:sql message:@"添加密码"];
    
}

#pragma mark 查询所有密码
- (void)allPasswords {

    NSString *sql = @"SELECT * FROM PasswordManager";
    sqlite3_stmt *stmt = NULL;
    if (SQLITE_OK == sqlite3_prepare_v2(_db, [sql UTF8String], -1, &stmt, NULL)) {
        NSLog(@"查询语句正确！");
    } else {
        NSLog(@"查询语句错误！");
    }
    
}

@end
