//
//  MHAAboutViewController.m
//  MyHomepageApp
//
//  Created by Hannibal Yang on 12/2/14.
//  Copyright (c) 2014 Hannibal Yang. All rights reserved.
//

#import "MHAAboutViewController.h"

@interface MHAAboutViewController ()

@end

@implementation MHAAboutViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"关于";
    [_webView loadRequest:[NSURLRequest requestWithURL:[[NSBundle mainBundle] URLForResource:@"about.html" withExtension:nil]]];
}

@end
