//
//  FrankensteinCollectionViewCell.m
//  BiCi
//
//  Created by Frankenstein Yang on 1/14/15.
//  Copyright (c) 2015 Frankenstein Yang. All rights reserved.
//

#import "FrankensteinCollectionViewCell.h"

#define IMAGE_SCROLL_VIEW_TAG 100
#define IMAGE_VIEW_TAG 90
#define CONTENT_IMAGE_VIEW_TAG 80

@implementation FrankensteinCollectionViewCell

@synthesize frankensteinTableView = _frankensteinTableView;
@synthesize datasource = _datasource;
@synthesize delegate = _delegate;

- (id)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    if (self) {
        _frankensteinTableView = [[UITableView alloc]initWithFrame:frame style:UITableViewStylePlain];
        [self.contentView addSubview:_frankensteinTableView];
    }
    return self;
}

- (void)setDatasource:(id<UITableViewDataSource>)datasource {
    if(_frankensteinTableView.dataSource == nil){
        _frankensteinTableView.dataSource = datasource;
    }
}

- (void)setDelegate:(id<UITableViewDelegate>)delegate  {
    if(_frankensteinTableView.delegate == nil){
        _frankensteinTableView.delegate = delegate;
    }
}

- (void)layoutSubviews {
    [super layoutSubviews];
    _frankensteinTableView.frame = CGRectMake(0.0f, 0.0f, self.contentView.frame.size.width, self.contentView.frame.size.height);
    
}

+ (NSString *)reuseIdentifier {
    
    return NSStringFromClass([FrankensteinCollectionViewCell class]);
    
}

@end
