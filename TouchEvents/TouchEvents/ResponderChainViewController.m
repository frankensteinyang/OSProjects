//
//  ResponderChainViewController.m
//  TouchEvents
//
//  Created by Hannibal Yang on 12/18/14.
//  Copyright (c) 2014 Hannibal Yang. All rights reserved.
//

#import "ResponderChainViewController.h"

@interface ResponderChainViewController ()

@property (weak, nonatomic) IBOutlet UIView *redView;
@property (weak, nonatomic) IBOutlet UIView *yellowView;
@property (weak, nonatomic) IBOutlet UIView *blueView;
@property (weak, nonatomic) IBOutlet UIView *greenView;

@end

@implementation ResponderChainViewController

- (void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event {

    UITouch *touch = [touches anyObject];
    if ([touch view] == _redView) {
        NSLog(@"Red!");
    } else if ([touch view] == _yellowView) {
        NSLog(@"Yellow!");
    } else if ([touch view] == _blueView) {
        NSLog(@"Blue!");
    } else if ([touch view] == _greenView) {
        NSLog(@"Green!");
    }
}

@end
