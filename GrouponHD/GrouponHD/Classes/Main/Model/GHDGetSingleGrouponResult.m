//
//  GHDGetSingleGrouponResult.m
//  GrouponHD
//
//  Created by Frankenstein Yang on 1/17/15.
//  Copyright (c) 2015 Frankenstein Yang. All rights reserved.
//

#import "GHDGetSingleGrouponResult.h"
#import "GHDGroupon.h"

@implementation GHDGetSingleGrouponResult

- (NSDictionary *)objectClassInArray
{
    return @{@"deals" : [GHDGroupon class]};
}

@end
