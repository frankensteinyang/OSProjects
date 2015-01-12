//
//  ViewController.m
//  MultithreadingProgramming
//
//  Created by Frankenstein Yang on 1/11/15.
//  Copyright (c) 2015 Frankenstein Yang. All rights reserved.
//

#import "ViewController.h"
#import <pthread.h>

@interface ViewController ()

@property (nonatomic, strong) NSThread *thread;

/**
 *  线程安全模拟
 */
@property (nonatomic, assign) NSInteger leftTicketCount;
@property (nonatomic, strong) NSThread *threadA;
@property (nonatomic, strong) NSThread *threadB;
@property (nonatomic, strong) NSThread *threadC;
@property (nonatomic, strong) NSObject *lock;

@property (weak, nonatomic) IBOutlet UIImageView *imageView;

- (IBAction)btnClick;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    /**
     'NSInvalidArgumentException', reason: '*** -[NSThread start]: attempt to start the thread again'
     :returns: 生命周期死亡
     */
    self.thread = [[NSThread alloc] initWithTarget:self selector:@selector(lifeCycle) object:nil];
    self.thread.name = @"线程的生命周期探究";
    
    /**
     *  线程安全
     */
    self.leftTicketCount = 100;
    self.threadA = [[NSThread alloc] initWithTarget:self selector:@selector(saleTicket) object:nil];
    self.threadA.name = @"售票员A";
    // 优先级
    self.threadA.threadPriority = 1.0;
    
    self.threadB = [[NSThread alloc] initWithTarget:self selector:@selector(saleTicket) object:nil];
    self.threadB.name = @"售票员B";
    self.threadB.threadPriority = 0.0;
    
    self.threadC = [[NSThread alloc] initWithTarget:self selector:@selector(saleTicket) object:nil];
    self.threadC.name = @"售票员C";
    self.threadC.threadPriority = 0.0;
    self.lock = [[NSObject alloc] init];
    
}

/**
 *  线程间通信
 *
 *  @param IBAction 下载图片
 *
 *  @return 主线程
 */
- (IBAction)btnDownloadImg {
    
    [self performSelectorInBackground:@selector(download) withObject:nil];
    
}

/**
 *  下载子线程（线程间交互）
 */
- (void)download {

    NSURL *url = [NSURL URLWithString:@"http://p2.qhimg.com/dmfd/219_132_/t01fe4827083227d5c9.jpg?size=600x370"];
    NSData *data = [NSData dataWithContentsOfURL:url]; // 耗时
    UIImage *img = [UIImage imageWithData:data];
//    [self performSelectorOnMainThread:@selector(settingImg:) withObject:img waitUntilDone:NO];
//    [self.imageView performSelectorOnMainThread:@selector(setImage:) withObject:img waitUntilDone:NO];
    [self.imageView performSelector:@selector(setImage:) onThread:[NSThread mainThread] withObject:img waitUntilDone:NO];
    
}

/**
 *  线程间通信
 *
 *  @param img
 */
//- (void)settingImg:(UIImage *)img {
//
//    self.imageView.image = img;
//    
//}

/**
 *  线程安全
 *
 *  @param IBAction 互斥锁/同步锁
 *
 *  @return 线程安全解决
 */
- (IBAction)btnThreadSafety {
    
    [self.threadA start];
    [self.threadB start];
    [self.threadC start];
    
}

/**
 *  卖票
 */
- (void)saleTicket {

    // OC加锁锁的是代码
//    NSLock *lock = [[NSLock alloc] init];

    // C语言非0既真
    while (1) {
        @synchronized(self.lock) { // 开始加锁
            int count = self.leftTicketCount;
            if (count > 0) {
                // 暂停
//                [NSThread sleepForTimeInterval:0.0002];
                
                self.leftTicketCount = count - 1;
                NSLog(@"售票员%@卖了一张票，剩余%d张票", [NSThread currentThread].name, self.leftTicketCount);
            } else {
                [NSThread exit];
            }
        } // 解锁
        
    }
}

/**
 *  生命周期
 *
 *  @param IBAction LifeCycle
 *
 *  @return nil
 */
- (IBAction)btnLifeCycle {
    
    [self.thread start];
    
}

- (void)lifeCycle {

    NSLog(@"开始 %@", [NSThread currentThread].name);
    // 阻塞状态
//    [NSThread sleepForTimeInterval:5];
    
    // 睡眠
//    NSDate *date = [NSDate dateWithTimeIntervalSinceNow:5.0];
//    [NSThread sleepUntilDate:date];
    
    for (int i = 0; i < 1000; i++) {
        NSLog(@"%d %@", i, [NSThread currentThread].name);
        if (i == 50) {
            // [NSThread exit] = return
            [NSThread exit];
        }
    }
    NSLog(@"结束 %@", [NSThread currentThread].name);
    
}

/**
 *  NSThread
 */
- (IBAction)btnNSThread {
    
    NSThread *current = [NSThread currentThread];
    NSLog(@"%@", current);
    NSThread *threadA = [[NSThread alloc] initWithTarget:self selector:@selector(run:) object:@"Frankenstein"];
    threadA.name = @"线程A";
    [threadA start];
    
    NSThread *threadB = [[NSThread alloc] initWithTarget:self selector:@selector(run:) object:@"Frankie"];
    threadB.name = @"线程B";
    [threadB start];
    
    // 创建完线程自动启动
    [NSThread detachNewThreadSelector:@selector(run:) toTarget:self withObject:@"I am a param"];
    
}

- (void)run:(NSString *)param {

    for (int i = 0; i < 20000; i++) {
        NSLog(@"%@ %@", [NSThread currentThread], param);
    }
    
}

/**
 *  pthread研究
 */
- (IBAction)btnClick {
    
    // 获得当前的线程
    NSThread *current = [NSThread currentThread];
    // 执行耗时操作，创建一条子线程
    pthread_t threadID;
    pthread_create(&threadID, NULL, run, NULL);
    NSLog(@"%@", current);
//    for (int i = 0; i < 20000; i++) {
//        NSLog(@"%@", current);
//    }
    
}

// C语言函数
void *run(void *data) {

    NSThread *current = [NSThread currentThread];
    for (int i = 0; i < 20000; i++) {
        NSLog(@"%@", current);
    }
    return NULL;
    
}

@end
