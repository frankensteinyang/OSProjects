//
//  CompressibleStickerViewController.m
//  BiCi
//
//  Created by Frankenstein Yang on 1/15/15.
//  Copyright (c) 2015 Frankenstein Yang. All rights reserved.
//

#import "CompressibleStickerViewController.h"
#import "UIView+Screenshot.h"
#import "ViewController.h"

@implementation CompressibleStickerViewController

@synthesize scrollView;
@synthesize contentView;

- (id)init
{
    
    self = [super initWithNibName:NSStringFromClass([CompressibleStickerViewController class]) bundle:[NSBundle mainBundle]];
    if (self) {
        
    }
    return self;
    
}

- (void)viewDidLoad {

    [super viewDidLoad];
    
    scrollView.backgroundColor = [UIColor whiteColor];
    [scrollView addSubview:contentView];
    scrollView.contentSize = contentView.bounds.size;
    scrollView.delegate = self;
    scrollView.showsVerticalScrollIndicator = NO;
    scrollView.showsHorizontalScrollIndicator = NO;
    
    if (!imageLayer) {
        imageLayer = [[CALayer alloc] init];
        imageLayer.frame = contentView.frame;
    }
    
    if (!clipLayer) {
        clipLayer = [[CALayer alloc] init];
        [self.view.layer addSublayer:clipLayer];
    }
    clipLayer.frame = CGRectMake(0.0, 60.0, 320.0, 80.0);
    clipLayer.masksToBounds = YES;
    [clipLayer addSublayer:imageLayer];
    
    CGRect aFrame = imageLayer.frame;
    aFrame.origin.y = 0 - clipLayer.frame.origin.y;
    imageLayer.frame = aFrame;
    
    UIImage *screenshot = [contentView filteredScreenshot];
    imageLayer.contents = (id)screenshot.CGImage;
    
}

- (void)scrollViewDidScroll:(UIScrollView *)inScrollView {
    
    CGRect aFrame = imageLayer.frame;
    aFrame.origin.y = 0 - inScrollView.contentOffset.y - clipLayer.frame.origin.y;
    [CATransaction begin];
    [CATransaction setValue:(id)kCFBooleanTrue forKey:kCATransactionDisableActions];
    imageLayer.frame = aFrame;
    [CATransaction commit];
    
}

- (IBAction)back {
    
    ViewController *vc = [[ViewController alloc] init];
    [self presentViewController:vc animated:YES completion:nil];
    
}

@end
