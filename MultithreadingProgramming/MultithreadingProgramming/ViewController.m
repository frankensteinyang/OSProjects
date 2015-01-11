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
