//
//  WhatsAppCrowdHeader.h
//  WhatsAppContacts
//
//  Created by Hannibal Yang on 11/25/14.
//  Copyright (c) 2014 Hannibal Yang. All rights reserved.
//

#import <UIKit/UIKit.h>
@class WhatsAppCrowd;

@interface WhatsAppCrowdHeader : UIView

@property (nonatomic, strong) WhatsAppCrowd *crowd;

@property (weak, nonatomic) IBOutlet UIButton *nameBtn;

@property (weak, nonatomic) IBOutlet UILabel *onlineLabel;

@property (nonatomic, weak) UITableView *tableView;

// 监听组点击
- (IBAction)crowdClick:(UIButton *)sender;

+ (id)crowdHeader;

@end
