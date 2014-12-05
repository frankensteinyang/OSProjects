//
//  ViewController.m
//  SavingData2Plist
//
//  Created by Hannibal Yang on 12/6/14.
//  Copyright (c) 2014 Hannibal Yang. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
}

- (IBAction)remember:(UIButton *)sender {
    
    sender.selected = !sender.selected;
    if (!sender.selected) {
        _autoLogin.selected = NO;
    }
}

- (IBAction)autoLogin:(UIButton *)sender {
    
    sender.selected = !sender.selected;
    if (sender.selected) {
        _remember.selected = YES;
    }
}

- (IBAction)login {
    
    NSLog(@"%@", NSHomeDirectory());
}
@end
