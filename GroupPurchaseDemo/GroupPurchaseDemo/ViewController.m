//
//  ViewController.m
//  GroupPurchaseDemo
//
//  Created by Hannibal Yang on 11/8/14.
//  Copyright (c) 2014 Hannibal Yang. All rights reserved.
//

#import "ViewController.h"
#import "Purchase.h"
#import "PurchaseCell.h"

@interface ViewController () {
    NSArray *_purchase;
}
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    Purchase *purchaseA = [[Purchase alloc] init];
    purchaseA.isArrival = NO;
    purchaseA.title = @"深圳团购";
    purchaseA.price = 50.5;
    purchaseA.purchasers = 5054;
    purchaseA.icon = @"news_01.jpg";
    
    Purchase *purchaseB = [[Purchase alloc] init];
    purchaseB.isArrival = YES;
    purchaseB.title = @"SH团购";
    purchaseB.price = 35.5;
    purchaseB.purchasers = 3005;
    purchaseB.icon = @"news_02.jpg";
    
    _purchase = @[purchaseA, purchaseB];
    self.tableView.rowHeight = [PurchaseCell cellHeight];
    
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return _purchase.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {

    PurchaseCell *cell = [tableView dequeueReusableCellWithIdentifier:[PurchaseCell ID]];
    
    if (cell == nil) {
        cell = [PurchaseCell purchaseCell];
    }
    
    cell.purchase = _purchase[indexPath.row];
    
    return cell;
    
}

@end
