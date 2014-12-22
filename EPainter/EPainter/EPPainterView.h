//
//  EPPainterView.h
//  EPainter
//
//  Created by Hannibal Yang on 12/21/14.
//  Copyright (c) 2014 Frankenstein Yang. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol EPPainterViewDelegate <NSObject>

- (void)painterViewBeTapped;

@end

@interface EPPainterView : UIView

@property (weak, nonatomic) id <EPPainterViewDelegate> delegate;

@property (strong, nonatomic) UIColor *color;

@property (assign, nonatomic) CGFloat lineWidth;

// 用户选择的照片
@property (strong, nonatomic) UIImage *image;

// 撤销
- (void)undo;

// 清屏
- (void)clear;

// 保存到相册
- (void)savePhoto;

@end
