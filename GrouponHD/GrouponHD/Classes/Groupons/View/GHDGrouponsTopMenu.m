//
//  GHDGrouponsTopMenu.m
//  GrouponHD
//
//  Created by Frankenstein Yang on 1/19/15.
//  Copyright (c) 2015 Frankenstein Yang. All rights reserved.
//

#import "GHDGrouponsTopMenu.h"

@interface GHDGrouponsTopMenu ()

@property (weak, nonatomic) IBOutlet UIButton *imageBtn;
@property (weak, nonatomic) IBOutlet UILabel *titleLabel;
@property (weak, nonatomic) IBOutlet UILabel *subtitleLabel;

- (IBAction)imageBtnClick;

@end

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
        self.autoresizingMask = UIViewAutoresizingNone;
    }
    return self;
    
}

- (IBAction)imageBtnClick {
}
@end
