//
//  ViewController.m
//  WhatsAppContacts
//
//  Created by Hannibal Yang on 11/24/14.
//  Copyright (c) 2014 Hannibal Yang. All rights reserved.
//

#import "ViewController.h"
#import "WhatsAppCrowd.h"
#import "WhatsAppContacts.h"
#import "WhatsAppCrowdHeader.h"
#import "WhatsAppContactsCell.h"

@interface ViewController () <WhatsAppCrowdHeaderDelegate> {
    
    NSMutableArray *_crowd;
    NSMutableArray *_headers;
}
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // 读取plist
    NSArray *array = [NSArray arrayWithContentsOfFile:[[NSBundle mainBundle] pathForResource:@"contacts.plist" ofType:nil]];
    // 生成模型数据
    _crowd = [NSMutableArray array];
    
    for (NSDictionary *dict in array) {
        WhatsAppCrowd *crowd = [WhatsAppCrowd crowdWithDict:dict];
        [_crowd addObject:crowd];
    }
    
    // 设置每组头部控件的高度
    self.tableView.sectionHeaderHeight = 44;
    
    // 此数组只创建一次，故写在viewDidLoad
    _headers = [NSMutableArray array];
}

#pragma mark - 数据源方法
// 一共有多少组
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    
    return _crowd.count;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {

    // 取出section组对应的WhatsAppCrowd模型
    WhatsAppCrowd *crowd = _crowd[section];
    
    // 返回此组中联系人个数
    return crowd.crowdStatus ? crowd.contactsArray.count : 0;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {

    static NSString *ID = @"WhatsAppID";
    
    // 去缓存池中取出可循环利用的cell
    WhatsAppContactsCell *cell = [tableView dequeueReusableCellWithIdentifier:ID];
    
    // 如果缓存中没有可循环利用的cell，创建一个cell，并标识cell
    if (cell == nil) {
        cell = [[WhatsAppContactsCell alloc] initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:ID];
    }
    
    // 显示数据：取出indexPath.section组对应的WhatsAppCrowd模型
    WhatsAppCrowd *crowd = _crowd[indexPath.section];
    
    // 取出indexPath.row这行对应的联系人
    WhatsAppContacts *contacts = crowd.contactsArray[indexPath.row];
    cell.contactsCell = contacts;
    return  cell;
}

#pragma mark 返回每组的标题
//- (NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section {
//
////    WhatsAppCrowd *crowd = _crowd[section];
////    return crowd.crowdName;
//    return [_crowd[section] crowdName];
//}

- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section {

    // 循环利用header
    if (_headers.count <= section) {
        WhatsAppCrowdHeader *header = [WhatsAppCrowdHeader crowdHeader];
        header.crowd = _crowd[section];
        header.delegate = self;
        [_headers addObject:header];
        return header;
    } else {
        return _headers[section];
    }
}

#pragma mark 代理方法的实现
- (void)crowdHeaderClick:(WhatsAppCrowdHeader *)header {

    [self.tableView reloadData];
}

//- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section {
//    
//    return 44;
//}

@end
