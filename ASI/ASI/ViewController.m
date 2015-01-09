//
//  ViewController.m
//  ASI
//
//  Created by Frankenstein Yang on 1/9/15.
//  Copyright (c) 2015 Frankenstein Yang. All rights reserved.
//

#import "ViewController.h"
#import "ASIHTTPRequest.h"

@interface ViewController () <ASIHTTPRequestDelegate>

@property (nonatomic, strong) ASIHTTPRequest *request;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
}

- (void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event {
    
    [self sync];
    [self async];
}

#pragma mark - 同步请求
- (void)sync {

    // 创建请求对象
    NSURL *url = [NSURL URLWithString:@"http://localhost:8080/FrankensteinServer/login?username=123&pwd=123"];
    ASIHTTPRequest *request = [ASIHTTPRequest requestWithURL:url];
    
    request.timeOutSeconds = 10;
    
    // 发送请求
    [request startSynchronous];
    
    // 检测服务器返回的结果
    if (request.error) {
        NSLog(@"请求出错 %@", request.error);
    } else {
        NSLog(@"%d %@", request.responseStatusCode, request.responseStatusMessage);
        NSLog(@"%d", request.responseData.length);
        NSLog(@"%@", request.responseString);
        NSDictionary *dict = [NSJSONSerialization JSONObjectWithData:request.responseData options:NSJSONReadingMutableLeaves error:nil];
        NSLog(@"%@", dict);
        
    }
    
}

- (void)dealloc {
    // 重点（必须在控制器销毁的时候，取消请求/清除代理）
    [self.request clearDelegatesAndCancel];
}

#pragma mark - 异步请求
- (void)async {

    // 创建请求对象
    NSURL *url = [NSURL URLWithString:@"http://localhost:8080/FrankensteinServer/login?username=123&pwd=123"];
    self.request = [ASIHTTPRequest requestWithURL:url];
    
    self.request.timeOutSeconds = 10;
    
    // 设置代理
    self.request.delegate = self;
    
    // 发送请求
    [self.request startAsynchronous];
    
}

#pragma mark - 代理方法
- (void)requestStarted:(ASIHTTPRequest *)request {

    NSLog(@"requestStarted");
}

- (void)request:(ASIHTTPRequest *)request didReceiveData:(NSData *)data {

    NSLog(@"didReceiveData");
}

- (void)requestFinished:(ASIHTTPRequest *)request {

    NSLog(@"requestFinished");
}

- (void)requestFailed:(ASIHTTPRequest *)request {

    NSLog(@"requestFailed");
}

@end
