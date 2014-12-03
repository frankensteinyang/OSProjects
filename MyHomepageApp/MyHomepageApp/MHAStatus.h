//
//  MHAStatus.h
//  MyHomepageApp
//
//  Created by Hannibal Yang on 12/3/14.
//  Copyright (c) 2014 Hannibal Yang. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface MHAStatus : NSObject

@property (nonatomic, copy) NSString *statusContent;
@property (nonatomic, strong) NSDate *statusTime;

+ (MHAStatus *)statusWithStatusContent:(NSString *)content;

@end
