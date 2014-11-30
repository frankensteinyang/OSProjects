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

#warning 此处加上readonly后，有警告，需要搞清楚此处的警告
@property (weak, nonatomic, readonly) IBOutlet UIBarButtonItem *previousBtnItem;

@property (weak, nonatomic, readonly) IBOutlet UIBarButtonItem *nextBtnItem;

@property (nonatomic, weak) id<HKEKeyboardToolDelegate> delegate;

- (IBAction)previous;
- (IBAction)next;
- (IBAction)done;

+ (id)keyboardTool;

@end
