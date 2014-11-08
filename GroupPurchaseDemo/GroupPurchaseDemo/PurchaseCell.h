//
//  PurchaseCell.h
//  GroupPurchaseDemo
//
//  Created by Hannibal Yang on 11/8/14.
//  Copyright (c) 2014 Hannibal Yang. All rights reserved.
//

#import <UIKit/UIKit.h>
@class Purchase;
@interface PurchaseCell : UITableViewCell

@property (weak, nonatomic) IBOutlet UIImageView *iconView;
@property (weak, nonatomic) IBOutlet UIImageView *arrivalView;
@property (weak, nonatomic) IBOutlet UILabel *title;
@property (weak, nonatomic) IBOutlet UILabel *purchasers;
@property (weak, nonatomic) IBOutlet UILabel *price;

@property (nonatomic, strong) Purchase *purchase;

+ (id)purchaseCell;
+ (NSString *)ID;
+ (CGFloat)cellHeight;

@end
