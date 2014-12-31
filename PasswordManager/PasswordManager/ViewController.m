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

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self openDB];
    
}


- (void)openDB {

    // 设置沙盒中的文件路径
    NSString *dbPath = [@"Frankenstein" appendDocumentDir];
    NSLog(@"#%@", dbPath);
    
    sqlite3 *db;
    
    if (SQLITE_OK == sqlite3_open([dbPath UTF8String], &db)) {
        NSLog(@"数据库打开成功！");
    } else {
        NSLog(@"数据库打开失败！");
    }
    
}
@end
