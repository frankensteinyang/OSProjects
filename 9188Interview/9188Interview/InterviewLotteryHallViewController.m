//
//  InterviewLotteryHallViewController.m
//  9188Interview
//
//  Created by Hannibal Yang on 12/8/14.
//  Copyright (c) 2014 Hannibal Yang. All rights reserved.
//

#import "InterviewLotteryHallViewController.h"
#import "InterviewUnionLottoViewController.h"

@interface InterviewLotteryHallViewController ()

@end

@implementation InterviewLotteryHallViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"购彩大厅";
    
    UIButton *rightBtn = [[UIButton alloc] initWithFrame:CGRectMake(0, 0, 31, 22)];
    UIButton *noticeIconBtn = [[UIButton alloc] initWithFrame:CGRectMake(22, 0, 9, 9)];
    [rightBtn setImage:[UIImage imageNamed:@"NoticeIcon.png"] forState:UIControlStateNormal];
    [noticeIconBtn setImage:[UIImage imageNamed:@"left_red.png"] forState:UIControlStateNormal];
    UIView *noticeView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 31, 22)];
    [noticeView addSubview:rightBtn];
    [noticeView addSubview:noticeIconBtn];
    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc] initWithCustomView:noticeView];
    
    
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

    InterviewUnionLottoViewController *unionLotto = [[InterviewUnionLottoViewController alloc] init];
    // 跨级访问控制器
    [self.navigationController pushViewController:unionLotto animated:YES];
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {

    return 100;
}

@end
