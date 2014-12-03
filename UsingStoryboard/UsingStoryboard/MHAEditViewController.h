//
//  MHAEditViewController.h
//  UsingStoryboard
//
//  Created by Hannibal Yang on 12/4/14.
//  Copyright (c) 2014 Hannibal Yang. All rights reserved.
//

#import <UIKit/UIKit.h>
@class MHAInformation, MHAEditViewController;

@protocol MHAEditViewControllerDelegate <NSObject>

@optional
- (void)editViewController:(MHAEditViewController *)edit didSaveInfo:(MHAInformation *)info;

@end

@interface MHAEditViewController : UIViewController

@property (weak, nonatomic) IBOutlet UITextField *nicknameField;
@property (copy, nonatomic) NSString *temporaryName;

@property (weak, nonatomic) id<MHAEditViewControllerDelegate> delegate;

- (IBAction)save;

@end
