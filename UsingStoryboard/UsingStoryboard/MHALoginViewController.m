//
//  MHALoginViewController.m
//  UsingStoryboard
//
//  Created by Hannibal Yang on 12/4/14.
//  Copyright (c) 2014 Hannibal Yang. All rights reserved.
//

#import "MHALoginViewController.h"

@interface MHALoginViewController ()

@end

@implementation MHALoginViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (IBAction)login {
    
    if (_usernameField.text.length == 0 || _passwordField.text.length == 0) return;
    
    // 手动执行连续线（一根线就代表一个Segue对象）
    [self performSegueWithIdentifier:@"login2Homepage" sender:nil];
    
}
@end
