//
//  InterviewNoticeViewController.m
//  9188Interview
//
//  Created by Hannibal Yang on 12/10/14.
//  Copyright (c) 2014 Hannibal Yang. All rights reserved.
//

#import "InterviewNoticeViewController.h"

@implementation InterviewNoticeViewController

- (void)viewDidLoad {

    self.title = @"公告";
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {

    static NSString *ID = @"NoticeCellID";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:ID];
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:ID];
    }
    cell.textLabel.text = @"Frankenstein!";
    return cell;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {

    return 10;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {

    NSLog(@"***");
}

@end
