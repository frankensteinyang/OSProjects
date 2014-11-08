//
//  TwitterFrame.m
//  UsingCodeToCreateCell
//
//  Created by Hannibal Yang on 11/9/14.
//  Copyright (c) 2014 Hannibal Yang. All rights reserved.
//

#import "TwitterFrame.h"
#import "Twitter.h"

// cell边宽
#define kCellBorder 10

// icon的宽高
#define kIconWH 30

// vip的宽高
#define kVipWH 14

// 图片尺寸
#define kImageWH 70

@implementation TwitterFrame
- (void)setTwitter:(Twitter *)twitter {
    _twitter = twitter;
    
    CGFloat iconX = kCellBorder;
    CGFloat iconY = kCellBorder;
    _iconF = CGRectMake(iconX, iconY, kIconWH, kIconWH);
    
    CGFloat nameX = CGRectGetMaxX(_iconF) + kCellBorder;
    CGFloat nameY = iconY;
    
    // sizewithattributes 替换 sizeWithfont
    CGSize nameSize = [_twitter.nickname sizeWithFont:kNameFont];
    _nameF = CGRectMake(nameX, nameY, nameSize.width, nameSize.height);
    
    CGFloat vipX = CGRectGetMaxX(_nameF) + kCellBorder;
    CGFloat vipY = nameY;
    _vipF = CGRectMake(vipX, vipY, kVipWH, kVipWH);
    
    CGFloat timeX = nameX;
    CGFloat timeY = CGRectGetMaxY(_nameF) + kCellBorder;
    CGSize timeSize = [_twitter.time sizeWithFont:kTimeFont];
    _timeF = CGRectMake(timeX, timeY, timeSize.width, timeSize.height);
    
    CGFloat sourceX = CGRectGetMaxX(_timeF) + kCellBorder;
    CGFloat sourceY = timeY;
    NSString *sourceText = [NSString stringWithFormat:@"来自%@", _twitter.source];
    CGSize sourceSize = [sourceText sizeWithFont:kSourceFont];
    _sourceF = CGRectMake(sourceX, sourceY, sourceSize.width, sourceSize.height);
    
    CGFloat contentX = iconX;
    CGFloat contentY = MAX(CGRectGetMaxY(_iconF), CGRectGetMaxY(_timeF)) + kCellBorder;
    CGFloat contentW = 320 - 2 * kCellBorder;
    // sizeWithFont constrainedToSize iOS 7.0
    CGSize contentSize = [_twitter.content sizeWithFont:kContentFont constrainedToSize:CGSizeMake(contentW, MAXFLOAT)];
    _contentF = CGRectMake(contentX, contentY, contentW, contentSize.height);
    
    if (_twitter.image) {
        CGFloat imageX = contentX;
        CGFloat imageY = CGRectGetMaxY(_contentF) + kCellBorder;
        _imageF = CGRectMake(imageX, imageY, kImageWH, kImageWH);
        
        _cellHeight = CGRectGetMaxY(_imageF) + kCellBorder;
    } else {
        _cellHeight = CGRectGetMaxY(_contentF) + kCellBorder;
    }
}
@end
