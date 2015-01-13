//
//  ViewController.m
//  Pull2Refresh
//
//  Created by Frankenstein Yang on 1/13/15.
//  Copyright (c) 2015 Frankenstein Yang. All rights reserved.
//

#import "ViewController.h"
#import "MJRefresh.h"

@interface ViewController ()

@property (weak, nonatomic) IBOutlet UITableView *tableView;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    // 集成刷新控件（下拉上拉）
    [self setupRefresh];
    
}

- (void)setupRefresh {
    
    [self.tableView addHeaderWithTarget:self action:@selector(headerRefreshing) dateKey:@"table"];
    [self.tableView headerBeginRefreshing];
    [self.tableView addFooterWithTarget:self action:@selector(footerRefreshing)];
    
}

- (void)headerRefreshing {

    NSLog(@"进入程序就自动刷新！");
    
}

- (void)footerRefreshing {

    NSLog(@"上拉加载更多");
    
}

@end
