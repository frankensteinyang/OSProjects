//
//  MHAStatus.m
//  MyHomepageApp
//
//  Created by Hannibal Yang on 12/3/14.
//  Copyright (c) 2014 Hannibal Yang. All rights reserved.
//

#import "MHAStatus.h"

@implementation MHAStatus

+ (MHAStatus *)statusWithStatusContent:(NSString *)content {

    MHAStatus *status = [[self alloc] init];
    status.statusContent = content;
    status.statusTime = [NSDate date];
    return status;
}

@end
