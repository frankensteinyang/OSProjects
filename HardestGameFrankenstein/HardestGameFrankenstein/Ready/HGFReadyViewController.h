//
//  HGFReadyViewController.h
//  HardestGameFrankenstein
//
//  Created by Hannibal Yang on 12/11/14.
//  Copyright (c) 2014 Hannibal Yang. All rights reserved.
//

#import <UIKit/UIKit.h>
@class HGFMission;

@interface HGFReadyViewController : UIViewController

@property (weak, nonatomic) IBOutlet UIButton *missionBtn;
@property (weak, nonatomic) IBOutlet UILabel *introductionLabel;
@property (weak, nonatomic) IBOutlet UILabel *missionLabel;

@property (nonatomic, strong) HGFMission *mission;

@end
