//
//  CPCountry.m
//  CountryPicker
//
//  Created by Hannibal Yang on 11/27/14.
//  Copyright (c) 2014 Hannibal Yang. All rights reserved.
//

#import "CPCountry.h"

@implementation CPCountry

- (id)initWithDict:(NSDictionary *)dict {

    if (self = [super init]) {
        self.name = dict[@"name"];
        self.icon = dict[@"icon"];
    }
    return self;
}

kInitM(country)

@end
