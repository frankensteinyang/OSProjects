//
//  WhatsAppCrowdHeader.m
//  WhatsAppContacts
//
//  Created by Hannibal Yang on 11/25/14.
//  Copyright (c) 2014 Hannibal Yang. All rights reserved.
//

#import "WhatsAppCrowdHeader.h"
#import "WhatsAppCrowd.h"

@implementation WhatsAppCrowdHeader

- (IBAction)crowdClick:(UIButton *)sender {
    
    // 组的闭合的取反
    _crowd.crowdStatus = !_crowd.crowdStatus;
    [_tableView reloadData];
}

+ (id)crowdHeader {
    
    return [[NSBundle mainBundle] loadNibNamed:@"WhatsAppCrowdHeader" owner:nil options:nil][0];
}

- (void)setCrowd:(WhatsAppCrowd *)crowd {

    _crowd = crowd;
    // 组名
    [_nameBtn setTitle:crowd.crowdName forState:UIControlStateNormal];
    
    // 在线联系人人数
    _onlineLabel.text = [NSString stringWithFormat:@"%d/%d", crowd.onlineContacts, crowd.contactsArray.count];
}

@end
