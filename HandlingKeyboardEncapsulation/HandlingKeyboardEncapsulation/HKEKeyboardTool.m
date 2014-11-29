//
//  HKEKeyboardTool.m
//  HandlingKeyboardEncapsulation
//
//  Created by Hannibal Yang on 11/29/14.
//  Copyright (c) 2014 Hannibal Yang. All rights reserved.
//

#import "HKEKeyboardTool.h"

@implementation HKEKeyboardTool

- (void)previous {
    
    // 通知代理（上一个按钮被点击了）
    if ([_delegate respondsToSelector:@selector(keyboardTool:itemClick:)]) {
        [_delegate keyboardTool:self itemClick:HKEKeyboardToolItemTypePrevious];
    }
}

- (void)next {
    
    // 通知代理（下一个按钮被点击了）
    if ([_delegate respondsToSelector:@selector(keyboardTool:itemClick:)]) {
        [_delegate keyboardTool:self itemClick:HKEKeyboardToolItemTypeNext];
    }
}

- (void)done {
    
    // 通知代理（完成按钮被点击了）
    if ([_delegate respondsToSelector:@selector(keyboardTool:itemClick:)]) {
        [_delegate keyboardTool:self itemClick:HKEKeyboardToolItemTypeDone];
    }
}

+ (id)keyboardTool {

    return [[NSBundle mainBundle] loadNibNamed:@"HKEKeyboardTool" owner:nil options:nil][0];
}

@end
