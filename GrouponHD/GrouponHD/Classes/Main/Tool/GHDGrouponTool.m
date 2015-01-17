//
//  GHDGrouponTool.m
//  GrouponHD
//
//  Created by Frankenstein Yang on 1/17/15.
//  Copyright (c) 2015 Frankenstein Yang. All rights reserved.
//

#import "GHDGrouponTool.h"
#import "GHDAPITool.h"

@implementation GHDGrouponTool

+ (void)findDeals:(GHDFindGrouponsParam *)param success:(void (^)(GHDFindGrouponsResult *))success failure:(void (^)(NSError *))failure {

    [[GHDAPITool sharedAPITool] request:@"v1/deal/find_deals" params:param.keyValues success:^(id json) {
        if (success) {
            GHDFindGrouponsResult *obj = [GHDFindGrouponsResult objectWithKeyValues:json];
            success(obj);
        }
    } failure:failure];
    
}

+ (void)getSingleDeal:(GHDGetSingleGrouponParam *)param success:(void (^)(GHDGetSingleGrouponResult *))success failure:(void (^)(NSError *))failure {

    [[GHDAPITool sharedAPITool] request:@"v1/deal/get_single_deal" params:param.keyValues success:^(id json) {
        if (success) {
            GHDGetSingleGrouponResult *obj = [GHDGetSingleGrouponResult objectWithKeyValues:json];
            success(obj);
        }
    } failure:failure];
    
}

@end
