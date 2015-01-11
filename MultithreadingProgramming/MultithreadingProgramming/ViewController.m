//
//  ViewController.m
//  MultithreadingProgramming
//
//  Created by Frankenstein Yang on 1/11/15.
//  Copyright (c) 2015 Frankenstein Yang. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

- (IBAction)btnClick;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)btnClick {
    
    // 获得当前的线程
    NSThread *current = [NSThread currentThread];
    NSLog(@"%@", current);
    
}
@end
