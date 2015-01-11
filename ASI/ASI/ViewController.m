//
//  ViewController.m
//  ASI
//
//  Created by Frankenstein Yang on 1/9/15.
//  Copyright (c) 2015 Frankenstein Yang. All rights reserved.
//

#import "ViewController.h"
#import "ASIHTTPRequest.h"
#import "ASIFormDataRequest.h"

@interface ViewController () <ASIHTTPRequestDelegate, ASIProgressDelegate>

@property (weak, nonatomic) IBOutlet UIProgressView *progressView;

@property (nonatomic, strong) ASIHTTPRequest *request;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
}

- (void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event {
    
//    [self sync];
//    [self async];
//    [self post];
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

#pragma mark - 下载
- (IBAction)btnDownload {
    
    NSURL *url = [NSURL URLWithString:@"http://localhost:8080/FrankensteinServer/resources/videos/minion_01.mp4"];
    ASIHTTPRequest *request = [ASIHTTPRequest requestWithURL:url];
    // 设置所下载文件的存储路径
    NSString *cache = [NSSearchPathForDirectoriesInDomains(NSCachesDirectory, NSUserDomainMask, YES) lastObject];
    NSString *filepath = [cache stringByAppendingPathComponent:@"minion_01.mp4"];
    request.downloadDestinationPath = filepath;
    
//    [request setDataReceivedBlock:^(NSData *data) {
//        NSLog(@"setDataReceivedBlock %d", data.length);
//    }];
    
    // 设置下载代理
//    request.downloadProgressDelegate = self;
    request.downloadProgressDelegate = self.progressView;
    
    // 断点下载
    request.allowResumeForFileDownloads = YES;
    
    [request setCompletionBlock:^{
        NSLog(@"下载完毕！ %@", filepath);
    }];
    
    [request startAsynchronous];
    
}

#pragma mark - 进度代理方法ASIProgressDelegate
//- (void)setProgress:(float)newProgress {
//
//    NSLog(@"%f", newProgress);
//    self.progressView.progress = newProgress;
//    
//}

#pragma mark - Post请求
- (void)post {

    // 创建请求对象
    NSURL *url = [NSURL URLWithString:@"http://localhost:8080/FrankensteinServer/login"];
    
    // ***************************************
    ASIFormDataRequest *request = [ASIFormDataRequest requestWithURL:url];
    // 添加请求参数（请求体中的参数）
    [request setPostValue:@"123" forKey:@"username"];
    [request setPostValue:@"123" forKey:@"pwd"];
    [request setCompletionBlock:^{
        NSLog(@"请求完毕！");
    }];
    [request startAsynchronous];
    // ***************************************
    
//    self.request = [ASIHTTPRequest requestWithURL:url];
//    
//    self.request.timeOutSeconds = 10;
//    
//    // 设置请求方法
//    self.request.requestMethod = @"POST";
//    
//    // 设置请求体
//    [self.request appendPostData:[@"username=123&pwd=123" dataUsingEncoding:NSUTF8StringEncoding]];
//    
//    // 设置代理
//    self.request.delegate = self;
//    
//    // 发送请求
//    [self.request startAsynchronous];
}

#pragma mark - 异步请求
- (void)async {

    // 创建请求对象
    NSURL *url = [NSURL URLWithString:@"http://localhost:8080/FrankensteinServer/login?username=123&pwd=123"];
    self.request = [ASIHTTPRequest requestWithURL:url];
    
    self.request.timeOutSeconds = 10;
    
    // 设置代理
//    self.request.delegate = self;
    
    // 设置block
    [self.request setStartedBlock:^{
        NSLog(@"setStartedBlock");
    }];
    [self.request setDataReceivedBlock:^(NSData *data) {
        NSLog(@"setDataReceivedBlock");
    }];
    [self.request setCompletionBlock:^{
        NSLog(@"setCompletionBlock");
    }];
    
    // 发送请求
    [self.request startAsynchronous];
    
}

#pragma mark - ASIHTTPRequestDelegate代理方法
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
