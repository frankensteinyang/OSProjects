//
//  CompressibleStickerViewController.h
//  BiCi
//
//  Created by Frankenstein Yang on 1/15/15.
//  Copyright (c) 2015 Frankenstein Yang. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface CompressibleStickerViewController : UIViewController <UIScrollViewDelegate> {

    UIScrollView *scrollView;
    UIView *contentView;
    CALayer *imageLayer;
    CALayer *clipLayer;
    
}

@property (strong, nonatomic) IBOutlet UIScrollView *scrollView;
@property (strong, nonatomic) IBOutlet UIView *contentView;

@end
