//
//  NSCAnimal.m
//  NSCoding
//
//  Created by Hannibal Yang on 12/6/14.
//  Copyright (c) 2014 Hannibal Yang. All rights reserved.
//

#import "NSCAnimal.h"

@implementation NSCAnimal

- (void)encodeWithCoder:(NSCoder *)aCoder {

    [aCoder encodeObject:_furColor forKey:@"color"];
    [aCoder encodeDouble:_weight forKey:@"weight"];
    [aCoder encodeInt:_legs forKey:@"legs"];
}

- (id)initWithCoder:(NSCoder *)aDecoder {

    if (self = [super init]) {
        _furColor = [aDecoder decodeObjectForKey:@"color"];
        _weight = [aDecoder decodeDoubleForKey:@"weight"];
        _legs = [aDecoder decodeIntegerForKey:@"legs"];
    }
    return self;
}

@end
