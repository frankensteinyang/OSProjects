//
//  HKEGenderCheckBox.h
//  HandlingKeyboardEncapsulation
//
//  Created by Hannibal Yang on 11/28/14.
//  Copyright (c) 2014 Hannibal Yang. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface HKEGenderCheckBox : UIView

@property (weak, nonatomic) IBOutlet UIButton *femaleBtn;

@property (weak, nonatomic) IBOutlet UIButton *maleBtn;

- (IBAction)selectGender:(UIButton *)sender;

+ (id)genderCheckbox;

@end
