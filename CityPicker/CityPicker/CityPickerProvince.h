//
//  CityPickerProvince.h
//  CityPicker
//
//  Created by Hannibal Yang on 11/26/14.
//  Copyright (c) 2014 Hannibal Yang. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Common.h"

@interface CityPickerProvince : NSObject

@property (nonatomic, copy) NSString *name;
@property (nonatomic, strong) NSArray *cities;

kInitH(province)

@end
