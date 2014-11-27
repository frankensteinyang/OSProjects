//
//  ViewController.m
//  CityPicker
//
//  Created by Hannibal Yang on 11/26/14.
//  Copyright (c) 2014 Hannibal Yang. All rights reserved.
//

#import "ViewController.h"
#import "CityPickerProvince.h"

@interface ViewController () <UIPickerViewDataSource, UIPickerViewDelegate> {

    NSMutableArray *_provinces;
}
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    // 初始化模型数据
    NSArray *array = [NSArray arrayWithContentsOfFile:[[NSBundle mainBundle] pathForResource:@"cities.plist" ofType:nil]];
    _provinces = [NSMutableArray array];
    for (NSDictionary *dict in array) {
        CityPickerProvince *province = [CityPickerProvince provinceWithDict:dict];
        [_provinces addObject:province];
    }
    
    // 代码创建pickerView
    UIPickerView *pickerView = [[UIPickerView alloc] init];
    pickerView.dataSource = self;
    pickerView.delegate = self;
    // 显示pickerView的选择指示器
    pickerView.showsSelectionIndicator = YES;
    [self.view addSubview:pickerView];
    
    // 默认选中第0个省份的第0个城市
    [self pickerView:nil didSelectRow:0 inComponent:0];
}

#pragma mark - 数据源方法
#pragma mark 列数
- (NSInteger)numberOfComponentsInPickerView:(UIPickerView *)pickerView {
    
    return 2;
}

#pragma mark 列中行数
- (NSInteger)pickerView:(UIPickerView *)pickerView numberOfRowsInComponent:(NSInteger)component {

    if (component == 0) { // 多少个省
        return _provinces.count;
    } else { // 城市个数
        int selectedRow = [pickerView selectedRowInComponent:0];
        CityPickerProvince *provinces = _provinces[selectedRow];
        return provinces.cities.count;
    }

}

#pragma mark - 代理方法
#pragma mark 行中内容
- (NSString *)pickerView:(UIPickerView *)pickerView titleForRow:(NSInteger)row forComponent:(NSInteger)component {
    
    if (component == 0) { // 显示省份
        // 取出省份模型
        CityPickerProvince *provinces = _provinces[row];
        // 取出省份名称
        return provinces.name;
    } else { // 显示城市
        // 获得选中的省份
        int selectedRow = [pickerView selectedRowInComponent:0];
        // 取出省份模型
        CityPickerProvince *provinces = _provinces[selectedRow];
        // 返回对应行的城市名称
        return provinces.cities[row];
    }
    
}

#pragma mark 监听选中
- (void)pickerView:(UIPickerView *)pickerView didSelectRow:(NSInteger)row inComponent:(NSInteger)component {
    
    if (component == 0) { // 省份已变
        // 刷新第1列的数据（重新刷新数据，重新调用数据源和代理的相应方法获得数据）
        [pickerView reloadComponent:1];
        [pickerView selectRow:0 inComponent:1 animated:YES];
    }
    // 获得选中的省份
    int pIndex = [pickerView selectedRowInComponent:0];
    CityPickerProvince *province = _provinces[pIndex];
    // 获得选中的城市的位置
    int cIndex = [pickerView selectedRowInComponent:1];
    _pickerLabel.text = [NSString stringWithFormat:@"%@ %@", province.name, province.cities[cIndex]];
}

@end
