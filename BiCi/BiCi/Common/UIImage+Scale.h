//
//  UIImage+Scale.h
//  BiCi
//
//  Created by Frankenstein Yang on 1/15/15.
//  Copyright (c) 2015 Frankenstein Yang. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIImage (Scale)

- (UIImage *)imageByScalingProportionallyToSize:(CGSize)targetSize sourceImage:(UIImage *)sourceImage;

- (UIImage *)imageByScalingAndCroppingForSize:(CGSize)targetSize image:(UIImage *)sourceImage;

@end
