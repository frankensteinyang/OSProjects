//
//  ViewController.h
//  OnlineFoodOrdering
//
//  Created by Hannibal Yang on 11/25/14.
//  Copyright (c) 2014 Hannibal Yang. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController

@property (weak, nonatomic) IBOutlet UILabel *fruit;

@property (weak, nonatomic) IBOutlet UILabel *dish;

@property (weak, nonatomic) IBOutlet UILabel *drinks;

- (IBAction)randomFood:(id)sender;

@property (weak, nonatomic) IBOutlet UIPickerView *pickerViewOFO;

@end

