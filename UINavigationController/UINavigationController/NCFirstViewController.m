//
//  NCFirstViewController.m
//  UINavigationController
//
//  Created by Hannibal Yang on 12/2/14.
//  Copyright (c) 2014 Hannibal Yang. All rights reserved.
//

#import "NCFirstViewController.h"
#import "NCSecondViewController.h"

@interface NCFirstViewController ()

@end

@implementation NCFirstViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    self.navigationItem.title = @"First";
    self.navigationItem.leftBarButtonItem = [[UIBarButtonItem alloc] initWithTitle:@"Add" style:UIBarButtonItemStylePlain target:self action:@selector(addClick)];
    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemTrash target:nil action:nil];
    self.navigationController.navigationBar.tintColor = [UIColor blueColor];
}

- (void)addClick {

    NSLog(@"What's up?");
}
                                                                                                                                                       
- (IBAction)skipToSecond {
    
    NCSecondViewController *second = [[NCSecondViewController alloc] init];
    [self.navigationController pushViewController:second animated:YES];
}
@end
