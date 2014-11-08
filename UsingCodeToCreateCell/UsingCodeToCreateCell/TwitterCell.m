//
//  TwitterCell.m
//  UsingCodeToCreateCell
//
//  Created by Hannibal Yang on 11/8/14.
//  Copyright (c) 2014 Hannibal Yang. All rights reserved.
//

#import "TwitterCell.h"
#import "Twitter.h"

// cell边宽
#define kCellBorder 10

// icon的宽高
#define kIconWH 30

// vip的宽高
#define kVipWH 14

// 图片尺寸
#define kImageWH 70

@interface TwitterCell() {
    UIImageView *_icon;
    UILabel *_name;
    UIImageView *_vip;
    UILabel *_time;
    UILabel *_source;
    UILabel *_content;
    UIImageView *_image;
}
@end

@implementation TwitterCell

- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
    
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        // 1.Profile icon
        _icon = [[UIImageView alloc] init];
        [self.contentView addSubview:_icon];
//        _icon = icon;
        
        // 2.Nickname
        _name = [[UILabel alloc] init];
        [self.contentView addSubview:_name];
//        _name = nickname;
        
        // 3.VipIcon
        _vip = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"vip.png"]];
        [self.contentView addSubview:_vip];
//        _vip = vipIcon;
        
        // 4.Time
        _time = [[UILabel alloc] init];
        _time.font = [UIFont systemFontOfSize:12];
        _time.textColor = [UIColor grayColor];
        [self.contentView addSubview:_time];
//        _time = time;
        
        // 5.Source
        _source = [[UILabel alloc] init];
        [self.contentView addSubview:_source];
//        _source = source;
        
        // 6.Content
        _content = [[UILabel alloc] init];
        _content.numberOfLines = 0;
        [self.contentView addSubview:_content];
//        _content = content;
        
        // 7.Image
        _image = [[UIImageView alloc] init];
        [self.contentView addSubview:_image];
//        _image = image;
        
    }
    return self;
    
}

- (void)setTwitter:(Twitter *)twitter {
    _twitter = twitter;
    [self settingData];
    
    [self settingSubviewFrame];
}

#pragma mark 设置子控件的frame
- (void)settingSubviewFrame {
    
    CGFloat iconX = kCellBorder;
    CGFloat iconY = kCellBorder;
    _icon.frame = CGRectMake(iconX, iconY, kIconWH, kIconWH);
    
    CGFloat nameX = CGRectGetMaxX(_icon.frame) + kCellBorder;
    CGFloat nameY = iconY;
    
    // sizewithattributes 替换 sizeWithfont
    CGSize nameSize = [_twitter.nickname sizeWithFont:_name.font];
    _name.frame = CGRectMake(nameX, nameY, nameSize.width, nameSize.height);
    
    CGFloat vipX = CGRectGetMaxX(_name.frame) + kCellBorder;
    CGFloat vipY = nameY;
    _vip.frame = CGRectMake(vipX, vipY, kVipWH, kVipWH);
    
    CGFloat timeX = nameX;
    CGFloat timeY = CGRectGetMaxY(_name.frame) + kCellBorder;
    CGSize timeSize = [_twitter.time sizeWithFont:_time.font];
    _time.frame = CGRectMake(timeX, timeY, timeSize.width, timeSize.height);
    
    CGFloat sourceX = CGRectGetMaxX(_time.frame) + kCellBorder;
    CGFloat sourceY = timeY;
    NSString *sourceText = [NSString stringWithFormat:@"来自%@", _twitter.source];
    CGSize sourceSize = [sourceText sizeWithFont:_source.font];
    _source.frame = CGRectMake(sourceX, sourceY, sourceSize.width, sourceSize.height);
    
    CGFloat contentX = iconX;
    CGFloat contentY = MAX(CGRectGetMaxY(_icon.frame), CGRectGetMaxY(_time.frame)) + kCellBorder;
    CGFloat contentW = self.frame.size.width - 2 * kCellBorder;
    // sizeWithFont constrainedToSize iOS 7.0
    CGSize contentSize = [_twitter.content sizeWithFont:_content.font constrainedToSize:CGSizeMake(contentW, MAXFLOAT)];
    _content.frame = CGRectMake(contentX, contentY, contentW, contentSize.height);
    
    if (_twitter.image) {
        CGFloat imageX = contentX;
        CGFloat imageY = CGRectGetMaxY(_content.frame) + kCellBorder;
        _image.frame = CGRectMake(imageX, imageY, kImageWH, kImageWH);
    }
}

- (void)settingData {
    _icon.image = [UIImage imageNamed:_twitter.icon];
    
    _name.text = _twitter.nickname;
    if (_twitter.isVip) {
        _name.textColor = [UIColor redColor];
    } else {
        _name.textColor = [UIColor blackColor];
    }
    
    _vip.hidden = !_twitter.isVip;
    
    _time.text = _twitter.time;
    
    _source.text = [NSString stringWithFormat:@"来自%@", _twitter.source];
    
    _content.text = _twitter.content;
    
    if (_twitter.image) {
        _image.hidden = NO;
        _image.image = [UIImage imageNamed:_twitter.image];
    } else {
        _image.hidden = YES;
    }
}
@end
