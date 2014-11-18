//
//  Person.h
//  NSNotificationCenterTutorial
//
//  Created by Hannibal Yang on 11/17/14.
//  Copyright (c) 2014 Hannibal Yang. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Person : NSObject

@property (nonatomic, copy) NSString *name;

- (void)getNews:(NSNotification *)notification;

@end
