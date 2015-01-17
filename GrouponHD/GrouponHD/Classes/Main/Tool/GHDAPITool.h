//
//  GHDAPITool.h
//  GrouponHD
//
//  Created by Frankenstein Yang on 1/17/15.
//  Copyright (c) 2015 Frankenstein Yang. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "GHDSingleton.h"

@interface GHDAPITool : NSObject

- (void)request:(NSString *)url params:(NSDictionary *)params success:(void (^)(id json))success failure:(void (^)(NSError *error))failure;

GHDSingletonH(APITool)

@end
