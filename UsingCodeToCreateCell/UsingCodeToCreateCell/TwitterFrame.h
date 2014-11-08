//
//  TwitterFrame.h
//  UsingCodeToCreateCell
//
//  Created by Hannibal Yang on 11/9/14.
//  Copyright (c) 2014 Hannibal Yang. All rights reserved.
//  存放某一个Cell内部所有子控件的frame

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

#define kNameFont [UIFont systemFontOfSize:15]
#define kSourceFont [UIFont systemFontOfSize:12]
#define kTimeFont [UIFont systemFontOfSize:12]
#define kContentFont [UIFont systemFontOfSize:15]

@class Twitter;

@interface TwitterFrame : NSObject

@property (nonatomic, assign, readonly) CGRect iconF;
@property (nonatomic, assign, readonly) CGRect nameF;
@property (nonatomic, assign, readonly) CGRect vipF;
@property (nonatomic, assign, readonly) CGRect timeF;
@property (nonatomic, assign, readonly) CGRect sourceF;
@property (nonatomic, assign, readonly) CGRect contentF;
@property (nonatomic, assign, readonly) CGRect imageF;

@property (nonatomic, assign, readonly) CGFloat cellHeight;
@property (nonatomic, strong) Twitter *twitter;

@end
