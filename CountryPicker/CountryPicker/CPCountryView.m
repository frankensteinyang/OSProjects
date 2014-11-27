//
//  CPCountryView.m
//  CountryPicker
//
//  Created by Hannibal Yang on 11/27/14.
//  Copyright (c) 2014 Hannibal Yang. All rights reserved.
//

#import "CPCountryView.h"
#import "CPCountry.h"

@implementation CPCountryView
- (void)setCountry:(CPCountry *)country {

    _country = country;
    _nameLabel.text = country.name;
    _flagView.image = [UIImage imageNamed:country.icon];
}

+ (id)countryView {

    return [[NSBundle mainBundle] loadNibNamed:@"CPCountryView" owner:nil options:nil][0];
}

@end
