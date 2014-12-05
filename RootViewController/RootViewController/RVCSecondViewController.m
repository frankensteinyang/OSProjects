//
//  RVCSecondViewController.m
//  RootViewController
//
//  Created by Hannibal Yang on 12/6/14.
//  Copyright (c) 2014 Hannibal Yang. All rights reserved.
//

#import "RVCSecondViewController.h"
#import "RVCFirstViewController.h"

@interface RVCSecondViewController ()

@end

@implementation RVCSecondViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
}

- (void)dealloc {

    NSLog(@"RVCSecondViewController已被销毁！");
}

- (IBAction)skip2First {
    
    self.view.window.rootViewController = [[RVCFirstViewController alloc] init];
}
@end
