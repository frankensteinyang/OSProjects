//
//  EPColorView.h
//  EPainter
//
//  Created by Hannibal Yang on 12/22/14.
//  Copyright (c) 2014 Frankenstein Yang. All rights reserved.
//

#import <UIKit/UIKit.h>

@class EPColorView;

@protocol EPColorViewDelegate <NSObject>

- (void)colorViewSelectedColor:(UIColor *)color;

@end

@interface EPColorView : UIView

@property (nonatomic, weak) id <EPColorViewDelegate> delegate;

@end
