//
//  CityPickerProvince.m
//  CityPicker
//
//  Created by Hannibal Yang on 11/26/14.
//  Copyright (c) 2014 Hannibal Yang. All rights reserved.
//

#import "CityPickerProvince.h"

@implementation CityPickerProvince

kInitM(province)

- (id)initWithDict:(NSDictionary *)dict {

    if (self = [super init]) {
        self.name = dict[@"name"];
        self.cities = dict[@"cities"];
    }
    return self;
}

@end
