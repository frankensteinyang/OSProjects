//
//  ViewController.m
//  SavingData2Plist
//
//  Created by Hannibal Yang on 12/6/14.
//  Copyright (c) 2014 Hannibal Yang. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    NSString *filePath = [[NSHomeDirectory() stringByAppendingPathComponent:@"Documents"] stringByAppendingPathComponent:@"login.plist"];
    
    NSDictionary *dictionary = [NSDictionary dictionaryWithContentsOfFile:filePath];
    
    _username.text = dictionary[@"username"];
    _password.text = dictionary[@"password"];
    _remember.selected = [dictionary[@"rmb_pwd"] boolValue];
    _autoLogin.selected = [dictionary[@"auto_login"] boolValue];
    
    
}

- (IBAction)remember:(UIButton *)sender {
    
    sender.selected = !sender.selected;
    if (!sender.selected) {
        _autoLogin.selected = NO;
    }
}

- (IBAction)autoLogin:(UIButton *)sender {
    
    sender.selected = !sender.selected;
    if (sender.selected) {
        _remember.selected = YES;
    }
}

- (IBAction)login {
    
    /*
     Foundation框架中自带的很多类都能直接调用writeToFile:atomically:方法写入文件
     1> NSArray
     2> NSDictionary
     3> NSSet
     4> NSString
     5> NSNumber
     6> NSData
     */
    
    NSDictionary *dictionary = @{
                                 @"username" : _username.text,
                                 @"password" : _password.text,
                                 @"rmb_pwd" : @(_remember.selected),
                                 @"auto_login" : @(_autoLogin.selected)
                                 };
    
    NSString *homePath = NSHomeDirectory();
//    NSString *documentsPath = [homePath stringByAppendingString:@"/Documents"];
    NSString *documentsPath = [homePath stringByAppendingPathComponent:@"Documents"];
    
    NSString *filePath = [documentsPath stringByAppendingPathComponent:@"login.plist"];
    
//    NSLog(@"%@", filePath);
//    NSArray *array = @[@"杨进忠", @"Frankenstein", @"Tom", @"Frederick", @123];
    // atomically 写入文件夹安全
//    [array writeToFile:filePath atomically:YES];
//    
//    NSDictionary *dictionary = @{
//                                 @"name" : @"杨进忠",
//                                 @"age" : @27
//                                 };
    [dictionary writeToFile:filePath atomically:YES];
}
@end
