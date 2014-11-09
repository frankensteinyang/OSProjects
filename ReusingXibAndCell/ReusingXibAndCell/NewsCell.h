//
//  NewsCell.h
//  XibCustomisesCell
//
//  Created by Hannibal Yang on 11/10/14.
//  Copyright (c) 2014 Hannibal Yang. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "News.h"

@interface NewsCell : UITableViewCell

@property (nonatomic, weak) IBOutlet UILabel *titleLabel;
@property (nonatomic, weak) IBOutlet UILabel *commentsLabel;
@property (nonatomic, weak) IBOutlet UILabel *authorLabel;
@property (nonatomic, weak) IBOutlet UIImageView *iconView;

@property (nonatomic, strong) News *news; // 模型数据

+ (id)newsCell;
+ (NSString *)ID;
@end
