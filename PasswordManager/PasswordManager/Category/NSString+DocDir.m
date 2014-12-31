//
//  NSString+DocDir.m
//  01.SQLite基本使用
//
//  Created by 刘凡 on 14-1-6.
//  Copyright (c) 2014年 itcast. All rights reserved.
//

#import "NSString+DocDir.h"

@implementation NSString (DocDir)

- (NSString *)appendDocumentDir
{
    NSString *docDir = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES)[0];

    return [docDir stringByAppendingPathComponent:self];
}

@end
