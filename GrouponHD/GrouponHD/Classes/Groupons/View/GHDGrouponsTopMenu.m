//
//  GHDGrouponsTopMenu.m
//  GrouponHD
//
//  Created by Frankenstein Yang on 1/19/15.
//  Copyright (c) 2015 Frankenstein Yang. All rights reserved.
//

#import "GHDGrouponsTopMenu.h"

@implementation GHDGrouponsTopMenu

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

+ (instancetype)menu {

    return [[[NSBundle mainBundle] loadNibNamed:@"GHDGrouponsTopMenu" owner:nil options:nil] lastObject];
    
}

- (id)initWithCoder:(NSCoder *)aDecoder {

    if (self = [super initWithCoder:aDecoder]) {
        // 禁止默认的拉伸现象
        self.autoresizingMask = UIViewAutoresizingNone;
    }
    return self;
    
}

- (void)addTarget:(id)target action:(SEL)action {

    [self.imageBtn addTarget:target action:action forControlEvents:UIControlEventTouchUpInside];
    
}

@end
