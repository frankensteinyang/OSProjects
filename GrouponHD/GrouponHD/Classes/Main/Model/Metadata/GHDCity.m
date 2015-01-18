//
//  GHDCity.m
//  GrouponHD
//
//  Created by Frankenstein Yang on 1/18/15.
//  Copyright (c) 2015 Frankenstein Yang. All rights reserved.
//

#import "GHDCity.h"
#import "GHDDistrict.h"

@implementation GHDCity

- (NSDictionary *)objectClassInArray {

    return @{@"districts" : [GHDDistrict class]};
}

@end
