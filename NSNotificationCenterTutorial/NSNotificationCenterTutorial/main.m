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
        
        NSNotificationCenter *center = [NSNotificationCenter defaultCenter];
        [center addObserver:p selector:@selector(getNews) name:@"tech_news" object:tencent];
        [center addObserver:p1 selector:@selector(getNews) name:@"tech_news" object:tencent];
        
        NSNotification *notification = [NSNotification notificationWithName:@"tech_news" object:tencent];
        
        [center postNotification:notification];
    }
    return 0;
}
