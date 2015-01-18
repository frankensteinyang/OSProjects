//
//  GHDCityGroup.h
//  GrouponHD
//
//  Created by Frankenstein Yang on 1/18/15.
//  Copyright (c) 2015 Frankenstein Yang. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface GHDCityGroup : NSObject

/** 组标题 */
@property (copy, nonatomic) NSString *title;
/** 这组显示的城市 */
@property (strong, nonatomic) NSArray *cities;

@end
