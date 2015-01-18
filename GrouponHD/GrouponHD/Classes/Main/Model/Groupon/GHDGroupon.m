//
//  GHDGroupon.m
//  GrouponHD
//
//  Created by Frankenstein Yang on 1/17/15.
//  Copyright (c) 2015 Frankenstein Yang. All rights reserved.
//

#import "GHDGroupon.h"
#import "GHDShop.h"

@implementation GHDGroupon

- (NSDictionary *)objectClassInArray
{
    return @{@"businesses" : [GHDShop class]};
}

- (NSDictionary *)replacedKeyFromPropertyName
{
    // 模型的desc属性对应着字典中的description
    return @{@"desc" : @"description"};
}

@end
