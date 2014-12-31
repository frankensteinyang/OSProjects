//
//  NSArray+Log.m
//
//  Created by 刘凡 on 13-11-24.
//  Copyright (c) 2013年 itcast. All rights reserved.
//

#import "NSArray+Log.h"

@implementation NSArray (Log)

- (NSString *)descriptionWithLocale:(id)locale
{
    NSMutableString *strM = [NSMutableString stringWithFormat:@"%d (\n", self.count];

    [self enumerateObjectsUsingBlock:^(id obj, NSUInteger idx, BOOL *stop) {
        [strM appendFormat:@"\t%@", obj];

        if (idx < self.count - 1) {
            [strM appendString:@",\n"];
        }
    }];
    [strM appendString:@"\n)"];

    return strM;
}

@end
