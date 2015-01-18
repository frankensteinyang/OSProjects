//
//  GHDMetadataTool.h
//  GrouponHD
//
//  Created by Frankenstein Yang on 1/18/15.
//  Copyright (c) 2015 Frankenstein Yang. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "GHDSingleton.h"

@interface GHDMetadataTool : NSObject

GHDSingletonH(MetadataTool)

/**
 *  所有的分类
 */
@property (strong, nonatomic, readonly) NSArray *categories;
/**
 *  所有的城市
 */
@property (strong, nonatomic, readonly) NSArray *cities;
/**
 *  所有的城市组
 */
@property (strong, nonatomic, readonly) NSArray *cityGroups;
/**
 *  所有的排序
 */
@property (strong, nonatomic, readonly) NSArray *sorts;

@end
