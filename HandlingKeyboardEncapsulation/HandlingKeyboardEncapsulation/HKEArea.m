//
//  HKEArea.m
//  HandlingKeyboardEncapsulation
//
//  Created by Hannibal Yang on 11/28/14.
//  Copyright (c) 2014 Hannibal Yang. All rights reserved.
//

#import "HKEArea.h"

@implementation HKEArea

- (id)initWithDict:(NSDictionary *)dict {

    if (self = [super init]) {
        self.provinceName = dict[@"name"];
        self.citiesArray = dict[@"cities"];
    }
    return self;
}

kInitM(area)

@end
