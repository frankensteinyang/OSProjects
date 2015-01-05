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

- (void)appendText:(NSString *)text {

    NSMutableString *str = [NSMutableString stringWithString:_textView.text];
    [str appendFormat:@"%@\n", text];
    [_textView setText:str];
    
}

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
    }
}

- (IBAction)gcdSale {
    
    [Ticket sharedTicket].tickets = 20;
    
    // GCD队列
    dispatch_queue_t queue = dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0);
    
    // GCD异步
    dispatch_async(queue, ^{
        [self gcdSaleWithName:@"GCD-A"];
    });
    
    dispatch_async(queue, ^{
        [self gcdSaleWithName:@"GCD-B"];
    });
    
    dispatch_async(queue, ^{
        [self gcdSaleWithName:@"GCD-C"];
    });
    
}

- (void)operationSaleWithName:(NSString *)name {

    
}

- (IBAction)operationSale {
    
    [_queue addOperationWithBlock:^{
//        [self ope]
    }];
    
    
}

@end
