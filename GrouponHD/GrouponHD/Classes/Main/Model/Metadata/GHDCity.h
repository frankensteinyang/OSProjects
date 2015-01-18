//
//  GHDCity.h
//  GrouponHD
//
//  Created by Frankenstein Yang on 1/18/15.
//  Copyright (c) 2015 Frankenstein Yang. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface GHDCity : NSObject

/** 城市名称 */
@property (copy, nonatomic) NSString *name;
/** 区域 */
@property (strong, nonatomic) NSArray *districts;
/** 拼音 beijing */
@property (copy, nonatomic) NSString *pinYin;
/** 拼音首字母 bj */
@property (copy, nonatomic) NSString *pinYinHead;

@end
