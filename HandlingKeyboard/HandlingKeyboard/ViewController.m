//
//  ViewController.m
//  HandlingKeyboard
//
//  Created by Hannibal Yang on 11/27/14.
//  Copyright (c) 2014 Hannibal Yang. All rights reserved.
//

#import "ViewController.h"
#import "HKProvince.h"

@interface ViewController () <UITextFieldDelegate, UIPickerViewDelegate, UIPickerViewDataSource> {

    NSMutableArray *_provinces;
}

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    // 生日选择
    UIDatePicker *datePicker = [[UIDatePicker alloc] init];
    datePicker.datePickerMode = UIDatePickerModeDate;
    datePicker.locale = [[NSLocale alloc] initWithLocaleIdentifier:@"zh_CN"];
    [datePicker addTarget:self action:@selector(birthdayPicker:) forControlEvents:UIControlEventValueChanged];
    _birthdayField.inputView = datePicker;
    _birthdayField.delegate = self;
    
    // 城市选择
    UIPickerView *pickerView = [[UIPickerView alloc] init];
    pickerView.delegate = self;
    pickerView.dataSource = self;
    _cityField.inputView = pickerView;
    _cityField.delegate = self;
    
    NSArray *array = [NSArray arrayWithContentsOfFile:[[NSBundle mainBundle] pathForResource:@"cities.plist" ofType:nil]];
    _provinces = [NSMutableArray array];
    for (NSDictionary *dict in array) {
        HKProvince *province = [HKProvince provinceWithDict:dict];
        [_provinces addObject:province];
    }
    
    [self pickerView:nil didSelectRow:0 inComponent:0];
    
}
#pragma mark - 生日选择
- (void)birthdayPicker:(UIDatePicker *)picker {

    NSDateFormatter *df = [[NSDateFormatter alloc] init];
    df.dateFormat = @"yyyy-MM-dd";
    NSString *birthday = [df stringFromDate:picker.date];
    _birthdayField.text = birthday;
}

#pragma mark - PickerView的代理方法
- (NSString *)pickerView:(UIPickerView *)pickerView titleForRow:(NSInteger)row forComponent:(NSInteger)component {

    if (component == 0) {
        HKProvince *province = _provinces[row];
        return province.provinceName;
    } else {
        int cityIndex = [pickerView selectedRowInComponent:0];
        HKProvince *province = _provinces[cityIndex];
        return province.citiesArray[row];
    }
}

- (void)pickerView:(UIPickerView *)pickerView didSelectRow:(NSInteger)row inComponent:(NSInteger)component {

    if (component == 0) {
        [pickerView reloadComponent:1];
        [pickerView selectRow:0 inComponent:1 animated:YES];
    }
    int provinceIndex = [pickerView selectedRowInComponent:0];
    HKProvince *province = _provinces[provinceIndex];
    int cityIndex = [pickerView selectedRowInComponent:1];
    _cityField.text = [NSString stringWithFormat:@"%@ %@", province.provinceName, province.citiesArray[cityIndex]];
    
}

#pragma mark - PickerView的数据源方法
- (NSInteger)numberOfComponentsInPickerView:(UIPickerView *)pickerView {
    
    return 2;
}

- (NSInteger)pickerView:(UIPickerView *)pickerView numberOfRowsInComponent:(NSInteger)component {
    
    return _provinces.count;
}

- (IBAction)selectGender:(UIButton *)sender {
    
    if (_maleBtn.enabled) {
        _maleBtn.enabled = NO;
        _femaleBtn.enabled = YES;
    } else {
        _femaleBtn.enabled = NO;
        _maleBtn.enabled = YES;
    }
}

#pragma mark - TextField的代理方法，当文本框中字符将要发生改变时调用
- (BOOL)textField:(UITextField *)textField shouldChangeCharactersInRange:(NSRange)range replacementString:(NSString *)string {
    
    return NO;
}

@end
