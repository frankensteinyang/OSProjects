//
//  MHAStatusViewController.h
//  MyHomepageApp
//
//  Created by Hannibal Yang on 12/3/14.
//  Copyright (c) 2014 Hannibal Yang. All rights reserved.
//

#import <UIKit/UIKit.h>
@class MHAStatusViewController, MHAStatus;

@protocol MHAStatusViewControllerDelegate <NSObject>

@optional
- (void)statusViewController:(MHAStatusViewController *)statusController didSendStatus:(MHAStatus *)status;

@end

@interface MHAStatusViewController : UIViewController

@property (nonatomic, weak) id<MHAStatusViewControllerDelegate> delegate;

@property (weak, nonatomic) IBOutlet UITextView *statusView;

@end
