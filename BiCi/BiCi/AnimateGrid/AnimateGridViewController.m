//
//  AnimateGridViewController.m
//  BiCi
//
//  Created by Frankenstein Yang on 1/15/15.
//  Copyright (c) 2015 Frankenstein Yang. All rights reserved.
//

#import "AnimateGridViewController.h"
#import "UIView+Screenshot.h"

@implementation AnimateGridViewController

- (void)removeOutletsAndControls_AnimateGridController
{
    
    self.control = nil;
    
}

- (void)dealloc
{
    [self removeOutletsAndControls_AnimateGridController];
    [transitionLayer release];
    [images release];
    [titles release];
    [super dealloc];
}

- (void)viewDidUnload
{
    [super viewDidUnload];
    [self removeOutletsAndControls_AnimateGridController];
}

- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    [self.control setNeedsLayout];
}

- (id)init {
    
    self = [super init];
    if (self) {
        self.title = @"自行车上带着思想";
        self.navigationItem.leftBarButtonItem = [[[UIBarButtonItem alloc] initWithTitle:@"返回" style:UIBarButtonItemStylePlain target:self action:@selector(back)] autorelease];
        images = [[NSArray alloc] initWithObjects:
                  @"bicycle0.jpg",
                  @"bicycle1.jpg", @"bicycle2.jpg", @"bicycle3.jpg", @"bicycle4.jpg", @"bicycle0.jpg",
                  @"bicycle1.jpg", @"bicycle2.jpg", @"bicycle3.jpg", @"bicycle4.jpg", @"bicycle0.jpg",
                  @"bicycle1.jpg", @"bicycle2.jpg", @"bicycle3.jpg", @"bicycle4.jpg", @"bicycle0.jpg",
                  @"bicycle1.jpg", @"bicycle2.jpg", @"bicycle3.jpg", @"bicycle4.jpg", nil];
        
        titles = [[NSArray alloc] initWithObjects:
                  @"启孜",
                  @"Specialized", @"TIME", @"Solomo", @"Colnago", @"BMC",
                  @"Trek", @"Schwinn", @"Marin", @"Huffy", @"Mongoose",
                  @"Cannondale", @"NICOLAI", @"Airnimal", @"启孜工程车", @"启孜智能",
                  @"启孜收藏版", @"启孜4s", @"启孜7s", @"启孜城市车", nil];
        
        imageViewController = [[AnimateGridImageViewController alloc] init];
        imageViewController.delegate = self;
        imageNavController = [[UINavigationController alloc] initWithRootViewController:imageViewController];
        imageNavController.navigationBar.barStyle = UIBarStyleBlackTranslucent;
    }
    return self;
    
}

- (void)back {

    [self.navigationController dismissViewControllerAnimated:YES completion:nil];
    
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    return YES;
}

- (void)loadView
{
    UIView *aView = [[UIView alloc] initWithFrame:[UIScreen mainScreen].bounds];
    aView.autoresizingMask = UIViewAutoresizingFlexibleWidth | UIViewAutoresizingFlexibleHeight;
    self.view = [aView autorelease];
    
    AnimateGridControl *aControl = [[AnimateGridControl alloc] initWithFrame:aView.bounds];
    aControl.autoresizingMask = UIViewAutoresizingFlexibleWidth | UIViewAutoresizingFlexibleHeight;
    self.control = [aControl autorelease];
    [self.view addSubview:self.control];
    self.control.dataSource = self;
}

- (void)imageViewControllerDidClose:(AnimateGridImageViewController *)inController
{
    [CATransaction begin];
    [CATransaction setValue:(id)kCFBooleanTrue forKey:kCATransactionDisableActions];
    [self.transitionLayer removeAllAnimations];
    self.transitionLayer.contents = (id)[inController.navigationController.view screenshot].CGImage;
    self.transitionLayer.hidden = NO;
    self.transitionLayer.frame = self.navigationController.view.bounds;
    [CATransaction commit];
    [control performSelector:@selector(resetSelection) withObject:nil afterDelay:0.0];
    self.transitionLayer = nil;
    [self dismissViewControllerAnimated:NO completion:nil];
    
}

- (NSUInteger)numberOfItemsInGridControl:(AnimateGridControl *)inControl
{
    return [images count];
}
- (UIImage *)imageForItemInGridControl:(AnimateGridControl *)inControl atIndex:(NSUInteger)inIndex
{
    UIImage *image = [UIImage imageNamed:[images objectAtIndex:inIndex]];
    return image;
}

- (void)gridContol:(AnimateGridControl *)inControl didSelectItemAtIndex:(NSUInteger)inIndex withLayer:(CALayer *)inLayer;
{
    UIImage *image = [UIImage imageNamed:[images objectAtIndex:inIndex]];
    imageViewController.image = image;
    imageViewController.title = [titles objectAtIndex:inIndex];
    UIImage *screenshot = [imageNavController.view screenshot];
    
    self.transitionLayer = (AnimateGridLayer *)inLayer;
    
    CGRect fromRect = [self.navigationController.view.layer convertRect:inLayer.frame fromLayer:inLayer.superlayer];
    [CATransaction begin];
    [CATransaction setValue:(id)kCFBooleanTrue forKey:kCATransactionDisableActions];
    [self.navigationController.view.layer addSublayer:self.transitionLayer];
    self.transitionLayer.frame = fromRect;
    [CATransaction commit];
    
    CABasicAnimation *boundsAnimation = [CABasicAnimation animationWithKeyPath:@"bounds"];
    boundsAnimation.fromValue = [NSValue valueWithCGRect:self.transitionLayer.frame];
    boundsAnimation.toValue = [NSValue valueWithCGRect:self.navigationController.view.bounds];
    
    CABasicAnimation *positionAnimation = [CABasicAnimation animationWithKeyPath:@"position"];
    positionAnimation.fromValue = [NSValue valueWithCGPoint:self.transitionLayer.position];
    positionAnimation.toValue = [NSValue valueWithCGPoint:CGPointMake(CGRectGetMidX(self.navigationController.view.bounds), CGRectGetMidY(self.navigationController.view.bounds))];
    
    CATransition *t = [CATransition animation];
    t.type = @"flip";
    t.subtype = kCATransitionFromRight;
    t.duration = 0.25;
    self.transitionLayer.contents = (id)screenshot.CGImage;
    
    CAAnimationGroup *group = [CAAnimationGroup animation];
    group.duration = 0.5;
    group.animations = [NSArray arrayWithObjects:boundsAnimation, positionAnimation, nil];
    group.fillMode = kCAFillModeForwards;
    group.removedOnCompletion = NO;
    group.delegate = self;
    [self.transitionLayer addAnimation:group forKey:@"zoomIn"];
    [self.transitionLayer addAnimation:t forKey:@"flip"];
}

- (void)animationDidStop:(CAAnimation *)anim finished:(BOOL)flag
{
    if (anim == [self.transitionLayer animationForKey:@"zoomIn"]) {
        self.transitionLayer.hidden = YES;
        
        [self presentViewController:imageNavController animated:NO completion:nil];
    }
}

@synthesize control;
@synthesize transitionLayer;

@end
