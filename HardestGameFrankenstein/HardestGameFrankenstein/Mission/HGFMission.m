//
//  HGFMission.m
//  HardestGameFrankenstein
//
//  Created by Hannibal Yang on 12/10/14.
//  Copyright (c) 2014 Hannibal Yang. All rights reserved.
//

#import "HGFMission.h"

@implementation HGFMission

+ (id)missionWithDict:(NSDictionary *)dict {

    HGFMission *mission = [[self alloc] init];
    mission.icon = dict[@"icon"];
    mission.title = dict[@"title"];
    // 字典会自动把\n转为\\n，所以这里要再次替换过来
    mission.introduction = [dict[@"intro"] stringByReplacingOccurrencesOfString:@"\\n" withString:@"\n"];
    return mission;
}

@end
