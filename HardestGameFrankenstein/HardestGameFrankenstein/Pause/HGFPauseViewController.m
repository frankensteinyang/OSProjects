//
//  HGFPauseViewController.m
//  HardestGameFrankenstein
//
//  Created by Hannibal Yang on 12/11/14.
//  Copyright (c) 2014 Hannibal Yang. All rights reserved.
//

#import "HGFPauseViewController.h"

@interface HGFPauseViewController ()

@end

@implementation HGFPauseViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (IBAction)resume {
    
    [self.navigationController popViewControllerAnimated:YES];
}

- (IBAction)home {
    
    [self.navigationController popToRootViewControllerAnimated:YES];
}
@end
