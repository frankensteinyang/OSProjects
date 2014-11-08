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

@interface ViewController () {
    NSMutableArray *_twitter;
}
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    NSArray *array = [NSArray arrayWithContentsOfFile:[[NSBundle mainBundle] pathForResource:@"weibo.plist" ofType:nil]];
    _twitter = [NSMutableArray array];
    for (NSDictionary *dict in array) {
        [_twitter addObject:[Twitter twitterWithDick:dict]];
    }
    
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return _twitter.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    static NSString *ID = @"TwitterID";
    TwitterCell *cell = [tableView dequeueReusableCellWithIdentifier:ID];
    
    if (cell == nil) {
        cell = [[TwitterCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:ID];
    }
    
    cell.twitter = _twitter[indexPath.row];
    
    return cell;
}

@end
