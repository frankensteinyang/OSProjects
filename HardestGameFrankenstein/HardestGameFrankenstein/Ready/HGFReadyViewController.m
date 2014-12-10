//
//  HGFReadyViewController.m
//  HardestGameFrankenstein
//
//  Created by Hannibal Yang on 12/11/14.
//  Copyright (c) 2014 Hannibal Yang. All rights reserved.
//

#import "HGFReadyViewController.h"
#import "HGFMission.h"

@interface HGFReadyViewController ()

@end

@implementation HGFReadyViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    // 设置关卡编号
    _missionLabel.text = [NSString stringWithFormat:@"Mission %d", _mission.number];
    // 设置关卡Logo
    [_missionBtn setBackgroundImage:[UIImage imageNamed:_mission.icon] forState:UIControlStateNormal];
    // 设置关卡简介
    _introductionLabel.text = _mission.introduction;
    
}

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}

@end
