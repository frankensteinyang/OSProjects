//
//  AnimateGridImageViewController.h
//  BiCi
//
//  Created by Frankenstein Yang on 1/15/15.
//  Copyright (c) 2015 Frankenstein Yang. All rights reserved.
//

#import <UIKit/UIKit.h>

@class AnimateGridImageViewController;

@protocol AnimateGridImageViewControllerDelegate <NSObject>

- (void)imageViewControllerDidClose:(AnimateGridImageViewController *)inController;

@end

@interface AnimateGridImageViewController : UIViewController {

    id <AnimateGridImageViewControllerDelegate> delegate;
    UIImageView *imageView;
    UIImage *image;
    UILabel *label;
    
}

@property (assign, nonatomic) id <AnimateGridImageViewControllerDelegate> delegate;
@property (retain, nonatomic) UIImage *image;
@property (retain, nonatomic) UILabel *label;

@end
