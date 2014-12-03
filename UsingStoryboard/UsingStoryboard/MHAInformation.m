//
//  MHAInformation.m
//  UsingStoryboard
//
//  Created by Hannibal Yang on 12/4/14.
//  Copyright (c) 2014 Hannibal Yang. All rights reserved.
//

#import "MHAInformation.h"

@implementation MHAInformation

+ (MHAInformation *)informationWithName:(NSString *)name {

    MHAInformation *info = [[self alloc] init];
    info.nickname = name;
    return info;
}

@end
