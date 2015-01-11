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
#import "DACircularProgressView.h"

@interface ViewController () <ASIHTTPRequestDelegate, ASIProgressDelegate, UINavigationControllerDelegate, UIImagePickerControllerDelegate>

@property (weak, nonatomic) IBOutlet UIProgressView *progressView;
@property (weak, nonatomic) IBOutlet DACircularProgressView *circularView;

@property (nonatomic, strong) ASIHTTPRequest *request;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.circularView.trackTintColor = [UIColor purpleColor];
    self.circularView.progressTintColor = [UIColor yellowColor];
    
//    [ASIHTTPRequest setShouldUpdateNetworkActivityIndicator:NO];
//    [self write2Album];
    
}

#pragma mark - 添加图片到相册
- (void)write2Album {

    for (NSInteger i = 0; i < 5; i++) {
        NSString *name = [NSString stringWithFormat:@"minion_0%d", i + 1];
        UIImage *img = [UIImage imageNamed:name];
        UIImageWriteToSavedPhotosAlbum(img, nil, nil, nil);
    }
    
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

#pragma mark - 上传大文件
- (IBAction)uploadLargeFile {
    
    NSURL *url = [NSURL URLWithString:@"http://localhost:8080/FrankensteinServer/upload"];
    ASIFormDataRequest *request = [ASIFormDataRequest requestWithURL:url];
    
    // 长传文件的路径
    NSString *caches = [NSSearchPathForDirectoriesInDomains(NSCachesDirectory, NSUserDomainMask, YES) lastObject];
    NSString *file = [caches stringByAppendingPathComponent:@"iOS.mp4"];
    [request setFile:file forKey:@"file"];
    NSLog(@"%@", file);
    request.uploadProgressDelegate = self.circularView;
    [request setPostValue:@"Frankie" forKey:@"username"];
    [request startAsynchronous];
    request.shouldContinueWhenAppEntersBackground = YES;
    [request setCompletionBlock:^{
        NSLog(@"大文件上传完毕！");
    }];
    
}

#pragma mark - 上传相册中的图片（直接上传二进制数据）
- (IBAction)uploadPhotoFromAlbum {
    
    UIImagePickerController *ipc = [[UIImagePickerController alloc] init];
    // UIImagePickerControllerSourceTypePhotoLibrary
    ipc.sourceType = UIImagePickerControllerSourceTypeSavedPhotosAlbum;
    ipc.delegate = self;
    [self presentViewController:ipc animated:YES completion:nil];
    
}

#pragma mark - 选择图片的代理方法
- (void)imagePickerController:(UIImagePickerController *)picker didFinishPickingMediaWithInfo:(NSDictionary *)info {

    // 销毁图片选择控制器
    [picker dismissViewControllerAnimated:YES completion:nil];
    NSLog(@"%@", info);
    // 得到用户选中的图片
    UIImage *img = info[UIImagePickerControllerOriginalImage];
    // 上传图片
    [self uploadImage:img];
    
}

- (void)uploadImage:(UIImage *)img {

    // 创建请求
    NSURL *url = [NSURL URLWithString:@"http://localhost:8080/FrankensteinServer/upload"];
    ASIFormDataRequest *request = [ASIFormDataRequest requestWithURL:url];
    
    // 转为二进制
    NSData *data = UIImagePNGRepresentation(img);
    [request setData:data withFileName:@"minion.png" andContentType:@"image/png" forKey:@"file"];
    [request setPostValue:@"Frankie" forKey:@"username"];
    [request startAsynchronous];
    [request setCompletionBlock:^{
        NSLog(@"成功上传到相册！");
    }];
    
}

#pragma mark - 上传（POST）
- (IBAction)btnUpload {
    
    // 创建请求
    NSURL *url = [NSURL URLWithString:@"http://localhost:8080/FrankensteinServer/upload"];
    ASIFormDataRequest *request = [ASIFormDataRequest requestWithURL:url];
    
    // 设置上传文件路径
    NSString *file = [[NSBundle mainBundle] pathForResource:@"iOS.mp4" ofType:nil];
    [request addFile:file forKey:@"file"];
    
    /**
     *  addFile的file对应多个文件，setFile对应一个文件
     */
//    [request addFile:file forKey:@"file"];
//    [request setFile:file forKey:@"file"];

    [request setFile:file withFileName:@"frankie.mp4" andContentType:@"video/mp4" forKey:@"file"];
    // 设置其他请求参数
    [request setPostValue:@"Frankenstein" forKey:@"username"];
    request.uploadProgressDelegate = self.progressView;
    
    // 发送请求
    [request startAsynchronous];
    
    NSLog(@"%@", file);
    // 监听请求
    [request setCompletionBlock:^{
        NSLog(@"上传完毕！");
    }];
}


#pragma mark - 下载（请求资源，GET）
- (IBAction)btnDownload {
    
    NSURL *url = [NSURL URLWithString:@"http://localhost:8080/FrankensteinServer/resources/interview/iOS.mp4"];
    ASIHTTPRequest *request = [ASIHTTPRequest requestWithURL:url];
    // 设置所下载文件的存储路径
    NSString *cache = [NSSearchPathForDirectoriesInDomains(NSCachesDirectory, NSUserDomainMask, YES) lastObject];
    NSString *filepath = [cache stringByAppendingPathComponent:@"iOS.mp4"];
    request.downloadDestinationPath = filepath;
    
//    [request setDataReceivedBlock:^(NSData *data) {
//        NSLog(@"setDataReceivedBlock %d", data.length);
//    }];
    
    // 设置下载代理
//    request.downloadProgressDelegate = self;
//    request.downloadProgressDelegate = self.progressView;
    request.downloadProgressDelegate = self.circularView;
    
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
