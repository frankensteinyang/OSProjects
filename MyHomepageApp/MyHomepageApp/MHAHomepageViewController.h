//
//  MHAHomepageViewController.h
//  MyHomepageApp
//
//  Created by Hannibal Yang on 12/2/14.
//  Copyright (c) 2014 Hannibal Yang. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface MHAHomepageViewController : UIViewController
@property (weak, nonatomic) IBOutlet UILabel *nicknameLabel;
@property (weak, nonatomic) IBOutlet UILabel *phoneLabel;
@property (weak, nonatomic) IBOutlet UITextView *introductionView;

- (IBAction)goToStatus;
@end
