//
//  FrankensteinParallaxView.m
//  BiCi
//
//  Created by Frankenstein Yang on 1/14/15.
//  Copyright (c) 2015 Frankenstein Yang. All rights reserved.
//

#import "FrankensteinParallaxView.h"
#import "FrankensteinParallaxCollectionViewLayout.h"

@implementation FrankensteinParallaxView

@synthesize parallaxCollectionView = _parallaxCollectionView;
@synthesize delegate = _delegate;
@synthesize datasource = _datasource;
@synthesize parallaxViewType = _parallaxViewType;
@synthesize currentIndex = _currentIndex;

- (id)initWithFrame:(CGRect)frame {
    
    return [self initWithFrame:frame withViewType:FrankensteinParallaxViewTypeHorizontal];
    
}

- (id)initWithFrame:(CGRect)frame withViewType:(FrankensteinParallaxViewType)viewType {
    
    self = [super initWithFrame:frame];
    if (self) {
        FrankensteinParallaxCollectionViewLayout *layout = [[FrankensteinParallaxCollectionViewLayout alloc]init];
        _separatorWidth = 5.0f;
        layout.separatorWidth = _separatorWidth;
        frame.size.width = frame.size.width + _separatorWidth;
        _parallaxCollectionView = [[UICollectionView alloc]initWithFrame:frame collectionViewLayout:layout];
        _parallaxCollectionView.delegate = self;
        _parallaxCollectionView.dataSource = self;
        _parallaxCollectionView.pagingEnabled = YES;
        _parallaxViewType = viewType;
        
        [self addSubview:_parallaxCollectionView];
    }
    return self;
    
}

- (void)layoutSubviews {
    
    [super layoutSubviews];
    _width = self.frame.size.width;
    _height = self.frame.size.height;
    
}

- (void)registerClass:(__unsafe_unretained Class) cellClass forCellWithReuseIdentifier:(NSString *) reuseIdentifier {
    
    [_parallaxCollectionView registerClass:cellClass forCellWithReuseIdentifier:reuseIdentifier];
    
}

- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView {
    
    return 1;
    
}

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    
    if([_datasource respondsToSelector:@selector(numberOfRowsInParallaxView:)]) {
        
        _dataCount = [_datasource numberOfRowsInParallaxView:self];
        
    }
    
    return _dataCount;
    
}

- (UICollectionViewCell*)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    
    UICollectionViewCell * cell;
    if([_datasource respondsToSelector:@selector(parallaxView:cellForRowAtIndexPath:)]) {
        
        cell = [_datasource parallaxView:self cellForRowAtIndexPath:indexPath];
        
    }
    
    return cell;
    
}

- (UICollectionViewCell*)cellForItemAtIndexPath:(NSIndexPath*)indexPath {
    
    return [_parallaxCollectionView cellForItemAtIndexPath:indexPath];
    
}

- (UICollectionViewCell*)dequeueReusableCellWithReuseIdentifier:(NSString *) reuseIdentifier forIndexPath:(NSIndexPath*)indexPath {
    
    return [_parallaxCollectionView dequeueReusableCellWithReuseIdentifier:reuseIdentifier forIndexPath:indexPath];
    
}


- (void)scrollViewDidScroll:(UIScrollView *)scrollView {
    
    _currentIndex = scrollView.contentOffset.x/(_width + _separatorWidth);
    if(_parallaxViewType == FrankensteinParallaxViewTypeHorizontal) {
        
        NSInteger leftIndex = -1;
        NSInteger rightIndex = -1;
        leftIndex = _currentIndex;
        
        if(_currentIndex < (_dataCount - 1)) {
            rightIndex = leftIndex + 1;
        }
        
        CGFloat leftImageMargingLeft = scrollView.contentOffset.x>0?((fmod(scrollView.contentOffset.x + _width + _separatorWidth,_width + _separatorWidth))):0.0f;
        CGFloat leftImageWidth = (_width + _separatorWidth) - (fmod(abs(scrollView.contentOffset.x + _separatorWidth ),_width + _separatorWidth));
        CGFloat rightImageMarginLeft = 0.0f;
        CGFloat rightImageWidth = leftImageMargingLeft - _separatorWidth;
        
        if([_delegate respondsToSelector:(@selector(parallaxViewDidScrollHorizontally:leftIndex:leftImageLeftMargin:leftImageWidth:rightIndex:rightImageLeftMargin:rightImageWidth:))]) {
            
            [_delegate parallaxViewDidScrollHorizontally:self leftIndex:leftIndex leftImageLeftMargin:leftImageMargingLeft leftImageWidth:leftImageWidth rightIndex:rightIndex rightImageLeftMargin:rightImageMarginLeft rightImageWidth:rightImageWidth];
            
        }
        
    } else {
        
        NSInteger topIndex = -1;
        NSInteger bottomIndex = -1;
        topIndex = _currentIndex;
        
        if(_currentIndex < (_dataCount - 1)) {
            bottomIndex = topIndex + 1;
        }
        
        CGFloat topImageTopMargin = scrollView.contentOffset.y>0?((fmod(scrollView.contentOffset.y + _height,_height))):0.0f;
        CGFloat topImageHeight = _height - (fmod(abs(scrollView.contentOffset.y) ,_height));
        CGFloat bottomImageTopMargin = 0.0f;
        CGFloat bottomImageHeight = topImageTopMargin;
        
        if([_delegate respondsToSelector:@selector(parallaxViewDidScrollVertically:topIndex:topImageTopMargin:topImageHeight:bottomIndex:bottomImageTopMargin:bottomImageHeight:)]) {
            
            [_delegate parallaxViewDidScrollVertically:self topIndex:topIndex topImageTopMargin:topImageTopMargin topImageHeight:topImageHeight bottomIndex:bottomIndex bottomImageTopMargin:bottomImageTopMargin bottomImageHeight:bottomImageHeight];
        }
    }
}

- (void)setCurrentIndex:(NSInteger)index {
    
    [self setCurrentIndex:index animated:NO];
    
}

- (void)setCurrentIndex:(NSInteger)index animated:(BOOL)animated {
    
    _currentIndex = index;
    [_parallaxCollectionView setContentOffset:CGPointMake(index * _width, 0.0f) animated:animated];
    
}

- (void)dealloc {
    
    _parallaxCollectionView = nil;
    
}

@end
