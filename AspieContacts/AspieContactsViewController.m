//
//  AspieContactsViewController.m
//  AspieContacts
//
//  Created by Hannibal Yang on 12/7/14.
//  Copyright (c) 2014 Hannibal Yang. All rights reserved.
//

#define kFilePath [NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES)[0] stringByAppendingPathComponent:@"contacts.data"]

#import "AspieContactsViewController.h"
#import "AspieContactsAddViewController.h"
#import "AspieContacts.h"

@interface AspieContactsViewController () <AspieContactsAddViewControllerDelegate, UITableViewDataSource> {
    
    NSMutableArray *_contacts;
}
@end

@implementation AspieContactsViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    _contacts = [NSKeyedUnarchiver unarchiveObjectWithFile:kFilePath];
    if (_contacts == nil) {
        _contacts = [NSMutableArray array];
    }
}

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {

    NSLog(@"Yah! %@ %@", segue.sourceViewController, segue.destinationViewController);
    
    UINavigationController *navigation = segue.destinationViewController;
    // navigation.topViewController的属性为UIViewController，父类类型赋值给子类，要强制转换，segue.destinationViewController为id类型，故不警告
    AspieContactsAddViewController *add = (AspieContactsAddViewController *)navigation.topViewController;
    
    // 让AspieContactsViewController成为AspieContactsAddViewController的代理
    add.delegate = self;
    
}

- (void)saveViewController:(AspieContactsAddViewController *)save didSaveContacts:(AspieContacts *)contacts {

    [_contacts insertObject:contacts atIndex:0];
    [self.tableView reloadData];
    // 归档
    NSLog(@"%@", kFilePath);
    [NSKeyedArchiver archiveRootObject:_contacts toFile:kFilePath];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {

    static NSString *ID = @"AspieContactsID";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:ID];
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:ID];
    }
    AspieContacts *contacts = _contacts[indexPath.row];
    cell.textLabel.text = contacts.name;
    // detailTextLabel默认不显示，必须把Style设置为:UITableViewCellStyleSubtitle
    cell.detailTextLabel.text = contacts.phone;
    return cell;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {

    return _contacts.count;
}

@end
