//
//  InterviewLotteryHallViewController.m
//  9188Interview
//
//  Created by Hannibal Yang on 12/8/14.
//  Copyright (c) 2014 Hannibal Yang. All rights reserved.
//

#import "InterviewLotteryHallViewController.h"
#import "InterviewUnionLottoViewController.h"
#import "InterviewNoticeViewController.h"

@interface InterviewLotteryHallViewController ()

@end

@implementation InterviewLotteryHallViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"购彩大厅";
    
    UIButton *noticeBtn = [[UIButton alloc] initWithFrame:CGRectMake(0, 7, 31, 22)];
    UIButton *badgeBtn = [[UIButton alloc] initWithFrame:CGRectMake(17, 0, 9, 9)];
    [noticeBtn setImage:[UIImage imageNamed:@"NoticeIcon.png"] forState:UIControlStateNormal];
    [badgeBtn setBackgroundImage:[UIImage imageNamed:@"left_red.png"] forState:UIControlStateDisabled];
    UIView *noticeView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 31, 31)];
    badgeBtn.enabled = NO;
    [noticeBtn addTarget:self action:@selector(go2Notice) forControlEvents:UIControlEventTouchDown];
    [noticeView addSubview:badgeBtn];
    [noticeView addSubview:noticeBtn];
    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc] initWithCustomView:noticeView];
    
}

- (void)go2Notice {

    InterviewNoticeViewController *noticeController = [[InterviewNoticeViewController alloc] init];
    [self.navigationController pushViewController:noticeController animated:YES];
}

#pragma mark - Table view data source
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    
    return 10;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {

    static NSString *ID = @"9188cell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:ID];
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:ID];
    }
    
    cell.textLabel.text = @"9188面试！";
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {

    InterviewUnionLottoViewController *unionLottoController = [[InterviewUnionLottoViewController alloc] init];
    // 跨级访问控制器
    [self.navigationController pushViewController:unionLottoController animated:YES];
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {

    return 100;
}

@end
