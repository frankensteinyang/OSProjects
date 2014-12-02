//
//  MHAEditViewController.h
//  MyHomepageApp
//
//  Created by Hannibal Yang on 12/2/14.
//  Copyright (c) 2014 Hannibal Yang. All rights reserved.
//

#import <UIKit/UIKit.h>
@class MHAEditViewController;

@protocol MHAEditViewControllerDelegate <NSObject>

@optional
- (void)editViewController:(MHAEditViewController *)edit didSaveWithName:(NSString *)name phoneNumber:(NSString *)number intro:(NSString *)intro;

@end

@interface MHAEditViewController : UIViewController

@property (weak, nonatomic) IBOutlet UITextField *nicknameField;

@property (weak, nonatomic) IBOutlet UITextField *phoneField;

@property (weak, nonatomic) IBOutlet UITextView *introduction;

@property (weak, nonatomic) id<MHAEditViewControllerDelegate> delegate;

@end
