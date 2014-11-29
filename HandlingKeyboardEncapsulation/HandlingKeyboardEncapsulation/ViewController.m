//
//  ViewController.m
//  HandlingKeyboardEncapsulation
//
//  Created by Hannibal Yang on 11/28/14.
//  Copyright (c) 2014 Hannibal Yang. All rights reserved.
//

#import "ViewController.h"
#import "HKEGenderCheckBox.h"
#import "HKECityPicker.h"
#import "HKEKeyboardTool.h"

@interface ViewController () <UITextFieldDelegate, HKECityPickerDelegate, HKEKeyboardToolDelegate>

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    // 生日
    UIDatePicker *datePicker = [[UIDatePicker alloc] init];
    datePicker.locale = [NSLocale localeWithLocaleIdentifier:@"zh_CN"];
    datePicker.datePickerMode = UIDatePickerModeDate;
    [datePicker addTarget:self action:@selector(birthdayPicker:) forControlEvents:UIControlEventValueChanged];
    _birthdayField.inputView = datePicker;
    _birthdayField.delegate = self;
    
    // 性别选择框
    HKEGenderCheckBox *gender = [HKEGenderCheckBox genderCheckbox];
    // gender.frame会改掉默认的宽高，center只改位置
    gender.center = CGPointMake(161, 90);
    [self.view addSubview:gender];
    
    // 城市选择
    HKECityPicker *cityPicker = [HKECityPicker cityPicker];
    cityPicker.delegate = self;
    _cityField.inputView = cityPicker;
    _cityField.delegate = self;
    
    // 工具条
    HKEKeyboardTool *toolbar = [HKEKeyboardTool keyboardTool];
    // 获得所有的文本输入框
    toolbar.delegate = self;
    for (UIView *child in self.view.subviews) {
        // 如果是文本输入框，就设置工具条
        if ([child isKindOfClass:[UITextField class]]) {
            UITextField *textField = (UITextField *)child;
            textField.inputAccessoryView = toolbar;
        }
    }
    
}

- (void)keyboardTool:(HKEKeyboardTool *)keyboardTool itemClick:(HKEKeyboardToolItemType)itemType {

    if (itemType == HKEKeyboardToolItemTypePrevious) {
        
    } else if (itemType == HKEKeyboardToolItemTypeNext) {
        
    } else {
        [self.view endEditing:YES];
    }
    
}

- (void)cityPicker:(HKECityPicker *)cityPicker citySelectedWithProvince:(NSString *)province city:(NSString *)city {

    _cityField.text = [NSString stringWithFormat:@"%@ %@", province, city];
}

- (void)birthdayPicker:(UIDatePicker *)picker {

    NSDateFormatter *df = [[NSDateFormatter alloc] init];
    df.dateFormat = @"yyyy-MM-dd";
    NSString *birthday = [df stringFromDate:picker.date];
    _birthdayField.text = birthday;
}

- (BOOL)textField:(UITextField *)textField shouldChangeCharactersInRange:(NSRange)range replacementString:(NSString *)string {

    return NO;
}

@end
