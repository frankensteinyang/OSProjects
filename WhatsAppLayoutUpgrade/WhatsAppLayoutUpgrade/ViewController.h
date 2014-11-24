//
//  ViewController.h
//  WhatsAppLayoutUpgrade
//
//  Created by Hannibal Yang on 11/16/14.
//  Copyright (c) 2014 Hannibal Yang. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController

@property (weak, nonatomic) IBOutlet UITableView *tableView;

@property (weak, nonatomic) IBOutlet UITextField *messageField;

- (IBAction)voiceChat:(UIButton *)sender;

@property (weak, nonatomic) IBOutlet UIButton *holdToTalk;

@end

