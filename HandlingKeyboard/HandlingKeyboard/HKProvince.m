//
//  HKProvince.m
//  HandlingKeyboard
//
//  Created by Hannibal Yang on 11/28/14.
//  Copyright (c) 2014 Hannibal Yang. All rights reserved.
//

#import "HKProvince.h"

@implementation HKProvince

- (id)initWithDict:(NSDictionary *)dict {

    if (self = [super init]) {
        self.provinceName = dict[@"name"];
        self.citiesArray = dict[@"cities"];
    }
    return self;
}

kInitM(province)

@end
