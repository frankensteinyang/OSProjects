//
//  GHDDistrict.h
//  GrouponHD
//
//  Created by Frankenstein Yang on 1/18/15.
//  Copyright (c) 2015 Frankenstein Yang. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface GHDDistrict : NSObject

/** 区域名称 */
@property (copy, nonatomic) NSString *name;
/** 子区域 */
@property (strong, nonatomic) NSArray *subregions;

@end
