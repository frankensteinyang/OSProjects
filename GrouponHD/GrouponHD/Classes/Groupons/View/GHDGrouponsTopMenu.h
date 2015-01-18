//
//  GHDGrouponsTopMenu.h
//  GrouponHD
//
//  Created by Frankenstein Yang on 1/19/15.
//  Copyright (c) 2015 Frankenstein Yang. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface GHDGrouponsTopMenu : UIView

@property (weak, nonatomic) IBOutlet UIButton *imageBtn;
@property (weak, nonatomic) IBOutlet UILabel *titleLabel;
@property (weak, nonatomic) IBOutlet UILabel *subtitleLabel;

+ (instancetype)menu;

- (void)addTarget:(id)target action:(SEL)action;

@end
