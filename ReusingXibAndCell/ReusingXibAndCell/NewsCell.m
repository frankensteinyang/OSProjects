//
//  NewsCell.m
//  XibCustomisesCell
//
//  Created by Hannibal Yang on 11/10/14.
//  Copyright (c) 2014 Hannibal Yang. All rights reserved.
//

#import "NewsCell.h"

@implementation NewsCell

+ (id)newsCell {
    return [[NSBundle mainBundle] loadNibNamed:@"NewsCell" owner:nil options:nil][0];
}

+ (NSString *)ID {
    return @"CellID";
}

- (void)setNews:(News *)news {
    _news = news;
    
    _titleLabel.text = news.title;
    _commentsLabel.text = [NSString stringWithFormat:@"评论：%d", news.comments];
    _authorLabel.text = news.author;
    _iconView.image = [UIImage imageNamed:news.image];
}

@end
