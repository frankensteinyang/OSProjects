//
//  AnimateGridLayer.h
//  BiCi
//
//  Created by Frankenstein Yang on 1/15/15.
//  Copyright (c) 2015 Frankenstein Yang. All rights reserved.
//

#import <QuartzCore/QuartzCore.h>
#import <UIKit/UIKit.h>

@interface AnimateGridLayer : CALayer {

    UIImage *image;
    NSString *title;
    UIAccessibilityElement *element;
    UIView *view;
    
}

@property (retain, nonatomic) NSString *title;
@property (retain, nonatomic) UIImage *image;
@property (readonly) UIAccessibilityElement *element;
@property (assign, nonatomic) UIView *view;

@end
