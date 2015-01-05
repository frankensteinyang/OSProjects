//
//  ViewController.m
//  TicketingSystem
//
//  Created by Frankenstein Yang on 1/3/15.
//  Copyright (c) 2015 Frankenstein Yang. All rights reserved.
//

#import "ViewController.h"
#import "Ticket.h"

@interface ViewController () {

    // 全局操作队列
    NSOperationQueue *_queue;
    
}
    
@property (weak, nonatomic) IBOutlet UITextView *textView;
    
@end

@implementation ViewController

- (void)viewDidLoad {
    
    [super viewDidLoad];
//    Ticket *ticketA = [Ticket sharedTicket];
//    [Ticket sharedTicket].tickets = 30;
//    NSLog(@"%@", ticketA);
//    
//    Ticket *ticketB = [Ticket sharedTicket];
//    NSLog(@"%@ %d", ticketB, ticketB.tickets);
//    
//    for (NSInteger i = 0; i < 10; i++) {
//        [self appendText:@"Frankenstein"];
//    }
    
    // 实例化操作队列
    _queue = [[NSOperationQueue alloc] init];
    
}

- (void)appendText:(NSString *)text {
    
    NSMutableString *str = [NSMutableString stringWithString:_textView.text];
    [str appendFormat:@"%@\n", text];
    [_textView setText:str];
    
//    NSRange range = NSMakeRange(str.length - 1, 1);
//    [_textView scrollRangeToVisible:range];
    
}

- (void)gcdSaleWithName:(NSString *)name {

    while (YES) {
        @synchronized (self) {
            if ([Ticket sharedTicket].tickets > 0) {
                [Ticket sharedTicket].tickets--;
                NSString *str = [NSString stringWithFormat:@"剩余票数 %d %@", [Ticket sharedTicket].tickets, name];
                // 更新UI
                dispatch_async(dispatch_get_main_queue(), ^{
                    [self appendText:str];
                });
            } else {
                break;
            }
        }
        
        // 模拟售票休息
        if ([name isEqualToString:@"GCD-A"]) {
            [NSThread sleepForTimeInterval:1.0f];
        } else {
            [NSThread sleepForTimeInterval:0.5f];
        }
    }
}

- (IBAction)gcdSale {
    
    [Ticket sharedTicket].tickets = 30;
    
    _textView.text = @"";
    
    // GCD队列
    dispatch_queue_t queue = dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0);
    
    // GCD异步
//    dispatch_async(queue, ^{
//        [self gcdSaleWithName:@"GCD-A"];
//    });
//    
//    dispatch_async(queue, ^{
//        [self gcdSaleWithName:@"GCD-B"];
//    });
//    
//    dispatch_async(queue, ^{
//        [self gcdSaleWithName:@"GCD-C"];
//    });

    // 群组
    dispatch_group_t group = dispatch_group_create();
    dispatch_group_async(group, queue, ^{
        [self gcdSaleWithName:@"GCD-A"];
    });
    dispatch_group_async(group, queue, ^{
        [self gcdSaleWithName:@"GCD-B"];
    });
    dispatch_group_notify(group, queue, ^{
        NSLog(@"卖完了！");
    });
    
}

- (void)operationSaleWithName:(NSString *)name {

    while (YES) {
        @synchronized (self) {
            if ([Ticket sharedTicket].tickets > 0) {
                [Ticket sharedTicket].tickets--;
                NSString *str = [NSString stringWithFormat:@"剩余票数 %d %@", [Ticket sharedTicket].tickets, name];
                // 更新UI
                [[NSOperationQueue mainQueue] addOperationWithBlock:^{
                    [self appendText:str];
                }];
            } else {
                break;
            }
        }
        if ([name isEqualToString:@"GCD-A"]) {
            [NSThread sleepForTimeInterval:1.0f];
        } else {
            [NSThread sleepForTimeInterval:0.5f];
        }
    }
    
}

- (IBAction)operationSale {
    
    [Ticket sharedTicket].tickets = 30;
    _textView.text = @"";
    [_queue addOperationWithBlock:^{
        [self operationSaleWithName:@"Operation-A"];
    }];
    
    [_queue addOperationWithBlock:^{
        [self operationSaleWithName:@"Operation-B"];
    }];
}

@end
