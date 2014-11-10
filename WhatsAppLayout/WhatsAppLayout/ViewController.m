//
//  ViewController.m
//  WhatsAppLayout
//
//  Created by Hannibal Yang on 11/10/14.
//  Copyright (c) 2014 Hannibal Yang. All rights reserved.
//

#import "ViewController.h"
#import "MessageCell.h"
#import "Message.h"

@interface ViewController () {
    NSMutableArray *_messages;
}

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    // URL : 资源路径
    // URL ： 某一个资源的唯一路径
    // URL的组成 ： 协议头 + 路径
    // URL的固定写法 ： 协议头://路径
    
    NSString *path = [[NSBundle mainBundle] pathForResource:@"messages.plist" ofType:nil];
    // 如果路径中有中文，用下面代码进行转码操作
//    path = [path stringByAddingPercentEscapesUsingEncoding:NSUTF8StringEncoding];
    // 1.加载plist文件的第一种方法
    NSURL *url = [NSURL URLWithString:[NSString stringWithFormat:@"file://%@", path]];
    NSArray *array = [NSArray arrayWithContentsOfURL:url];
    
    // 2.加载plist文件的第二种方法
//    NSArray *arrayTwo = [NSArray arrayWithContentsOfFile:path];
    
    // 3.加载plist文件的第三种方法
    // fileURLWithPath 传的路径为file://开头的协议头，自动拼接协议头，并且自带主机名localhost
    // 此方法由于fileURLWithPath自动拼接localhost，所以在此不可用
//    NSURL *urlTwo = [NSURL fileURLWithPath:path];
//    NSLog(@"%@", urlTwo);
//    NSArray *arrayThree = [NSArray arrayWithContentsOfURL:urlTwo];
    
    // 4.加载plist文件的第四种方法; withExtension为扩展名，前面已经添加.plist，所以后面传空
//    NSURL *urlThree = [[NSBundle mainBundle] URLForResource:@"messages.plist" withExtension:nil];
//    NSArray *arrayFour = [NSArray arrayWithContentsOfURL:urlThree];
//    NSLog(@"%@", arrayFour);
    
    // 将字典转成模型
    _messages = [NSMutableArray array];
    for (NSDictionary *dict in array) {
        Message *msg = [Message messageWithDict:dict];
        
        [_messages addObject:msg];
    }
    
    
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return _messages.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    MessageCell *cell = [tableView dequeueReusableCellWithIdentifier:[MessageCell ID]];
    
    if (cell == nil) {
        cell = [[MessageCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:[MessageCell ID]];
    }
    
//    cell.
    
    return cell;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return 80;
}

@end
