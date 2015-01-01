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
    
//    NSArray *array = @[@"frankenstein@gmail.com", @"56464", @"wenti"];
//    for (NSInteger i = 0; i < 10; i++) {
//        NSString *account = [NSString stringWithFormat:@"%04d%@", arc4random_uniform(10000), array[arc4random_uniform(array.count)]];
//        NSString *password = [NSString stringWithFormat:@"%04d%@", arc4random_uniform(1000000), array[arc4random_uniform(array.count)]];
//        NSString *info = [NSString stringWithFormat:@"%04d%@", arc4random_uniform(100), array[arc4random_uniform(array.count)]];
//        Password *p = [Password passwordWithID:0 account:account password:password info:info];
//        [self insertData:p];
//    }
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

    NSString *sql = @"SELECT ID, account, password, info FROM PasswordManager";
    sqlite3_stmt *stmt = NULL;
    if (SQLITE_OK == sqlite3_prepare_v2(_db, [sql UTF8String], -1, &stmt, NULL)) {
        NSLog(@"查询语句正确！");
        while (SQLITE_ROW == sqlite3_step(stmt)) {
            int ID = sqlite3_column_int(stmt, 0);
            const unsigned char *account = sqlite3_column_text(stmt, 1);
            NSString *accountUTF8 = [NSString stringWithUTF8String:(const char *)account];
            const unsigned char *password = sqlite3_column_text(stmt, 2);
            NSString *passwordUTF8 = [NSString stringWithUTF8String:(const char *)password];
            const unsigned char *info = sqlite3_column_text(stmt, 3);
            NSString *infoUTF8 = [NSString stringWithUTF8String:(const char *)info];
            
            Password *p = [Password passwordWithID:ID account:accountUTF8 password:passwordUTF8 info:infoUTF8];
            NSLog(@"%@", p);
        }
    } else {
        NSLog(@"查询语句错误！");
    }
    
}

@end
