//
//  GHDNavigationController.m
//  GrouponHD
//
//  Created by Frankenstein Yang on 1/18/15.
//  Copyright (c) 2015 Frankenstein Yang. All rights reserved.
//

#import "GHDNavigationController.h"

@interface GHDNavigationController ()

@end

@implementation GHDNavigationController

+ (void)initialize {

    UINavigationBar *navBar = [UINavigationBar appearance];
    [navBar setBackgroundImage:[UIImage imageNamed:@"bg_navigationBar_normal"] forBarMetrics:UIBarMetricsDefault];
    
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

@end
