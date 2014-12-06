//
//  AspieContactsAddViewController.h
//  AspieContacts
//
//  Created by Hannibal Yang on 12/7/14.
//  Copyright (c) 2014 Hannibal Yang. All rights reserved.
//

#import <UIKit/UIKit.h>
@class AspieContactsAddViewController, AspieContacts;

@protocol AspieContactsAddViewControllerDelegate <NSObject>

@optional
- (void)saveViewController:(AspieContactsAddViewController *)save didSaveContacts:(AspieContacts *)contacts;

@end

@interface AspieContactsAddViewController : UIViewController

@property (weak, nonatomic) IBOutlet UITextField *nameField;
@property (weak, nonatomic) IBOutlet UITextField *phoneField;
@property (weak, nonatomic) id<AspieContactsAddViewControllerDelegate> delegate;

- (IBAction)cancel:(id)sender;

- (IBAction)save:(id)sender;

@end
