//
//  InterviewNewsViewController.m
//  9188Interview
//
//  Created by Hannibal Yang on 12/15/14.
//  Copyright (c) 2014 Hannibal Yang. All rights reserved.
//

#define kBaseURL @"http://iphone.9188.com"

#import "InterviewNewsViewController.h"

@interface InterviewNewsViewController () <UIWebViewDelegate>

@end

@implementation InterviewNewsViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.title = @"公告";
    [self initWebView];
    
}

-(void)initWebView{
    
    CGRect webFrame = CGRectMake(0, 0, 320, 480);
    UIWebView *webView = [[UIWebView alloc] initWithFrame:webFrame];
    NSURL *url = [[NSURL alloc] initWithString:[NSString stringWithFormat:@"%@%@", kBaseURL, _url]];
    [webView loadRequest:[NSURLRequest requestWithURL:url]];
    [self.view addSubview:webView];
}

@end
