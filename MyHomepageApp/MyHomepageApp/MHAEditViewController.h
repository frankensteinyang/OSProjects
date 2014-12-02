//
//  MHAEditViewController.h
//  MyHomepageApp
//
//  Created by Hannibal Yang on 12/2/14.
//  Copyright (c) 2014 Hannibal Yang. All rights reserved.
//

#import <UIKit/UIKit.h>
@class MHAEditViewController, MHAEditedInfo;

@protocol MHAEditViewControllerDelegate <NSObject>

@optional
- (void)editViewController:(MHAEditViewController *)edit didSaveWithEditedInfo:(MHAEditedInfo *)info;

@end

@interface MHAEditViewController : UIViewController

@property (weak, nonatomic) IBOutlet UITextField *nicknameField;

@property (weak, nonatomic) IBOutlet UITextField *phoneField;

@property (weak, nonatomic) IBOutlet UITextView *introduction;

@property (strong, nonatomic) MHAEditedInfo *editedInfo;

@property (weak, nonatomic) id<MHAEditViewControllerDelegate> delegate;

@end
