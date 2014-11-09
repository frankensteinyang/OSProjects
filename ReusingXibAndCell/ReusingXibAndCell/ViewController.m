//
//  ViewController.m
//  ReusingXibAndCell
//
//  Created by Hannibal Yang on 11/10/14.
//  Copyright (c) 2014 Hannibal Yang. All rights reserved.
//

#import "ViewController.h"
#import "NewsCell.h"

@interface ViewController () {
    NSMutableArray *_data;
}

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    _data = [NSMutableArray array];
    
    News *newsA = [[News alloc] init];
    newsA.image = @"news_04.jpg";
    newsA.comments = [@"15" intValue];
    newsA.author = @"八戒";
    newsA.title = @"取经打滑";
    [_data addObject:newsA];
    
    News *newsB = [[News alloc] init];
    newsB.image = @"news_00.jpg";
    newsB.comments = [@"88" intValue];
    newsB.author = @"沙悟净";
    newsB.title = @"找悟空去";
    [_data addObject:newsB];
    
    self.tableView.rowHeight = 80;
    
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return _data.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    NewsCell *cell = [tableView dequeueReusableCellWithIdentifier:[NewsCell ID]];
    
    if (cell == nil) {
        cell = [NewsCell newsCell];
    }
    
    cell.news = _data[indexPath.row];
    
    return cell;
}

@end
