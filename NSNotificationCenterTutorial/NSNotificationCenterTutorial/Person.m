//
//  Person.m
//  NSNotificationCenterTutorial
//
//  Created by Hannibal Yang on 11/17/14.
//  Copyright (c) 2014 Hannibal Yang. All rights reserved.
//

#import "Person.h"

@implementation Person

-(void)getNews:(NSNotification *)notification {
    
    NSString *title = notification.userInfo[@"title"];
    NSString *source = notification.userInfo[@"source"];
    NSLog(@"%@从%@获得了一条标题为“%@”的新闻。", _name, source, title);
}

@end
