//
//  PurchaseCell.m
//  GroupPurchaseDemo
//
//  Created by Hannibal Yang on 11/8/14.
//  Copyright (c) 2014 Hannibal Yang. All rights reserved.
//

#import "PurchaseCell.h"
#import "Purchase.h"

@implementation PurchaseCell

+ (id)purchaseCell {
    return [[NSBundle mainBundle] loadNibNamed:@"PurchaseCell" owner:nil options:nil][0];
}

+ (NSString *)ID {
    return @"PurchaseID";
}

+ (CGFloat)cellHeight {
    return 80;
}

- (void)setPurchase:(Purchase *)purchase {
    
    _purchase = purchase;
    
    _title.text = purchase.title;
    _purchasers.text = [NSString stringWithFormat:@"购买：%d", purchase.purchasers];
    _price.text = [NSString stringWithFormat:@"价格：%.2f", purchase.price];
    _iconView.image = [UIImage imageNamed:purchase.icon];
    _arrivalView.hidden = !purchase.isArrival;
    
}

@end
