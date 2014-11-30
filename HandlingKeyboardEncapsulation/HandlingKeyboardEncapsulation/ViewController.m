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

@interface ViewController () <UITextFieldDelegate, HKECityPickerDelegate, HKEKeyboardToolDelegate> {
    NSMutableArray *_textFields;
    UITextField *_focusedField;
    HKEKeyboardTool *_tool;
}

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self settingKeyboard];
    [self addGenderPicker];
    [self handleTextFields];
    [self addKeyboardNotification];
    
}

#pragma mark - 键盘处理（通知机制）
- (void)addKeyboardNotification {

    NSNotificationCenter *center = [NSNotificationCenter defaultCenter];
    [center addObserver:self selector:@selector(keyboardWillShow:) name:UIKeyboardWillShowNotification object:nil];
    [center addObserver:self selector:@selector(keyboardWillHide:) name:UIKeyboardWillHideNotification object:nil];
}

#pragma mark 显示一个新的键盘就会调用（如果textField中的键盘相同，就不会调用）
- (void)keyboardWillShow:(NSNotification *)notification {

    // 取得当前聚焦文本框最下面的Y值
    CGFloat fieldMaxY = CGRectGetMaxY(_focusedField.frame);
    
    // 补充：获得不从view层中的文本框
//    CGRect fieldRect = [_focusedField.superview convertRect:_focusedField.frame toView:self.view];
//    CGFloat fieldMaxY = CGRectGetMaxY(fieldRect);
    
    // 取出键盘的高度
    CGFloat keyboardH = [notification.userInfo[UIKeyboardFrameEndUserInfoKey] CGRectValue].size.height;
    
    // 控制器View的高度 - 键盘的高度
    CGFloat keyboardY = self.view.frame.size.height - keyboardH;
    
    CGFloat duration = [notification.userInfo[UIKeyboardAnimationDurationUserInfoKey] doubleValue];
    if (duration <= 0.0) {
        duration = 0.25;
    }
    [UIView animateWithDuration:duration animations:^{
        // 比较文本框最大Y值和键盘的Y值
        if (fieldMaxY > keyboardY) { // 键盘挡住了文本框
            self.view.transform = CGAffineTransformMakeTranslation(0, keyboardY - fieldMaxY - 10);
        } else { // 没有挡住文本框
            self.view.transform = CGAffineTransformIdentity;
        }
    }];
}

- (void)keyboardWillHide:(NSNotification *)notification {

    CGFloat duration = [notification.userInfo[UIKeyboardAnimationDurationUserInfoKey] doubleValue];
    [UIView animateWithDuration:duration animations:^{
        self.view.transform = CGAffineTransformIdentity;
    }];
}

// 移除键盘通知（非ARC必写）
- (void)dealloc {

    [[NSNotificationCenter defaultCenter] removeObserver:self];
}

#pragma mark - 文本框输入操作用户体验优化
- (void)textFieldDidBeginEditing:(UITextField *)textField {

    _focusedField = textField;
    // 判断当前聚焦的文本框是否为最前面或者最后面的文本框
    int index = [_textFields indexOfObject:textField];
//    if (index == 0) {
//        _tool.previousBtnItem.enabled = NO;
//    } else {
//        _tool.previousBtnItem.enabled = YES;
//    }
    // 如果不是第0个文本框,"上一个"可以被点击，'!='的优先级大于'='，'!='返回BOOL值
    _tool.previousBtnItem.enabled = index != 0;
    // 如果不是最后一个文本框，"下一个"可以被点击
    _tool.nextBtnItem.enabled = index != (_textFields.count - 1);
//    [UIApplication sharedApplication].windows;
}

- (void)keyboardTool:(HKEKeyboardTool *)keyboardTool itemClick:(HKEKeyboardToolItemType)itemType {

    if (itemType == HKEKeyboardToolItemTypeDone) {
        [self.view endEditing:YES];
    } else {
    
        int index = [_textFields indexOfObject:_focusedField];
        if (itemType == HKEKeyboardToolItemTypeNext) {
            index++;
        } else {
            index--;
        }
        [_textFields[index] becomeFirstResponder];
    }
    
}

#pragma mark - 城市选择后，在文本框显示
- (void)cityPicker:(HKECityPicker *)cityPicker citySelectedWithProvince:(NSString *)province city:(NSString *)city {

    _cityField.text = [NSString stringWithFormat:@"%@ %@", province, city];
}

#pragma mark - 生日显示
- (void)birthdayPicker:(UIDatePicker *)picker {

    NSDateFormatter *df = [[NSDateFormatter alloc] init];
    df.dateFormat = @"yyyy-MM-dd";
    NSString *birthday = [df stringFromDate:picker.date];
    _birthdayField.text = birthday;
}

#pragma mark - UITextField的代理方法
- (BOOL)textField:(UITextField *)textField shouldChangeCharactersInRange:(NSRange)range replacementString:(NSString *)string {
    
//    if (textField == _birthdayField || textField == _cityField) return NO;
//    return YES;
//    return (textField == _birthdayField || textField == _cityField) ? NO : YES;
    return !(textField == _birthdayField || textField == _cityField);
}

#pragma mark - 处理所有的文本框
- (void)handleTextFields {
    
    // 工具条
    HKEKeyboardTool *toolbar = [HKEKeyboardTool keyboardTool];
    toolbar.delegate = self;
    
    _textFields = [NSMutableArray array];
#warning 递归遍历找出所有文本框控件
    // 获得所有的文本输入框
    for (UIView *child in self.view.subviews) {
        // 如果是文本输入框，就设置工具条
        if ([child isKindOfClass:[UITextField class]]) {
            UITextField *textField = (UITextField *)child;
            textField.inputAccessoryView = toolbar;
            textField.delegate = self;
            [_textFields addObject:textField];
        }
    }
    _tool = toolbar;
    
    [_textFields sortUsingComparator:^NSComparisonResult(UITextField *obj1, UITextField *obj2) {
        /*
         NSOrderedAscending, // 升序 ——> 越往右边越大（返回值obj1和obj2，大的放右边）
         NSOrderedSame, // 顺序不变
         NSOrderedDescending // 降序，返回的左边的对象排后面
         */
        CGFloat obj1Y = obj1.frame.origin.y;
        CGFloat obj2Y = obj2.frame.origin.y;
        if (obj1Y > obj2Y) {
            return NSOrderedDescending;
        } else {
            return NSOrderedAscending;
        }
    }];
}

#pragma mark - 添加性别选择器
- (void)addGenderPicker {

    // 性别选择框
    HKEGenderCheckBox *gender = [HKEGenderCheckBox genderCheckbox];
    // gender.frame会改掉默认的宽高，center只改位置
    gender.center = CGPointMake(185, 85);
    [self.view addSubview:gender];
}

#pragma mark - 设置键盘
- (void)settingKeyboard {
    
    // 生日
    UIDatePicker *datePicker = [[UIDatePicker alloc] init];
    datePicker.locale = [NSLocale localeWithLocaleIdentifier:@"zh_CN"];
    datePicker.datePickerMode = UIDatePickerModeDate;
    [datePicker addTarget:self action:@selector(birthdayPicker:) forControlEvents:UIControlEventValueChanged];
    _birthdayField.inputView = datePicker;
    
    // 城市选择
    HKECityPicker *cityPicker = [HKECityPicker cityPicker];
    cityPicker.delegate = self;
    _cityField.inputView = cityPicker;
}

@end
