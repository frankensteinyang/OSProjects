//
//  RVCFirstViewController.m
//  RootViewController
//
//  Created by Hannibal Yang on 12/6/14.
//  Copyright (c) 2014 Hannibal Yang. All rights reserved.
//

#import "RVCFirstViewController.h"
#import "RVCSecondViewController.h"

@interface RVCFirstViewController ()

@end

@implementation RVCFirstViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
}

- (void)dealloc {

    NSLog(@"RVCFirstViewController已被销毁！");
}

- (IBAction)skip2Second {
    
    RVCSecondViewController *second = [[RVCSecondViewController alloc] init];
    // 拿到窗口的第一种方法：self.view.window 第二种方法：self.view.superview(在iOS SDK 8.1中失效，在iOS SDK 6.1中可用)
    // 拿到窗口的第三种方法：[UIApplication sharedApplication].keyWindow
    [UIApplication sharedApplication].keyWindow.rootViewController = second;
    
}
@end
