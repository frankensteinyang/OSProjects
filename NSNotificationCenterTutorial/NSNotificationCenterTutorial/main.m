//
//  main.m
//  NSNotificationCenterTutorial
//
//  Created by Hannibal Yang on 11/17/14.
//  Copyright (c) 2014 Hannibal Yang. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "NewsMedia.h"
#import "Person.h"

int main(int argc, const char * argv[]) {
    @autoreleasepool {
        
        NewsMedia *tencent = [[NewsMedia alloc] init];
        tencent.name = @"腾讯";
        
        NewsMedia *sina = [[NewsMedia alloc] init];
        sina.name = @"新浪";
        
        Person *p = [[Person alloc] init];
        p.name = @"小杨";
        
        Person *p1 = [[Person alloc] init];
        p1.name = @"Hannibal";
        
        // 监听通知
        NSNotificationCenter *center = [NSNotificationCenter defaultCenter];
//        [center addObserver:p selector:@selector(getNews:) name:@"tech_news" object:tencent];
//        [center addObserver:p1 selector:@selector(getNews:) name:@"tech_news" object:tencent];
//        [center addObserver:p selector:@selector(getNews:) name:@"tech_news" object:sina];
//        [center addObserver:p1 selector:@selector(getNews:) name:@"tech_news" object:sina];
        
        // 不管是谁发布的通知，只要通知名称是tech_news，就能拦截到
//        [center addObserver:p selector:@selector(getNews:) name:@"tech_news" object:nil];
        
        // 拦截所有通知
        [center addObserver:p1 selector:@selector(getNews:) name:nil object:nil];
        
        // 发出通知 1.
//        NSNotification *notification = [NSNotification notificationWithName:@"tech_news" object:tencent];
        
        // 2.
//        NSNotification *notification = [NSNotification notificationWithName:@"tech_news" object:tencent userInfo:@{
//                                                                                                                   @"title" : @"What a guy!",
//                                                @"source" : @"Tencent"                                                                  }];
//        [center postNotification:notification];
        
        // 3.
        [center postNotificationName:@"tech_news" object:tencent userInfo:@{
                                                                            @"title" : @"Go away!",
                                                                            @"source" : @"iFeng"
                                                                            }];
        
        [center postNotificationName:@"tech_news" object:sina userInfo:@{
                                                                         @"title" : @"Hey you!",
                                                                         @"source" : @"BBC"
                                                                         }];
        
        // 发布通知的时候一定要有名称 √postNotificationName，拦截通知的时候不一定要有名称
        [center postNotificationName:nil object:nil userInfo:@{
                                                                        @"title" : @"You are a hero!",
                                                                        @"source" : @"The Times News"
                                                                        }];
    }
    return 0;
}
