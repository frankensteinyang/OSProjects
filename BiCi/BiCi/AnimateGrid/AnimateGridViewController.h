//
//  AnimateGridViewController.h
//  BiCi
//
//  Created by Frankenstein Yang on 1/15/15.
//  Copyright (c) 2015 Frankenstein Yang. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "AnimateGridLayer.h"
#import "AnimateGridImageViewController.h"
#import "AnimateGridControl.h"

@interface AnimateGridViewController : UIViewController <AnimateGridControlDelegate, AnimateGridImageViewControllerDelegate> {

    AnimateGridControl *control;
    AnimateGridImageViewController *imageViewController;
    UINavigationController *imageNavController;
    NSArray *images;
    
    AnimateGridLayer *transitionLayer;
    
}

@property (retain, nonatomic) AnimateGridControl *control;
@property (retain, nonatomic) AnimateGridLayer *transitionLayer;

@end
