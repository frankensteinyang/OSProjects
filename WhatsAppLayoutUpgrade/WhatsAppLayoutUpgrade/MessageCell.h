//
//  MessageCell.h
//  WhatsAppLayout
//
//  Created by Hannibal Yang on 11/10/14.
//  Copyright (c) 2014 Hannibal Yang. All rights reserved.
//

#import <UIKit/UIKit.h>

@class MessageFrame;

@interface MessageCell : UITableViewCell
@property (nonatomic, strong) MessageFrame *messageFrame;
+ (id)ID;

@end
