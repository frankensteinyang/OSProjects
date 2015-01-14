//
//  FrankensteinCollectionViewCell.h
//  BiCi
//
//  Created by Frankenstein Yang on 1/14/15.
//  Copyright (c) 2015 Frankenstein Yang. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface FrankensteinCollectionViewCell : UICollectionViewCell

@property (nonatomic, strong) UITableView *frankensteinTableView;
@property (nonatomic) id<UITableViewDataSource> datasource;
@property (nonatomic) id<UITableViewDelegate> delegate;
+ (NSString *)reuseIdentifier;

@end
