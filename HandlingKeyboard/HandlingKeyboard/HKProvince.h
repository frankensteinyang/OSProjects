//
//  HKProvince.h
//  HandlingKeyboard
//
//  Created by Hannibal Yang on 11/28/14.
//  Copyright (c) 2014 Hannibal Yang. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Common.h"

@interface HKProvince : UIView

@property (nonatomic, copy) NSString *provinceName;
@property (nonatomic, strong) NSArray *citiesArray;

kInitH(province)

@end
