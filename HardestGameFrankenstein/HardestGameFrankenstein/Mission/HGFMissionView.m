//
//  HGFMissionView.m
//  HardestGameFrankenstein
//
//  Created by Hannibal Yang on 12/11/14.
//  Copyright (c) 2014 Hannibal Yang. All rights reserved.
//

#import "HGFMissionView.h"

@implementation HGFMissionView

+ (id)missionView {

    return [[NSBundle mainBundle] loadNibNamed:@"HGFMissionView" owner:nil options:nil][0];
}

- (void)setMission:(HGFMission *)mission {

    _mission = mission;
    [_missionBtnImg setBackgroundImage:[UIImage imageNamed:mission.icon] forState:UIControlStateNormal];
    [_missionBtnNum setTitle:[NSString stringWithFormat:@"%d", mission.number] forState:UIControlStateNormal];
}

@end
