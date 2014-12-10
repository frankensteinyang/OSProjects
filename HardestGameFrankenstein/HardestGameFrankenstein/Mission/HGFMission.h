//
//  HGFMission.h
//  HardestGameFrankenstein
//
//  Created by Hannibal Yang on 12/10/14.
//  Copyright (c) 2014 Hannibal Yang. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface HGFMission : NSObject

@property (nonatomic, copy) NSString *icon;
@property (nonatomic, copy) NSString *title;
@property (nonatomic, copy) NSString *introduction;
@property (nonatomic, assign) int number;

+ (id)missionWithDict:(NSDictionary *)dict;

@end
