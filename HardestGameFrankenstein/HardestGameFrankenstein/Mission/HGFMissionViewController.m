//
//  HGFMissionViewController.m
//  HardestGameFrankenstein
//
//  Created by Hannibal Yang on 12/9/14.
//  Copyright (c) 2014 Hannibal Yang. All rights reserved.
//

#import "HGFMissionViewController.h"
#import "HGFMission.h"
#import "HGFMissionView.h"

@implementation HGFMissionViewController

- (void)viewDidLoad {

    [super viewDidLoad];
    // 加载关卡数据
    NSArray *array = [NSArray arrayWithContentsOfFile:[[NSBundle mainBundle] pathForResource:@"mission" ofType:@"plist"]];
    // 解析字典模型
    int count = array.count;
    for (int i = 0; i < count; i++) {
        HGFMission *mission = [HGFMission missionWithDict:array[i]];
        // 关卡编号
        mission.number = i + 1;
        
        // 创建每个关卡对应的View
        HGFMissionView *missionView = [HGFMissionView missionView];
        
        int row = i % 3;
        int column = i / 3;
        
        CGFloat missionViewW = missionView.frame.size.width;
        CGFloat missionViewH = missionView.frame.size.height;
        
        CGFloat startingY = 120;
        CGFloat startingX = 20;
        
        // 关卡之间的间距
        CGFloat marginX = self.view.frame.size.width - 2 * (missionViewW + startingX);
        CGFloat marginY = marginX;
        
        CGFloat missionViewX = startingX + column * (missionViewW + marginX);
        CGFloat missionViewY = startingY + row * (missionViewH + marginY);
        
        missionView.frame = CGRectMake(missionViewX, missionViewY, missionViewW, missionViewH);
        
        [self.view addSubview:missionView];
        
        // 传递模型给view
        missionView.mission = mission;
        
    }
    // 解析关卡数据，展示每一个关卡
}

- (IBAction)back {
    
    [self.navigationController popViewControllerAnimated:YES];
}
@end
