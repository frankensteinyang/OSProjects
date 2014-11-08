//
//  TwitterCell.m
//  UsingCodeToCreateCell
//
//  Created by Hannibal Yang on 11/8/14.
//  Copyright (c) 2014 Hannibal Yang. All rights reserved.
//

#import "TwitterCell.h"
#import "Twitter.h"
#import "TwitterFrame.h"

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
        
        // 2.Nickname
        _name = [[UILabel alloc] init];
        _name.font = kNameFont;
        [self.contentView addSubview:_name];
        
        // 3.VipIcon
        _vip = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"vip.png"]];
        [self.contentView addSubview:_vip];
        
        // 4.Time
        _time = [[UILabel alloc] init];
        _time.font = kTimeFont;
        _time.textColor = [UIColor grayColor];
        [self.contentView addSubview:_time];
        
        // 5.Source
        _source = [[UILabel alloc] init];
        _source.font = kSourceFont;
        [self.contentView addSubview:_source];
        
        // 6.Content
        _content = [[UILabel alloc] init];
        _content.font = kContentFont;
        _content.numberOfLines = 0;
        [self.contentView addSubview:_content];
        
        // 7.Image
        _image = [[UIImageView alloc] init];
        [self.contentView addSubview:_image];
        
    }
    return self;
    
}

- (void)setTwitterFrame:(TwitterFrame *)twitterFrame {
    _twitterFrame = twitterFrame;
    [self settingData];
    
    [self settingSubviewFrame];
}

#pragma mark 设置子控件的frame
- (void)settingSubviewFrame {
    _icon.frame = _twitterFrame.iconF;
    _name.frame = _twitterFrame.nameF;
    _content.frame = _twitterFrame.contentF;
    _vip.frame = _twitterFrame.vipF;
    _time.frame = _twitterFrame.timeF;
    _source.frame = _twitterFrame.sourceF;
    if (_twitterFrame.twitter.image) {
        _image.frame = _twitterFrame.imageF;
    }
    
}

- (void)settingData {
    
    Twitter *twitter = _twitterFrame.twitter;
    _icon.image = [UIImage imageNamed:twitter.icon];
    
    _name.text = twitter.nickname;
    if (twitter.isVip) {
        _name.textColor = [UIColor redColor];
    } else {
        _name.textColor = [UIColor blackColor];
    }
    
    _vip.hidden = !twitter.isVip;
    
    _time.text = twitter.time;
    
    _source.text = [NSString stringWithFormat:@"来自%@", twitter.source];
    
    _content.text = twitter.content;
    
    if (twitter.image) {
        _image.hidden = NO;
        _image.image = [UIImage imageNamed:twitter.image];
    } else {
        _image.hidden = YES;
    }
}
@end
