//
//  TwitterCell.m
//  UsingCodeToCreateCell
//
//  Created by Hannibal Yang on 11/8/14.
//  Copyright (c) 2014 Hannibal Yang. All rights reserved.
//

#import "TwitterCell.h"
#import "Twitter.h"

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
        UIImageView *icon = [[UIImageView alloc] init];
        [self.contentView addSubview:icon];
//        _icon = icon;
        
        // 2.Nickname
        UILabel *nickname = [[UILabel alloc] init];
        [self.contentView addSubview:nickname];
//        _name = nickname;
        
        // 3.VipIcon
        UIImageView *vipIcon = [[UIImageView alloc] init];
        [self.contentView addSubview:vipIcon];
//        _vip = vipIcon;
        
        // 4.Time
        UILabel *time = [[UILabel alloc] init];
        [self.contentView addSubview:time];
//        _time = time;
        
        // 5.Source
        UILabel *source = [[UILabel alloc] init];
        [self.contentView addSubview:source];
//        _source = source;
        
        // 6.Content
        UILabel *content = [[UILabel alloc] init];
        [self.contentView addSubview:content];
//        _content = content;
        
        // 7.Image
        UIImageView *image= [[UIImageView alloc] init];
        [self.contentView addSubview:image];
//        _image = image;
        
    }
    return self;
    
}

- (void)setTwitter:(Twitter *)twitter {
    _twitter = twitter;
    _icon.image = [UIImage imageNamed:twitter.icon];
    _name.text = twitter.nickname;
    _vip.hidden = !twitter.isVip;
    _time.text = twitter.time;
    _source.text = twitter.source;
    _content.text = twitter.content;
    if (twitter.image) {
        _image.hidden = NO;
        _image.image = [UIImage imageNamed:twitter.image];
    } else {
        _image.hidden = YES;
    }
    
    
}

@end
