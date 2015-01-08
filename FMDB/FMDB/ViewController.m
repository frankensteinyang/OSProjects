//
//  ViewController.m
//  FMDB
//
//  Created by Frankenstein Yang on 1/8/15.
//  Copyright (c) 2015 Frankenstein Yang. All rights reserved.
//

#import "ViewController.h"
#import "FMDB.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    // FMDB中除查询以外的所有操作，都称为“更新”
    NSString *doc = [NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES) lastObject];
    
    NSString *filename = [doc stringByAppendingPathComponent:@""];
    
    FMDatabase *db = [FMDatabase databaseWithPath:filename];
    
    if ([db open]) {
        BOOL result = [db executeUpdate:@"CREATE TABLE IF NOT EXISTS t_student (id integer PRIMARY KEY AUTOINCREMENT, name text NOT NULL, age integer NOT NULL);"];
        
        if (result) {
            NSLog(@"创建表成功！");
        } else {
            NSLog(@"创建表失败！");
        }
    }
    
}

- (void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event {

    [self insert];
}

- (void)insert {

    
}

@end
