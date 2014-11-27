//
//  CPCountryView.h
//  CountryPicker
//
//  Created by Hannibal Yang on 11/27/14.
//  Copyright (c) 2014 Hannibal Yang. All rights reserved.
//

#import <UIKit/UIKit.h>
@class CPCountry;

@interface CPCountryView : UIView
@property (nonatomic, strong) CPCountry *country;
@property (weak, nonatomic) IBOutlet UILabel *nameLabel;
@property (weak, nonatomic) IBOutlet UIImageView *flagView;

+ (id)countryView;

@end
