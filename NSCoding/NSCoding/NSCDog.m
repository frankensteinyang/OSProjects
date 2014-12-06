//
//  NSCDog.m
//  NSCoding
//
//  Created by Hannibal Yang on 12/6/14.
//  Copyright (c) 2014 Hannibal Yang. All rights reserved.
//

#import "NSCDog.h"

@implementation NSCDog

- (void)encodeWithCoder:(NSCoder *)aCoder {

    [super encodeWithCoder:aCoder];
    [aCoder encodeInt:_legs forKey:@"legs"];
    NSLog(@"NSCDog encodeWithCoder");
}

- (id)initWithCoder:(NSCoder *)aDecoder {

    if (self = [super initWithCoder:aDecoder]) {
        NSLog(@"NSCDog initWithCoder");
        _legs = [aDecoder decodeIntForKey:@"legs"];
    }
    return self;
}

@end
