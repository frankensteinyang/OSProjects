//
//  ViewController.h
//  SavingData2Plist
//
//  Created by Hannibal Yang on 12/6/14.
//  Copyright (c) 2014 Hannibal Yang. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController

@property (weak, nonatomic) IBOutlet UIButton *remember;
@property (weak, nonatomic) IBOutlet UIButton *autoLogin;
@property (weak, nonatomic) IBOutlet UITextField *username;
@property (weak, nonatomic) IBOutlet UITextField *password;

- (IBAction)remember:(UIButton *)sender;

- (IBAction)autoLogin:(UIButton *)sender;

- (IBAction)login;

@end

