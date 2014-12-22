//
//  EPLineWidthView.h
//  EPainter
//
//  Created by Hannibal Yang on 12/22/14.
//  Copyright (c) 2014 Frankenstein Yang. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol EPLineWidthViewDelegate <NSObject>

- (void)lineWidthViewSelectedLineWidth:(CGFloat)lineWidth;

@end

@interface EPLineWidthView : UIView

@property (weak, nonatomic) id <EPLineWidthViewDelegate> delegate;

@end
