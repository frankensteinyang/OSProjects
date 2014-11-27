//
//  ViewController.m
//  CountryPicker
//
//  Created by Hannibal Yang on 11/27/14.
//  Copyright (c) 2014 Hannibal Yang. All rights reserved.
//

#import "ViewController.h"
#import "CPCountry.h"
#import "CPCountryView.h"

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

#pragma mark - 数据源方法
- (NSInteger)pickerView:(UIPickerView *)pickerView numberOfRowsInComponent:(NSInteger)component {

    return _countries.count;
}

- (NSInteger)numberOfComponentsInPickerView:(UIPickerView *)pickerView {

    return 1;
}

#pragma mark - 代理方法
- (UIView *)pickerView:(UIPickerView *)pickerView viewForRow:(NSInteger)row forComponent:(NSInteger)component reusingView:(UIView *)view {

    CPCountryView *countryView = (CPCountryView *)view;
    if (view == nil) { // 缓存池没有countryView
        // 用[CPCountryView alloc]不返回加载的xib文件
        countryView = [CPCountryView countryView];
    }
    countryView.country = _countries[row];
    return countryView;
}

- (CGFloat)pickerView:(UIPickerView *)pickerView rowHeightForComponent:(NSInteger)component {

    return 44;
}

@end
