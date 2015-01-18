//
//  GHDSort.h
//  GrouponHD
//
//  Created by Frankenstein Yang on 1/18/15.
//  Copyright (c) 2015 Frankenstein Yang. All rights reserved.
//

#import <Foundation/Foundation.h>

/* 1:默认，2:价格低优先，3:价格高优先，4:购买人数多优先，5:最新发布优先，6:即将结束优先，7:离经纬度坐标距离近优先 */
typedef enum {
    GHDSortValueDefault = 1, // 默认排序
    GHDSortValueLowPrice, // 价格最低
    GHDSortValueHighPrice, // 价格最高
    GHDSortValuePopular, // 人气最高
    GHDSortValueLatest, // 最新发布
    GHDSortValueOver, // 即将结束
    GHDSortValueClosest // 离我最近
} GHDSortValue;

@interface GHDSort : NSObject

@property (assign, nonatomic) int value;
@property (copy, nonatomic) NSString *label;

@end
