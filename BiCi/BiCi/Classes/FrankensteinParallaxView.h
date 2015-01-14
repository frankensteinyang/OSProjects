//
//  FrankensteinParallaxView.h
//  BiCi
//
//  Created by Frankenstein Yang on 1/14/15.
//  Copyright (c) 2015 Frankenstein Yang. All rights reserved.
//

#import <UIKit/UIKit.h>

@class FrankensteinParallaxView;

@protocol FrankensteinParallaxViewDatasource <NSObject>

@required

- (NSInteger) numberOfRowsInParallaxView: (FrankensteinParallaxView *)parallaxView;
- (UICollectionViewCell *) parallaxView:(FrankensteinParallaxView *)parallaxView cellForRowAtIndexPath:(NSIndexPath *)indexPath;

@end

@protocol FrankensteinParallaxViewDelegate <NSObject>

@optional

- (void) parallaxViewDidScrollHorizontally:(FrankensteinParallaxView *)parallaxView leftIndex:(NSInteger) leftIndex leftImageLeftMargin:(CGFloat) leftImageLeftMargin leftImageWidth:(CGFloat)leftImageWidth rightIndex:(NSInteger)rightIndex rightImageLeftMargin:(CGFloat)rightImageLeftMargin rightImageWidth:(CGFloat) rightImageWidth;

- (void) parallaxViewDidScrollVertically:(FrankensteinParallaxView *)parallaxView topIndex:(NSInteger) topIndex topImageTopMargin:(CGFloat) topImageTopMargin topImageHeight:(CGFloat)topImageHeight bottomIndex:(NSInteger)bottomIndex bottomImageTopMargin:(CGFloat)bottomImageTopMargin bottomImageHeight:(CGFloat) bottomImageHeight;

@end

typedef enum {
    
    FrankensteinParallaxViewTypeHorizontal = 0,
    FrankensteinParallaxViewTypeVertical = 1
    
} FrankensteinParallaxViewType;

@interface FrankensteinParallaxView : UIView <UICollectionViewDelegate, UICollectionViewDataSource> {

    CGFloat _width;
    CGFloat _height;
    CGFloat _pageDivisor;
    NSInteger _dataCount;
    CGFloat _separatorWidth;
    
}

@property (nonatomic, strong) UICollectionView * parallaxCollectionView;

@property (nonatomic) FrankensteinParallaxViewType parallaxViewType;
@property (nonatomic,assign) id<FrankensteinParallaxViewDatasource> datasource;
@property (nonatomic,assign) id<FrankensteinParallaxViewDelegate> delegate;
@property (nonatomic) NSInteger currentIndex;

- (id)initWithFrame:(CGRect)frame withViewType:(FrankensteinParallaxViewType) viewType;

- (void)registerClass:(__unsafe_unretained Class) cellClass forCellWithReuseIdentifier:(NSString *) reuseIdentifier;
- (UICollectionViewCell*) cellForItemAtIndexPath:(NSIndexPath *)indexPath;
- (UICollectionViewCell*) dequeueReusableCellWithReuseIdentifier:(NSString *) reuseIdentifier forIndexPath:(NSIndexPath *)indexPath;

- (void)setCurrentIndex:(NSInteger)index animated:(BOOL) animated;

@end
