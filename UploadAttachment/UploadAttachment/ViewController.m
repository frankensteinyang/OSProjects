//
//  ViewController.m
//  UploadAttachment
//
//  Created by Hannibal Yang on 12/23/14.
//  Copyright (c) 2014 Frankenstein Yang. All rights reserved.
//

#import "ViewController.h"
#import "AFNetworking.h"

@interface ViewController () {

    AFHTTPClient *_httpClient;
}

@end

/*
 接口名：http://panfile.xuele.net/mupload.ashx?U=教师ID&Type=文件扩展名&Size=文件大小&Name=文件名&Aid=课程ID
 接口方式：Post
 返回值：文件ID
 */

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    NSURL *url = [NSURL URLWithString:@"http://panfile.xuele.net/"];
    _httpClient = [[AFHTTPClient alloc] initWithBaseURL:url];
    
    
}

#pragma mark - 文件上传
- (IBAction)uploadAttachment {
    
    // 上传请求
    NSURLRequest *request = [_httpClient multipartFormRequestWithMethod:@"Post" path:@"mupload.ashx" parameters:nil constructingBodyWithBlock:^(id<AFMultipartFormData> formData) {
        
        // 编写要上传的数据体
        UIImage *image = [UIImage imageNamed:@""];
        NSData *data = UIImagePNGRepresentation(image);
        [formData appendPartWithFileData:data name:@"" fileName:@"" mimeType:@""];
        
    }];
//    [request setValue:<#(id)#> forKey:<#(NSString *)#>]
    AFHTTPRequestOperation *op = [[AFHTTPRequestOperation alloc] initWithRequest:request];
    [_httpClient.operationQueue addOperation:op];
    
}

@end
