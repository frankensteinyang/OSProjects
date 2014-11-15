//
//  ViewController.m
//  WhatsAppLayoutUpgrade
//
//  Created by Hannibal Yang on 11/16/14.
//  Copyright (c) 2014 Hannibal Yang. All rights reserved.
//

#import "ViewController.h"
#import "MessageFrame.h"
#import "MessageCell.h"
#import "Message.h"

@interface ViewController () <UITableViewDataSource, UITableViewDelegate> {
    NSMutableArray *_messageFrame;
}

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    NSString *path = [[NSBundle mainBundle] pathForResource:@"messages.plist" ofType:nil];
    NSURL *url = [NSURL URLWithString:[NSString stringWithFormat:@"file://%@", path]];
    NSArray *array = [NSArray arrayWithContentsOfURL:url];
    
    _messageFrame = [NSMutableArray array];
    Message *previousMSG = nil;
    for (NSDictionary *dict in array) {
        MessageFrame *mf = [[MessageFrame alloc] init];
        Message *msg = [Message messageWithDict:dict];
        BOOL showTime = ![msg.time isEqualToString:previousMSG.time];
        [mf setMessage:msg showTime:showTime];
        [_messageFrame addObject:mf];
        previousMSG = msg;
    }
    
    self.tableView.allowsSelection = NO;
    self.tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
    self.tableView.backgroundView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"chat_bg_default.jpg"]];
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return _messageFrame.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    MessageCell *cell = [tableView dequeueReusableCellWithIdentifier:[MessageCell ID]];
    if (cell == nil) {
        cell = [[MessageCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:[MessageCell ID]];
    }
    cell.messageFrame = _messageFrame[indexPath.row];
    cell.backgroundColor = [UIColor clearColor];
    return cell;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    return [_messageFrame[indexPath.row] cellHeight];
}

@end
