//
//  ViewController.m
//  CountryPicker
//
//  Created by Hannibal Yang on 11/27/14.
//  Copyright (c) 2014 Hannibal Yang. All rights reserved.
//

#import "ViewController.h"
#import "CPCountry.h"

@interface ViewController () <UIPickerViewDataSource, UIPickerViewDelegate> {

    NSMutableArray *_countries;
}
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    // 初始化模型数据
    NSArray *array = [NSArray arrayWithContentsOfFile:[[NSBundle mainBundle] pathForResource:@"flags.plist" ofType:nil]];
    _countries = [NSMutableArray array];
    for (NSDictionary *dict in array) {
        CPCountry *c = [CPCountry countryWithDict:dict];
        [_countries addObject:c];
    }
    
}

- (NSInteger)pickerView:(UIPickerView *)pickerView numberOfRowsInComponent:(NSInteger)component {

    return _countries.count;
}

- (NSInteger)numberOfComponentsInPickerView:(UIPickerView *)pickerView {

    return 1;
}

- (NSString *)pickerView:(UIPickerView *)pickerView titleForRow:(NSInteger)row forComponent:(NSInteger)component {

    CPCountry *country = _countries[row];
    return country.name;
}

@end
