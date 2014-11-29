//
//  HKECityPicker.m
//  HandlingKeyboardEncapsulation
//
//  Created by Hannibal Yang on 11/29/14.
//  Copyright (c) 2014 Hannibal Yang. All rights reserved.
//

#import "HKECityPicker.h"
#import "HKEArea.h"

@interface HKECityPicker () <UIPickerViewDataSource, UIPickerViewDelegate> {

    NSMutableArray *_provinces;
}

@end

@implementation HKECityPicker

#pragma mark - 任何对象从xib中创建完毕的时候都会调用一次此方法
- (void)awakeFromNib {

    // 字典转模型
    NSArray *array = [NSArray arrayWithContentsOfFile:[[NSBundle mainBundle] pathForResource:@"cities.plist" ofType:nil]];
    _provinces = [NSMutableArray array];
    for (NSDictionary *dict in array) {
        HKEArea *area = [HKEArea areaWithDict:dict];
        [_provinces addObject:area];
    }
    
}

- (NSInteger)numberOfComponentsInPickerView:(UIPickerView *)pickerView {

    return 2;
}

- (NSInteger)pickerView:(UIPickerView *)pickerView numberOfRowsInComponent:(NSInteger)component {
    
    if (component == 0) {
        return _provinces.count;
    } else {
        int provinceIndex = [pickerView selectedRowInComponent:0];
        HKEArea *province = _provinces[provinceIndex];
        return province.citiesArray.count;
    }
    
}

- (NSString *)pickerView:(UIPickerView *)pickerView titleForRow:(NSInteger)row forComponent:(NSInteger)component {

    if (component == 0) {
        HKEArea *province = _provinces[row];
        return province.provinceName;
    } else {
        int cityIndex = [pickerView selectedRowInComponent:0];
        HKEArea *city = _provinces[cityIndex];
        return city.citiesArray[row];
    }
    
}

- (void)pickerView:(UIPickerView *)pickerView didSelectRow:(NSInteger)row inComponent:(NSInteger)component {

    if (component == 0) {
        [pickerView reloadComponent:1];
        [pickerView selectRow:0 inComponent:1 animated:YES];
    }
    int provinceIndex = [pickerView selectedRowInComponent:0];
    HKEArea *province = _provinces[provinceIndex];
    int cityIndex = [pickerView selectedRowInComponent:1];
    
    if ([_delegate respondsToSelector:@selector(cityPicker:citySelectedWithProvince:city:)]) {
        [_delegate cityPicker:self citySelectedWithProvince:province.provinceName city:province.citiesArray[cityIndex]];
    }
    
}

+ (id)cityPicker {

    return [[NSBundle mainBundle] loadNibNamed:@"HKECityPicker" owner:nil options:nil][0];
}

@end
