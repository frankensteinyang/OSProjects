//
//  HGFSettingViewController.m
//  HardestGameFrankenstein
//
//  Created by Hannibal Yang on 12/9/14.
//  Copyright (c) 2014 Hannibal Yang. All rights reserved.
//

#import "HGFSettingViewController.h"

@implementation HGFSettingViewController

- (IBAction)back {
    
    [self.navigationController popViewControllerAnimated:YES];
}

- (IBAction)soundBtnClick:(UIButton *)sender {
    
    sender.selected = !sender.isSelected;
}
@end
