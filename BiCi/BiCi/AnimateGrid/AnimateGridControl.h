//
//  AnimateGridControl.h
//  BiCi
//
//  Created by Frankenstein Yang on 1/15/15.
//  Copyright (c) 2015 Frankenstein Yang. All rights reserved.
//

#import <UIKit/UIKit.h>

@class AnimateGridControl;

@protocol AnimateGridControlDelegate <NSObject>

@required

- (NSUInteger)numberOfItemsInGridControl:(AnimateGridControl *)inControl;
- (UIImage *)imageForItemInGridControl:(AnimateGridControl *)inControl atIndex:(NSUInteger)inIndex;
- (void)gridContol:(AnimateGridControl *)inControl didSelectItemAtIndex:(NSUInteger)inIndex withLayer:(CALayer *)inLayer;

@end

@interface AnimateGridControl : UIScrollView {

    id <AnimateGridControlDelegate> dataSource;
    NSMutableArray *layers;
    NSUInteger selectedIndex;
    
}

- (void)reloadData;
- (void)resetSelection;

@property (assign, nonatomic) id <AnimateGridControlDelegate> dataSource;
@property (readonly) NSUInteger selectedIndex;

@end
