//
//  YangViewController.m
//  TmallDemo
//
//  Created by Hannibal Yang on 10/17/14.
//  Copyright (c) 2014 Hannibal Yang. All rights reserved.
//

#import "YangViewController.h"

@interface YangViewController () <UITableViewDataSource, UITableViewDelegate>

@end

@implementation YangViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 9;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:nil];
    cell.textLabel.text = [NSString stringWithFormat:@"产品-%d", indexPath.row];
    cell.detailTextLabel.text = [NSString stringWithFormat:@"产品-%d非常好！！！", indexPath.row];
    NSString *imgName = [NSString stringWithFormat:@"00%d.png", indexPath.row+1];
    
    cell.imageView.image = [UIImage imageNamed:imgName];
    
    if (indexPath.row % 2 == 0) {
        cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
    } else {
        cell.accessoryType = UITableViewCellAccessoryNone;
    }
    
//    cell.accessoryView = [UIButton buttonWithType:UIButtonTypeContactAdd];
    
    return cell;
}

#pragma mark return cell's height
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 80;
}

@end
