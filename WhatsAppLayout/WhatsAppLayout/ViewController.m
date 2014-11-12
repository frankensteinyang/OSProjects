//
//  ViewController.m
//  WhatsAppLayout
//
//  Created by Hannibal Yang on 11/10/14.
//  Copyright (c) 2014 Hannibal Yang. All rights reserved.
//

#import "ViewController.h"
#import "MessageFrame.h"
#import "MessageCell.h"
#import "Message.h"

@interface ViewController () {
    NSMutableArray *_messageFrame;
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
    _messageFrame = [NSMutableArray array];
    Message *previousMsg = nil;
    for (NSDictionary *dict in array) {
        
        // 时间的显示
//        if ([msg.time isEqualToString:previousMsg.time]) {
//            mf.showTime = NO;
//        } else {
//            mf.showTime = YES;
//        }
//        mf.showTime = ![msg.time isEqualToString:previousMsg.time];
//        mf.message = msg;
        
        MessageFrame *mf = [[MessageFrame alloc] init];
        Message *msg = [Message messageWithDict:dict];
        BOOL showTime = ![msg.time isEqualToString:previousMsg.time];
        [mf setMessage:msg showTime:showTime];
        [_messageFrame addObject:mf];
        previousMsg = msg;
    }
    
    // 禁止Cell处理点击事件
    self.tableView.allowsSelection = NO;
    
    // 去除分隔线
    self.tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
    
    // 设置背景图片两种方法：1.把图片转为颜色
//    self.tableView.backgroundColor = [UIColor colorWithPatternImage:[UIImage imageNamed:@"chat_bg_default.jpg"]];
    // 2.initWithImage
    self.tableView.backgroundView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"chat_bg_default.jpg"]];
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return _messageFrame.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    MessageCell *cell = [tableView dequeueReusableCellWithIdentifier:[MessageCell ID]];
    if (cell == nil) {
        cell = [[MessageCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:[MessageCell ID]];
    }
    
    cell.messageFrame = _messageFrame[indexPath.row];
    
    // 在之前的版本中UITableViewCell的backgroundColor是透明背景的，但是在iOS7中是默认白色背景
    // 如果在TableView后面加入背景的应用要注意了，在创建UITableViewCell的时候把backgroundColor设置为[UIColor clearColor]
    cell.backgroundColor = [UIColor clearColor];
    
    return cell;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return [_messageFrame[indexPath.row] cellHeight];
}

@end
