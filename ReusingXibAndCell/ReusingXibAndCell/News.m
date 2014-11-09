//
//  News.m
//  XibCustomisesCell
//
//  Created by Hannibal Yang on 11/10/14.
//  Copyright (c) 2014 Hannibal Yang. All rights reserved.
//

#import "News.h"

@implementation News

- (id)initWithDict:(NSDictionary *)dict {
    if (self = [self init]) {
        
        // **********************************************************************
        // 解析字典属性的一个高效率方法
        // block遍历字典的Keys and Values
        NSLog(@"*************");
        [dict enumerateKeysAndObjectsUsingBlock:^(id key, id obj, BOOL *stop) {
            NSLog(@"key = %@ --- obj = %@", key, obj);
//            SEL selector = NSSelectorFromString(<#NSString *aSelectorName#>);
//            [self performSelector:selector withObject:obj];
            
        }];
        NSLog(@" ");
        // **********************************************************************
        
        // 解析字典属性
        self.title = dict[@"title"];
        self.image = dict[@"icon"];
        self.comments = [dict[@"comments"] intValue];
        self.author = dict[@"author"];
    }
    return self;
}

+ (id)newsWithDict:(NSDictionary *)dict {
    return [[self alloc] initWithDict:dict];
}

@end
