//
//  Purchase.h
//  GroupPurchaseDemo
//
//  Created by Hannibal Yang on 11/8/14.
//  Copyright (c) 2014 Hannibal Yang. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Purchase : NSObject

@property (nonatomic, copy) NSString *title;
@property (nonatomic, assign) int purchasers;
@property (nonatomic, assign) double price;
@property (nonatomic, copy) NSString *icon;
@property (nonatomic, assign) BOOL isArrival;

@end
