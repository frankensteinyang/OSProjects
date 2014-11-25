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
    
    NSArray *array = [NSArray arrayWithContentsOfFile:[[NSBundle mainBundle] pathForResource:@"cities.plist" ofType:nil]];
    _provinces = [NSMutableArray array];
    for (NSDictionary *dict in array) {
        CityPickerProvince *picker = [CityPickerProvince provinceWithDict:dict];
        [_provinces addObject:picker];
    }
    
    // 代码创建
//    UIPickerView *pickerView = [[UIPickerView alloc] init];
//    pickerView.dataSource = self;
//    pickerView.delegate = self;
//    [self.view addSubview:pickerView];
    
    
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
        int selectedRow = [_cityPickerView selectedRowInComponent:0];
        CityPickerProvince *provinces = _provinces[selectedRow];
        return provinces.cities.count;
    }

}

#pragma mark - 代理方法
#pragma mark 行中内容
- (NSString *)pickerView:(UIPickerView *)pickerView titleForRow:(NSInteger)row forComponent:(NSInteger)component {
    
    if (component == 0) { // 显示省份
        CityPickerProvince *provinces = _provinces[row];
        return provinces.name;
    } else { // 显示城市
        int selectedRow = [_cityPickerView selectedRowInComponent:0];
        CityPickerProvince *provinces = _provinces[selectedRow];
        return provinces.cities[row];
    }
    
}


@end
