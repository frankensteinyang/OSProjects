//
//  HKECityPicker.h
//  HandlingKeyboardEncapsulation
//
//  Created by Hannibal Yang on 11/29/14.
//  Copyright (c) 2014 Hannibal Yang. All rights reserved.
//

#import <UIKit/UIKit.h>
@class HKECityPicker;

@protocol HKECityPickerDelegate <NSObject>

@optional
- (void)cityPicker:(HKECityPicker *)cityPicker citySelectedWithProvince:(NSString *)province city:(NSString *)city;

@end

@interface HKECityPicker : UIView

@property (nonatomic, weak) id<HKECityPickerDelegate> delegate;
+ (id)cityPicker;

@end
