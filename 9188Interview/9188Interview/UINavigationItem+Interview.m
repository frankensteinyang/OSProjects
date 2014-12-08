//
//  UINavigationItem+Interview.m
//  9188Interview
//
//  Created by Hannibal Yang on 12/9/14.
//  Copyright (c) 2014 Hannibal Yang. All rights reserved.
//

#import "UINavigationItem+Interview.h"

@implementation UINavigationItem (Interview)

- (void)assignmentFromOther:(UINavigationItem *)other {

    // 将新控制器的navigationItem属性值赋值给InterviewMainViewController
    self.rightBarButtonItem = other.rightBarButtonItem;
    self.rightBarButtonItems = other.rightBarButtonItems;
    self.leftBarButtonItem = other.leftBarButtonItem;
    self.leftBarButtonItems = other.leftBarButtonItems;
    self.titleView = other.titleView;
    self.title = other.title;
}

+ (void)assignmentFromObject:(UINavigationItem *)fromObj toObject:(UINavigationItem *)toObj {

    [toObj assignmentFromOther:fromObj];
}

@end
