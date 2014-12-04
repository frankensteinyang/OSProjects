//
//  MHAStatusViewController.m
//  UsingStoryboard
//
//  Created by Hannibal Yang on 12/4/14.
//  Copyright (c) 2014 Hannibal Yang. All rights reserved.
//

#import "MHAStatusViewController.h"

@interface MHAStatusViewController ()

@end

@implementation MHAStatusViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // IOS7上UITextView在UINavigationController中垂直显示问题，UITextView上面有空白区域的解决办法：
    // 解决办法来源：http://stackoverflow.com/questions/19468417/ios-7-uitextview-vertical-alignment
    if([[[UIDevice currentDevice] systemVersion] floatValue] >= 7.0){
        self.automaticallyAdjustsScrollViewInsets = NO; // Avoid the top UITextView space, iOS7 (~bug?)
    }
    
    self.navigationItem.leftBarButtonItem = [[UIBarButtonItem alloc] initWithTitle:@"退出编辑" style:UIBarButtonItemStylePlain target:self action:@selector(toEnsureSaved)];
    
}

- (void)toEnsureSaved {

    
}

@end
