//
//  AspieContactsAddViewController.m
//  AspieContacts
//
//  Created by Hannibal Yang on 12/7/14.
//  Copyright (c) 2014 Hannibal Yang. All rights reserved.
//

#import "AspieContactsAddViewController.h"
#import "AspieContacts.h"

@interface AspieContactsAddViewController ()

@end

@implementation AspieContactsAddViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (IBAction)cancel:(id)sender {
    
    [self dismissViewControllerAnimated:YES completion:^{
        NSLog(@"取消并退出！");
    }];
}

- (IBAction)save:(id)sender {
    
    if ([_delegate respondsToSelector:@selector(saveViewController:didSaveContacts:)]) {
        AspieContacts *contacts = [[AspieContacts alloc] init];
        contacts.name = _nameField.text;
        contacts.phone = _phoneField.text;
        [_delegate saveViewController:self didSaveContacts:contacts];
        [self dismissViewControllerAnimated:YES completion:nil];
    }
}
@end
