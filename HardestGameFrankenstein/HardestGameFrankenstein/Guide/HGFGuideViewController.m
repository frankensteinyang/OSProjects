//
//  HGFGuideViewController.m
//  HardestGameFrankenstein
//
//  Created by Hannibal Yang on 12/11/14.
//  Copyright (c) 2014 Hannibal Yang. All rights reserved.
//

#import "HGFGuideViewController.h"

@interface HGFGuideViewController ()

@end

@implementation HGFGuideViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    _guideView.animationImages = @[[UIImage imageNamed:@"guide00.png"],
                                   [UIImage imageNamed:@"guide01.png"]
                                   ];
    _guideView.animationDuration = 0.3;
    
}

- (void)viewDidAppear:(BOOL)animated {

    [super viewDidAppear:animated];
    [_guideView startAnimating];
}

- (void)viewDidDisappear:(BOOL)animated {

    [super viewDidDisappear:animated];
    [_guideView stopAnimating];
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
