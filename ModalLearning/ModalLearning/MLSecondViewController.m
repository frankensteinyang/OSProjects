//
//  MLSecondViewController.m
//  ModalLearning
//
//  Created by Hannibal Yang on 12/5/14.
//  Copyright (c) 2014 Hannibal Yang. All rights reserved.
//

#import "MLSecondViewController.h"

@interface MLSecondViewController ()

@end

@implementation MLSecondViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
}

- (IBAction)skip2First {
    
    [self dismissViewControllerAnimated:YES completion:nil];
}

- (IBAction)cancel:(id)sender {
    
    // 展示用：presentViewController: animated: completion:
    // 关闭当前的模态控制器
    [self dismissViewControllerAnimated:YES completion:nil];
}
@end
