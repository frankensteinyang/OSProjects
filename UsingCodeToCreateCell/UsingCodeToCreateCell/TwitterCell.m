//
//  TwitterCell.m
//  UsingCodeToCreateCell
//
//  Created by Hannibal Yang on 11/8/14.
//  Copyright (c) 2014 Hannibal Yang. All rights reserved.
//

#import "TwitterCell.h"

@implementation TwitterCell

- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
    
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        // 1.Profile icon
        UIImageView *icon = [[UIImageView alloc] init];
        [self.contentView addSubview:icon];
        
        // 2.Nickname
        UILabel *nickname = [[UILabel alloc] init];
        [self.contentView addSubview:nickname];
        
        // 3.VipIcon
        UIImageView *vipIcon = [[UIImageView alloc] init];
        [self.contentView addSubview:vipIcon];
        
        // 4.Time
        UILabel *time = [[UILabel alloc] init];
        [self.contentView addSubview:time];
        
        // 5.Source
        UILabel *source = [[UILabel alloc] init];
        [self.contentView addSubview:source];
        
        // 6.Content
        UILabel *content = [[UILabel alloc] init];
        [self.contentView addSubview:content];
        
        // 7.Image
        UIImageView *image= [[UIImageView alloc] init];
        [self.contentView addSubview:image];
        
    }
    return self;
    
}

@end
