//
//  GHDMetadataTool.m
//  GrouponHD
//
//  Created by Frankenstein Yang on 1/18/15.
//  Copyright (c) 2015 Frankenstein Yang. All rights reserved.
//

#import "GHDMetadataTool.h"
#import "GHDGrouponCategory.h"
#import "GHDCity.h"
#import "GHDCityGroup.h"
#import "GHDSort.h"

@interface GHDMetadataTool () {

    /** 所有的分类 */
    NSArray *_categories;
    /** 所有的城市 */
    NSArray *_cities;
    /** 所有的城市组 */
    NSArray *_cityGroups;
    /** 所有的排序 */
    NSArray *_sorts;
    
}

@end

@implementation GHDMetadataTool

GHDSingletonM(MetadataTool)

- (NSArray *)categories
{
    if (!_categories) {
        _categories = [GHDGrouponCategory objectArrayWithFilename:@"categories.plist"];
    }
    return _categories;
}

- (NSArray *)cityGroups
{
    if (!_cityGroups) {
        _cityGroups = [GHDCityGroup objectArrayWithFilename:@"cityGroups.plist"];
    }
    return _cityGroups;
}

- (NSArray *)cities
{
    if (!_cities) {
        _cities = [GHDCity objectArrayWithFilename:@"cities.plist"];
    }
    return _cities;
}

- (NSArray *)sorts
{
    if (!_sorts) {
        _sorts = [GHDSort objectArrayWithFilename:@"sorts.plist"];
    }
    return _sorts;
}

@end
