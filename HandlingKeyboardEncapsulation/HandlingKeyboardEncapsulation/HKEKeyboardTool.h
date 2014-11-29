//
//  HKEKeyboardTool.h
//  HandlingKeyboardEncapsulation
//
//  Created by Hannibal Yang on 11/29/14.
//  Copyright (c) 2014 Hannibal Yang. All rights reserved.
//

#import <UIKit/UIKit.h>
@class HKEKeyboardTool;

typedef enum {
    
    HKEKeyboardToolItemTypePrevious,
    HKEKeyboardToolItemTypeNext,
    HKEKeyboardToolItemTypeDone

} HKEKeyboardToolItemType;

@protocol HKEKeyboardToolDelegate <NSObject>

@optional
- (void)keyboardTool:(HKEKeyboardTool *)keyboardTool itemClick:(HKEKeyboardToolItemType)itemType;

@end

@interface HKEKeyboardTool : UIView

@property (weak, nonatomic) IBOutlet UIBarButtonItem *previousBtnItem;

@property (weak, nonatomic) IBOutlet UIBarButtonItem *nextBtnItem;

@property (nonatomic, weak) id<HKEKeyboardToolDelegate> delegate;

- (IBAction)previous;
- (IBAction)next;
- (IBAction)done;

+ (id)keyboardTool;

@end
