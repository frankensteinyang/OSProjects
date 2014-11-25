//
//  WhatsAppContactsCell.m
//  WhatsAppContacts
//
//  Created by Hannibal Yang on 11/25/14.
//  Copyright (c) 2014 Hannibal Yang. All rights reserved.
//

#import "WhatsAppContactsCell.h"
#import "WhatsAppContacts.h"

@implementation WhatsAppContactsCell

- (void)setContactsCell:(WhatsAppContacts *)contactsCell {

    _contactsCell = contactsCell;
    // 显示名称
    self.textLabel.text = contactsCell.name;
    self.textLabel.textColor = contactsCell.isVip ? [UIColor redColor] : [UIColor blueColor];
    
    // 显示联系人签名
    self.detailTextLabel.text = contactsCell.introduction;
    
    // 显示头像
    self.imageView.image = [UIImage imageNamed:contactsCell.icon];
}

@end
