//
//  ViewController.h
//  HandlingKeyboard
//
//  Created by Hannibal Yang on 11/27/14.
//  Copyright (c) 2014 Hannibal Yang. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController

@property (weak, nonatomic) IBOutlet UIButton *maleBtn;

@property (weak, nonatomic) IBOutlet UIButton *femaleBtn;

@property (weak, nonatomic) IBOutlet UITextField *birthdayField;

@property (weak, nonatomic) IBOutlet UITextField *cityField;

- (IBAction)selectGender:(UIButton *)sender;
@end

