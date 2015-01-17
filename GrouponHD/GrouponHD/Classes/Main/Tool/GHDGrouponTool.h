//
//  GHDGrouponTool.h
//  GrouponHD
//
//  Created by Frankenstein Yang on 1/17/15.
//  Copyright (c) 2015 Frankenstein Yang. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "GHDFindGrouponsParam.h"
#import "GHDFindGrouponsResult.h"
#import "GHDGetSingleGrouponParam.h"
#import "GHDGetSingleGrouponResult.h"

@interface GHDGrouponTool : NSObject

/**
 *  搜索团购
 *
 *  @param param   请求参数
 *  @param success 请求成功后的回调
 *  @param failure 请求失败后的回调
 */
+ (void)findDeals:(GHDFindGrouponsParam *)param success:(void (^)(GHDFindGrouponsResult *result))success failure:(void (^)(NSError *error))failure;


/**
 *  获得指定团购（获得单个团购信息）
 */
+ (void)getSingleDeal:(GHDGetSingleGrouponParam *)param success:(void (^)(GHDGetSingleGrouponResult *result))success failure:(void (^)(NSError *error))failure;

@end
