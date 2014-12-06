//
//  ViewController.m
//  SavingData2Plist
//
//  Created by Hannibal Yang on 12/6/14.
//  Copyright (c) 2014 Hannibal Yang. All rights reserved.
//

#import "ViewController.h"
#import "PreferencesViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // 在iOS中，paths数组中永远只有一个元素，就是Documents文件夹的全路径
    NSArray *paths = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
    
    NSString *path = [paths lastObject];
    //    NSString *filePath = [[NSHomeDirectory() stringByAppendingPathComponent:@"Documents"] stringByAppendingPathComponent:@"login.plist"];
    NSString *filePath = [path stringByAppendingPathComponent:@"login.plist"];
    
    NSDictionary *dictionary = [NSDictionary dictionaryWithContentsOfFile:filePath];
    _username.text = dictionary[@"username"];
    _remember.selected = [dictionary[@"rmb_pwd"] boolValue];
    _autoLogin.selected = [dictionary[@"auto_login"] boolValue];
    if (_remember.selected) {
        _password.text = dictionary[@"password"];
    }
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

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {

    
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
    
//    NSString *homePath = NSHomeDirectory();
//    NSString *documentsPath = [homePath stringByAppendingString:@"/Documents"];
//    NSString *documentsPath = [homePath stringByAppendingPathComponent:@"Documents"];
    
    NSString *documentsPath = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES)[0];
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
    
    // 控制器跳转
    PreferencesViewController *preferences = [self.storyboard instantiateViewControllerWithIdentifier:@"Preferences"];
//    [self presentViewController:preferences animated:YES completion:nil];
    self.view.window.rootViewController = preferences;
    
}
@end
