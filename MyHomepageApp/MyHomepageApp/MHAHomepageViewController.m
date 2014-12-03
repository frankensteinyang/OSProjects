//
//  MHAHomepageViewController.m
//  MyHomepageApp
//
//  Created by Hannibal Yang on 12/2/14.
//  Copyright (c) 2014 Hannibal Yang. All rights reserved.
//

#import "MHAHomepageViewController.h"
#import "MHAEditViewController.h"
#import "MHAEditedInfo.h"
#import "MHAStatusViewController.h"
#import "MHAStatus.h"

@interface MHAHomepageViewController () <UIActionSheetDelegate, MHAEditViewControllerDelegate, MHAStatusViewControllerDelegate, UITableViewDataSource> {
    NSMutableArray *_statuses;
}

@end

@implementation MHAHomepageViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"个人主页";
    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemCompose target:self action:@selector(goToEdit)];
    self.navigationItem.leftBarButtonItem = [[UIBarButtonItem alloc] initWithTitle:@"注销" style:UIBarButtonItemStylePlain target:self action:@selector(logout)];
    _statuses = [NSMutableArray array];
}

- (void)goToEdit {

    MHAEditViewController *edit = [[MHAEditViewController alloc] init];
    edit.delegate = self;
    edit.editedInfo = [MHAEditedInfo editedInfoWithName:_nicknameLabel.text phone:[_phoneLabel.text intValue] introduction:_introductionView.text];
    [self.navigationController pushViewController:edit animated:YES];

}

- (void)logout {

    UIActionSheet *sheet = [[UIActionSheet alloc] initWithTitle:@"是否要注销？" delegate:self cancelButtonTitle:@"取消" destructiveButtonTitle:@"注销" otherButtonTitles:nil, nil];
    [sheet showInView:self.view];
}

- (void)actionSheet:(UIActionSheet *)actionSheet clickedButtonAtIndex:(NSInteger)buttonIndex {

    // if (buttonIndex) = if (buttonIndex != 0)
    if (buttonIndex) return;
    [self.navigationController popViewControllerAnimated:YES];
    
}

- (void)editViewController:(MHAEditViewController *)edit didSaveWithEditedInfo:(MHAEditedInfo *)info {
    
    _nicknameLabel.text = info.nickname;
    _phoneLabel.text = [NSString stringWithFormat:@"%d", info.phoneNumber];
    if ([_phoneLabel.text isEqualToString:@"0"]) {
        _phoneLabel.text = nil;
    }
    _introductionView.text = info.introduction;
    
}

- (IBAction)goToStatus {
    
    MHAStatusViewController *status = [[MHAStatusViewController alloc] init];
    status.delegate = self;
    [self.navigationController pushViewController:status animated:YES];
}

- (void)statusViewController:(MHAStatusViewController *)statusController didSendStatus:(MHAStatus *)status {
    
    // 将新的说说对象插入数组的最前面
    [_statuses insertObject:status atIndex:0];
    [_tableView reloadData];
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    
    return _statuses.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {

    static NSString *ID = @"MHACell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:ID];
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:ID];
    }
    MHAStatus *status = _statuses[indexPath.row];
    cell.textLabel.text = status.statusContent;
    NSDateFormatter *fmt = [[NSDateFormatter alloc] init];
    fmt.dateFormat = @"yyyy-MM-dd HH:mm:ss";
    cell.detailTextLabel.text = [fmt stringFromDate:status.statusTime];
    [cell setBackgroundColor:[UIColor clearColor]];
    return cell;
}
@end
