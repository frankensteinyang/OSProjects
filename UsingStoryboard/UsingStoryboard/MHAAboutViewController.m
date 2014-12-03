//
//  MHAAboutViewController.m
//  UsingStoryboard
//
//  Created by Hannibal Yang on 12/4/14.
//  Copyright (c) 2014 Hannibal Yang. All rights reserved.
//

#import "MHAAboutViewController.h"

@interface MHAAboutViewController ()

@end

@implementation MHAAboutViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [_webView loadRequest:[NSURLRequest requestWithURL:[[NSBundle mainBundle] URLForResource:@"about.html" withExtension:nil]]];
}

@end
