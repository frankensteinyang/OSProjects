//
//  InterviewDock.h
//  9188Interview
//
//  Created by Hannibal Yang on 12/8/14.
//  Copyright (c) 2014 Hannibal Yang. All rights reserved.
//

#import <UIKit/UIKit.h>
@class InterviewDock;

@protocol InterviewDockDelegate <NSObject>

@optional
- (void)dock:(InterviewDock *)dock didSelectedFromIndex:(int)fIndex toIndex:(int)tIndex;

@end

@interface InterviewDock : UIView

@property (nonatomic, weak) id<InterviewDockDelegate> delegate;

- (void)addDockItem:(NSString *)title icon:(NSString *)icon selectedIcon:(NSString *)sIcon;

@end
