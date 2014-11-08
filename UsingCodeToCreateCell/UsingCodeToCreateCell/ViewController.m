//
//  ViewController.m
//  UsingCodeToCreateCell
//
//  Created by Hannibal Yang on 11/8/14.
//  Copyright (c) 2014 Hannibal Yang. All rights reserved.
//

#import "ViewController.h"
#import "TwitterCell.h"
#import "Twitter.h"
#import "TwitterFrame.h"

@interface ViewController () {
    NSMutableArray *_twitterFrame;
}
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    NSArray *array = [NSArray arrayWithContentsOfFile:[[NSBundle mainBundle] pathForResource:@"weibo.plist" ofType:nil]];
    _twitterFrame = [NSMutableArray array];
    for (NSDictionary *dict in array) {
        TwitterFrame *twitterF =[[TwitterFrame alloc] init];
        twitterF.twitter = [Twitter twitterWithDict:dict];
        [_twitterFrame addObject:twitterF];
    }
    
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return _twitterFrame.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    static NSString *ID = @"TwitterID";
    TwitterCell *cell = [tableView dequeueReusableCellWithIdentifier:ID];
    
    if (cell == nil) {
        cell = [[TwitterCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:ID];
    }
    
    // 传递模型数据
    cell.twitterFrame = _twitterFrame[indexPath.row];
    
    return cell;
}

#pragma mark - 代理方法
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return [_twitterFrame[indexPath.row] cellHeight];
}
@end
