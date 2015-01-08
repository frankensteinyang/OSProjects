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

@property (nonatomic, strong) FMDatabase *db;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    // FMDB中除查询以外的所有操作，都称为“更新”
    NSString *doc = [NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES) lastObject];
    
    NSString *filename = [doc stringByAppendingPathComponent:@"school.sqlite"];
    
    FMDatabase *db = [FMDatabase databaseWithPath:filename];
    
    if ([db open]) {
        BOOL result = [db executeUpdate:@"CREATE TABLE IF NOT EXISTS t_student (id integer PRIMARY KEY AUTOINCREMENT, name text NOT NULL, age integer NOT NULL);"];
        
        if (result) {
            NSLog(@"创建表成功！");
        } else {
            NSLog(@"创建表失败！");
        }
    }
    
    self.db = db;
    
}

//- (void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event {
//
//    [self insert];
//    [self query];
//    [self delete];
//    
//}

- (IBAction)btnInsert {
    
    for (int i = 0; i < 10; i++) {
        NSString *name = [NSString stringWithFormat:@"Frankenstein-%d", arc4random_uniform(100)];
        // 不确定的参数用?来占位
        //        [self.db executeUpdate:@"INSERT INTO t_student (name, age) VALUES (?, ?);", name, @(arc4random_uniform(40))];
        [self.db executeUpdateWithFormat:@"INSERT INTO t_student (name, age) VALUES (%@, %d);", name, arc4random_uniform(40)];
    }
    
}

- (IBAction)btnDelete {
    
    [self.db executeUpdate:@"DELETE FROM t_student;"];
    
}

- (IBAction)btnQuery {
    
    FMResultSet *resultSet = [self.db executeQuery:@"SELECT * FROM t_student;"];
    while ([resultSet next]) {
        int ID = [resultSet intForColumn:@"id"];
        NSString *name = [resultSet stringForColumn:@"name"];
        int age = [resultSet intForColumn:@"age"];
        NSLog(@"%d %@ %d", ID, name, age);
    }
    
}

//- (void)insert {    
//}

//- (void)delete {
//}

//- (void)query {
//}

@end
