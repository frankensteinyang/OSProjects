//
//  NSString+DocDir.h
//  01.SQLite基本使用
//
//  Created by 刘凡 on 14-1-6.
//  Copyright (c) 2014年 itcast. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSString (DocDir)

/**
 *  在指定字符串之前追加沙盒文档路径
 *
 *  @return 包含沙盒文档路径的完整文件路径
 */
- (NSString *)appendDocumentDir;

@end
