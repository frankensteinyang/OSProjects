//
//  PreferencesViewController.m
//  SavingData2Plist
//
//  Created by Hannibal Yang on 12/6/14.
//  Copyright (c) 2014 Hannibal Yang. All rights reserved.
//

#import "PreferencesViewController.h"
#import "ViewController.h"

@interface PreferencesViewController ()

@end

@implementation PreferencesViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    NSUserDefaults *getData = [NSUserDefaults standardUserDefaults];
    _name.text = [getData objectForKey:@"name"];
    _phone.text = [getData objectForKey:@"phone"];
    _maleBtn.enabled = [getData boolForKey:@"male"];
    _femaleBtn.enabled = [getData boolForKey:@"female"];
}

- (IBAction)genderSele:(UIButton *)sender {
    
    if(_maleBtn.enabled) {
        _maleBtn.enabled = NO;
        _femaleBtn.enabled = YES;
    } else {
        _maleBtn.enabled = YES;
        _femaleBtn.enabled = NO;
    }
    
}

- (IBAction)backAndSavePre {
    
    // 偏好设置存取数据
    NSUserDefaults *userD = [NSUserDefaults standardUserDefaults];
    [userD setObject:_name.text forKey:@"name"];
    [userD setObject:_phone.text forKey:@"phone"];
    [userD setBool:_maleBtn.enabled forKey:@"male"];
    [userD setBool:_femaleBtn.enabled forKey:@"female"];
    // 马上进行存储(马上进行同步)
    [userD synchronize];
    
//    [self dismissViewControllerAnimated:YES completion:^{
//        NSLog(@"已经返回到第一个控制器！");
//    }];
    self.view.window.rootViewController = [self.storyboard instantiateViewControllerWithIdentifier:@"ViewController"];
}
@end
