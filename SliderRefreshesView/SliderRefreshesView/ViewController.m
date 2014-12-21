//
//  ViewController.m
//  SliderRefreshesView
//
//  Created by Hannibal Yang on 12/21/14.
//  Copyright (c) 2014 Frankenstein Yang. All rights reserved.
//

#import "ViewController.h"
#import "SRVDisplayView.h"

@interface ViewController ()

@property (weak, nonatomic) IBOutlet SRVDisplayView *displayView;

@end

@implementation ViewController

//- (void)awakeFromNib {
//
//}

- (void)viewDidLoad {
    [super viewDidLoad];
    // 延迟加载/懒加载SRVDisplayView
    self.displayView.text = @"Frankenstein!";
    self.displayView.fontSize = 18.0f;
    
}

- (IBAction)sliderChanged:(UISlider *)sender {
    
    self.displayView.fontSize = sender.value;
    // 刷新
    [self.displayView setNeedsDisplay];
    
}

@end
