//
//  GHDAPITool.m
//  GrouponHD
//
//  Created by Frankenstein Yang on 1/17/15.
//  Copyright (c) 2015 Frankenstein Yang. All rights reserved.
//

#import "GHDAPITool.h"
#import "DPAPI.h"

@interface GHDAPITool() <DPRequestDelegate>

@property (nonatomic, strong) DPAPI *api;

@end

@implementation GHDAPITool

GHDSingletonM(APITool)

- (DPAPI *)api
{
    if (_api == nil) {
        self.api = [[DPAPI alloc] init];
    }
    return _api;
}

- (void)request:(NSString *)url params:(NSDictionary *)params success:(void (^)(id))success failure:(void (^)(NSError *))failure
{
    DPRequest *request = [self.api requestWithURL:url params:[NSMutableDictionary dictionaryWithDictionary:params] delegate:self];
    request.success = success;
    request.failure = failure;
}

#pragma mark -  DPRequestDelegate
- (void)request:(DPRequest *)request didFinishLoadingWithResult:(id)result
{
    if (request.success) {
        request.success(result);
    }
}

- (void)request:(DPRequest *)request didFailWithError:(NSError *)error
{
    if (request.failure) {
        request.failure(error);
    }
}

@end
