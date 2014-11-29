//
//  HKEGenderCheckBox.m
//  HandlingKeyboardEncapsulation
//
//  Created by Hannibal Yang on 11/28/14.
//  Copyright (c) 2014 Hannibal Yang. All rights reserved.
//

#import "HKEGenderCheckBox.h"

@implementation HKEGenderCheckBox

- (IBAction)selectGender:(UIButton *)sender {
    
    if (_maleBtn.enabled) {
        _maleBtn.enabled = NO;
        _femaleBtn.enabled = YES;
    } else {
        _femaleBtn.enabled = NO;
        _maleBtn.enabled = YES;
    }
}

+ (id)genderCheckbox {

    return [[NSBundle mainBundle] loadNibNamed:@"HKEGenderCheckBox" owner:nil options:nil][0];
}

@end
