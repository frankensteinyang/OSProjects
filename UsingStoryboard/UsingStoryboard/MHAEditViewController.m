//
//  MHAEditViewController.m
//  UsingStoryboard
//
//  Created by Hannibal Yang on 12/4/14.
//  Copyright (c) 2014 Hannibal Yang. All rights reserved.
//

#import "MHAEditViewController.h"
#import "MHAInformation.h"

@interface MHAEditViewController ()

@end

@implementation MHAEditViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    _nicknameField.text = _temporaryName;
}

- (IBAction)save {
    
    if ([_delegate respondsToSelector:@selector(editViewController:didSaveInfo:)]) {
        [_delegate editViewController:self didSaveInfo:[MHAInformation informationWithName:_nicknameField.text]];
        [self.navigationController popViewControllerAnimated:YES];
    }
    
}
@end
