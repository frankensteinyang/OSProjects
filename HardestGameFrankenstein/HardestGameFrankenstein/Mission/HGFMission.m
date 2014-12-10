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
    mission.introduction = dict[@"intro"];
    return mission;
}

@end
