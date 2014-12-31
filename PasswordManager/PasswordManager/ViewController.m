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
    
}

#pragma mark 打开数据库
- (void)openDB {

    // 设置沙盒中的文件路径
    NSString *dbPath = [@"Frankenstein" appendDocumentDir];
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
    NSString *sql = @"CREATE TABLE IF NOT EXISTS PasswordManager (ID integer NOT NULL, Account text, Password text, Info blob, PRIMARY KEY(ID))";
    // 执行SQL
    char *errmsg = NULL;
    if (SQLITE_OK == sqlite3_exec(_db, [sql UTF8String], NULL, NULL, &errmsg)) {
        NSLog(@"建表成功！");
    } else {
        NSLog(@"建表失败！ - %s", errmsg);
    }
    
}

#pragma mark 插入数据
- (void)insertData {

    
}

@end
