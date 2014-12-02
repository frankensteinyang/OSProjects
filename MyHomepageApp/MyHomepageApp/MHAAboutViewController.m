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
    
    // 获得about.html文件的URL
//    NSURL *url = [[NSBundle mainBundle] URLForResource:@"about.html" withExtension:nil];
    // 封装一个请求对象
//    NSURLRequest *request = [NSURLRequest requestWithURL:url];
    // 加载请求
//    [_webView loadRequest:request];
    
    // 加载网页
    [_webView loadRequest:[NSURLRequest requestWithURL:[[NSBundle mainBundle] URLForResource:@"about.html" withExtension:nil]]];
}

@end
