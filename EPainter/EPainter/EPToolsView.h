//
//  EPToolsView.h
//  EPainter
//
//  Created by Hannibal Yang on 12/21/14.
//  Copyright (c) 2014 Frankenstein Yang. All rights reserved.
//

#import <UIKit/UIKit.h>

#define kToolsViewHeight ((IS_IOS7) ? 64.0 : 44.0)

typedef enum {
    
    kToolsViewColor = 0,
    kToolsViewLineWidth,
    kToolsViewEraser,
    kToolsViewUndo,
    kToolsViewClear,
    kToolsViewPhoto,
    kToolsViewSave
    
} kToolsViewFunction;

@protocol EPToolsViewDelegate <NSObject>

// 颜色选择
- (void)toolsViewSelectedColor:(UIColor *)color;

// 线宽选择
- (void)toolsViewSelectedLineWidth:(CGFloat)lineWidth;

// 通知视图控制器，选择了某项功能
- (void)toolsViewSelectedFunction:(kToolsViewFunction)function;

@end

@interface EPToolsView : UIView

@property (nonatomic, weak) id <EPToolsViewDelegate> delegate;

@end
