//
//  ViewController.m
//  WhatsAppLayoutUpgrade
//
//  Created by Hannibal Yang on 11/16/14.
//  Copyright (c) 2014 Hannibal Yang. All rights reserved.
//

#import "ViewController.h"
#import "MessageFrame.h"
#import "MessageCell.h"
#import "Message.h"

@interface ViewController () <UITableViewDataSource, UITableViewDelegate> {
    NSMutableArray *_messageFrame;
}

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    NSString *path = [[NSBundle mainBundle] pathForResource:@"messages.plist" ofType:nil];
    NSURL *url = [NSURL URLWithString:[NSString stringWithFormat:@"file://%@", path]];
    NSArray *array = [NSArray arrayWithContentsOfURL:url];
    
    _messageFrame = [NSMutableArray array];
    Message *previousMSG = nil;
    for (NSDictionary *dict in array) {
        MessageFrame *mf = [[MessageFrame alloc] init];
        Message *msg = [Message messageWithDict:dict];
        BOOL showTime = ![msg.time isEqualToString:previousMSG.time];
        [mf setMessage:msg showTime:showTime];
        [_messageFrame addObject:mf];
        previousMSG = msg;
    }
    
    self.tableView.allowsSelection = NO;
    self.tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
    self.tableView.backgroundView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"chat_bg_default.jpg"]];
    
    // 监听系统发出的键盘通知
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(keyboardWillShow:) name:UIKeyboardWillShowNotification object:nil];
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(keyboardWillHide:) name:UIKeyboardWillHideNotification object:nil];
    
    
}

#pragma mark - 键盘处理
#pragma mark 键盘弹出
- (void)keyboardWillShow:(NSNotification *)notification {
    
//    NSLog(@"%@", notification.userInfo);
    // OC的所有集合中只能放对象
//    id rect = notification.userInfo[UIKeyboardFrameEndUserInfoKey];
//    NSLog(@"%@", [rect class]);
    
    // 获取动画时间
    CGFloat duration = [notification.userInfo[UIKeyboardAnimationDurationUserInfoKey] doubleValue];
    
    // 执行动画
    [UIView animateWithDuration:duration animations:^{
        // 取出键盘的frame
        NSValue *rectValue = notification.userInfo[UIKeyboardFrameEndUserInfoKey];
        CGRect keyboardRect = [rectValue CGRectValue];
        // 让整个控制器的view往上挪动一个键盘的高度
        // transform形变属性还控制平移
        CGFloat translationY = - keyboardRect.size.height;
        self.view.transform = CGAffineTransformMakeTranslation(0, translationY);
    }];

}

#pragma mark 键盘退出
- (void)keyboardWillHide:(NSNotification *)notification {
    
    CGFloat duration = [notification.userInfo[UIKeyboardAnimationDurationUserInfoKey] doubleValue];
    [UIView animateWithDuration:duration animations:^{
        // 恒等变换 （回到默认位置，清空所有的transform效果）
        self.view.transform = CGAffineTransformIdentity;
    }];
    
}

- (void)dealloc {
    [[NSNotificationCenter defaultCenter] removeObserver:self];
}

#pragma mark - 代理方法
// 此方法有一个键盘退出的bug，滚动情况下，键盘弹不出
//- (void)scrollViewDidScroll:(UIScrollView *)scrollView {
//    
//    [self.view endEditing:YES];
//}
// 开始拖拽的时候调用一次
- (void)scrollViewWillBeginDragging:(UIScrollView *)scrollView {
    
    [self.view endEditing:YES];
}

#pragma mark - 数据源方法
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return _messageFrame.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    MessageCell *cell = [tableView dequeueReusableCellWithIdentifier:[MessageCell ID]];
    if (cell == nil) {
        cell = [[MessageCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:[MessageCell ID]];
    }
    cell.messageFrame = _messageFrame[indexPath.row];
    cell.backgroundColor = [UIColor clearColor];
    return cell;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    return [_messageFrame[indexPath.row] cellHeight];
}

@end
