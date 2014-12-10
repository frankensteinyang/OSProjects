//
//  HGFMissionView.h
//  HardestGameFrankenstein
//
//  Created by Hannibal Yang on 12/11/14.
//  Copyright (c) 2014 Hannibal Yang. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "HGFMission.h"
@class HGFMissionView;

@protocol HGFMissionViewDelegate <NSObject>

@optional
- (void)missionViewIconClick:(HGFMissionView *)missionView;

@end

@interface HGFMissionView : UIView

@property (nonatomic, strong) HGFMission *mission;
@property (weak, nonatomic) IBOutlet UIButton *missionBtnImg;
@property (weak, nonatomic) IBOutlet UIButton *missionBtnNum;
@property (weak, nonatomic) id<HGFMissionViewDelegate> delegate;

- (IBAction)go2Ready;

+ (id)missionView;

- (void)setMission:(HGFMission *)mission;

@end
