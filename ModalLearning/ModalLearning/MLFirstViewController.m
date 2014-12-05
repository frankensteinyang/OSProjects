//
//  MLFirstViewController.m
//  ModalLearning
//
//  Created by Hannibal Yang on 12/5/14.
//  Copyright (c) 2014 Hannibal Yang. All rights reserved.
//

#import "MLFirstViewController.h"
#import "MLSecondViewController.h"

@interface MLFirstViewController ()

@end

@implementation MLFirstViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
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
@end
