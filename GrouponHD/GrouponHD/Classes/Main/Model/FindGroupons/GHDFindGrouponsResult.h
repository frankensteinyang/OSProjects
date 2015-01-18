//
//  GHDFindGrouponsResult.h
//  GrouponHD
//
//  Created by Frankenstein Yang on 1/17/15.
//  Copyright (c) 2015 Frankenstein Yang. All rights reserved.
//

#import "GHDGetSingleGrouponResult.h"

@interface GHDFindGrouponsResult : GHDGetSingleGrouponResult

/** 所有页面团购总数 */
@property (assign, nonatomic) int total_count;

@end
