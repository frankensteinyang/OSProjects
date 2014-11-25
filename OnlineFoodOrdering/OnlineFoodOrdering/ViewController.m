//
//  ViewController.m
//  OnlineFoodOrdering
//
//  Created by Hannibal Yang on 11/25/14.
//  Copyright (c) 2014 Hannibal Yang. All rights reserved.
//

#import "ViewController.h"

@interface ViewController () <UIPickerViewDataSource, UIPickerViewDelegate> {

    NSArray *_foods;
}

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    _foods = [NSArray arrayWithContentsOfFile:[[NSBundle mainBundle] pathForResource:@"foods.plist" ofType:nil]];
    
//    _fruit.text = _foods[0][0];
//    _dish.text = _foods[1][0];
//    _drinks.text = _foods[2][0];
    
//    [self pickerView:nil didSelectRow:0 inComponent:0];
//    [self pickerView:nil didSelectRow:0 inComponent:1];
//    [self pickerView:nil didSelectRow:0 inComponent:2];
    int count = _foods.count;
    for (int i = 0; i < count; i++) {
        [self pickerView:nil didSelectRow:0 inComponent:i];
    }
    
}

#pragma mark - 数据源
#pragma mark 列数
- (NSInteger)numberOfComponentsInPickerView:(UIPickerView *)pickerView {

    return _foods.count;
}

#pragma mark 列中的行数
- (NSInteger)pickerView:(UIPickerView *)pickerView numberOfRowsInComponent:(NSInteger)component {

    NSArray *array = _foods[component];
    return array.count;
}

#pragma mark 行中内容
- (NSString *)pickerView:(UIPickerView *)pickerView titleForRow:(NSInteger)row forComponent:(NSInteger)component {

    return _foods[component][row];
}

#pragma mark - 代理
// 只有手动选中了某一行才会通知代理
- (void)pickerView:(UIPickerView *)pickerView didSelectRow:(NSInteger)row inComponent:(NSInteger)component {
    
    NSString *text = _foods[component][row];
    switch (component) {
        case 0:
            _fruit.text = text;
            break;
            
        case 1:
            _dish.text = text;
            break;
            
        case 2:
            _drinks.text= text;
            break;
            
        default:
            NSLog(@"Unknown switch statement!");
            break;
    }
}

- (IBAction)randomFood:(id)sender {
    
    // 为性能考虑，如果数组数据量大，最好把count提前拿出来
    int count = _foods.count;
    for (int i = 0; i < count; i++) {
        [self selectRandomComponent:i];
    }
}

#pragma mark 随机选中某一列的方法
- (void)selectRandomComponent:(int)component {

    int selectedRow = [_pickerViewOFO selectedRowInComponent:component];
    int index = selectedRow;
    while (index == selectedRow) {
        // 以_foods[component]数组的长度为基础产生随机数
        index = arc4random_uniform([_foods[component] count]);
    }
    
    [_pickerViewOFO selectRow:index inComponent:component animated:YES];
    [self pickerView:nil didSelectRow:index inComponent:component];
}



























@end
