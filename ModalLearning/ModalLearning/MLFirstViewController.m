//
//  MLFirstViewController.m
//  ModalLearning
//
//  Created by Hannibal Yang on 12/5/14.
//  Copyright (c) 2014 Hannibal Yang. All rights reserved.
//

#import "MLFirstViewController.h"
#import "MLSecondViewController.h"
#import "MLThirdViewController.h"

@interface MLFirstViewController ()

@end

@implementation MLFirstViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    UIButton *btn = [UIButton buttonWithType:UIButtonTypeInfoDark];
    btn.frame = CGRectMake(0, 244, 44, 44);
    [self.view addSubview:btn];
}

- (IBAction)skip2Second {
    
    MLSecondViewController *second = [[MLSecondViewController alloc] init];
    
    // 设置模态控制器展示的形式
    // UIModalTransitionStylePartialCurl
    // UIModalTransitionStyleFlipHorizontal
    // UIModalTransitionStyleCrossDissolve
    // UIModalTransitionStyleCoverVertical
    second.modalTransitionStyle = UIModalTransitionStylePartialCurl;
    
    // modalPresentationStyle用于iPad
    
    // 以Modal形式展示其他控制器 (模态窗口：窗口挡在面前，后面的东西不能点击，就像javascript脚本实现：javascript:alert(1);的效果一样)
    [self presentViewController:second animated:YES completion:^{
        NSLog(@"Oh my God! It's amazing!杨进忠");
    }];
}

/*
 给一个控制器顶部增加一个导航栏的最快方法：
 1. 给这个控制器包装一个导航控制器
 
 */
- (IBAction)skip2Third {
    
    MLThirdViewController *third = [[MLThirdViewController alloc] init];
    UINavigationController *navigationController = [[UINavigationController alloc] initWithRootViewController:third];
    navigationController.modalTransitionStyle = UIModalTransitionStyleFlipHorizontal;
    [self presentViewController:navigationController animated:YES completion:nil];
}
@end
