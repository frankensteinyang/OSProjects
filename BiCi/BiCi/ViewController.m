//
//  ViewController.m
//  BiCi
//
//  Created by Frankenstein Yang on 1/14/15.
//  Copyright (c) 2015 Frankenstein Yang. All rights reserved.
//

#define kIMAGE_VIEW_TAG 100
#define kIMAGE_SCROLL_VIEW_TAG 101
#define kCONTENT_IMAGE_VIEW_TAG 102
#define kImageHeaderHeight self.view.frame.size.height * 0.70f
#define kImageFooterHeight self.view.frame.size.height *0.30f
#define kHeaderHeight 187.0f

#import "ViewController.h"
#import "UIImage+Scale.h"
#import "FrankensteinParallaxView.h"
#include "FrankensteinCollectionViewCell.h"

@interface ViewController () <FrankensteinParallaxViewDatasource, FrankensteinParallaxViewDelegate, UITableViewDelegate, UITableViewDataSource> {

    CGFloat _imageHeaderHeight;
    
}

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    _imageHeaderHeight = kImageHeaderHeight;
    self.navigationController.navigationBarHidden = YES;
    FrankensteinParallaxView *parallaxView = [[FrankensteinParallaxView alloc]initWithFrame:CGRectMake(0.0f,0.0f, self.view.frame.size.width, self.view.frame.size.height)];
    [parallaxView registerClass:[FrankensteinCollectionViewCell class] forCellWithReuseIdentifier:[FrankensteinCollectionViewCell reuseIdentifier]];
    parallaxView.delegate = self;
    parallaxView.datasource = self;
    [self.view addSubview:parallaxView];
    
}

#pragma mark - FrankensteinParallaxView的代理方法
- (UICollectionViewCell *)parallaxView:(FrankensteinParallaxView *)parallaxView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    FrankensteinCollectionViewCell *frankensteinCell = (FrankensteinCollectionViewCell *)[parallaxView dequeueReusableCellWithReuseIdentifier:[FrankensteinCollectionViewCell reuseIdentifier] forIndexPath:indexPath];
    frankensteinCell.delegate = self;
    frankensteinCell.datasource = self;
    frankensteinCell.frankensteinTableView.tag = indexPath.row;
    frankensteinCell.frankensteinTableView.contentOffset = CGPointMake(0.0f, 0.0f);
    [frankensteinCell.frankensteinTableView reloadData];
    
    return frankensteinCell;
}


- (NSInteger)numberOfRowsInParallaxView:(FrankensteinParallaxView *)parallaxView {
    
    return 10;
    
}

- (void)parallaxViewDidScrollHorizontally:(FrankensteinParallaxView *)parallaxView leftIndex:(NSInteger)leftIndex leftImageLeftMargin:(CGFloat)leftImageLeftMargin leftImageWidth:(CGFloat)leftImageWidth rightIndex:(NSInteger)rightIndex rightImageLeftMargin:(CGFloat)rightImageLeftMargin rightImageWidth:(CGFloat)rightImageWidth {
    
    if(leftIndex >= 0) {
        FrankensteinCollectionViewCell *leftCell = (FrankensteinCollectionViewCell *)[parallaxView cellForItemAtIndexPath:[NSIndexPath indexPathForItem:leftIndex inSection:0]];
        UITableViewCell * tvCell = [leftCell.frankensteinTableView cellForRowAtIndexPath:[NSIndexPath indexPathForItem:0 inSection:0]];
        
        UIImageView *iv = (UIImageView*)[tvCell viewWithTag:100];
        CGRect frame = iv.frame;
        frame.origin.x = leftImageLeftMargin;
        frame.size.width = leftImageWidth;
        iv.frame = frame;
    }
    
    if(rightIndex >= 0) {
        FrankensteinCollectionViewCell *rigthCell = (FrankensteinCollectionViewCell *)[parallaxView cellForItemAtIndexPath:[NSIndexPath indexPathForItem:rightIndex inSection:0]];
        UITableViewCell * tvCell = [rigthCell.frankensteinTableView cellForRowAtIndexPath:[NSIndexPath indexPathForItem:0 inSection:0]];
        
        UIImageView *iv = (UIImageView *)[tvCell viewWithTag:100];
        CGRect frame = iv.frame;
        frame.origin.x = rightImageLeftMargin;
        frame.size.width = rightImageWidth;
        iv.frame = frame;
        
    }
}

#pragma mark - ScrollView的代理方法
- (void)scrollViewDidScroll:(UIScrollView *)scrollView {

    if(scrollView.tag == kIMAGE_SCROLL_VIEW_TAG) return;
    UITableView * tv = (UITableView*) scrollView;
    UITableViewCell * cell = [tv cellForRowAtIndexPath:[NSIndexPath indexPathForItem:0 inSection:0]];
    UIScrollView * svImage = (UIScrollView*)[cell viewWithTag:kIMAGE_SCROLL_VIEW_TAG];
    CGRect frame = svImage.frame;
    frame.size.height =  MAX((_imageHeaderHeight-tv.contentOffset.y),0);
    frame.origin.y = tv.contentOffset.y;
    svImage.frame = frame;
    svImage.zoomScale = 1 + (abs(MIN(tv.contentOffset.y,0))/320.0f);
    
}

- (UIView *)viewForZoomingInScrollView:(UIScrollView *)scrollView {
    
    return [scrollView viewWithTag:kIMAGE_VIEW_TAG];
    
}

#pragma mark - UITableView的代理方法
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
    tableView.backgroundColor = [UIColor blackColor];
    
    UITableViewCell *cell;
    if (indexPath.row == 0) {
        static NSString *headerID = @"headerCell";
        cell = [tableView dequeueReusableCellWithIdentifier:headerID];
        if (!cell) {
            cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleValue1 reuseIdentifier:headerID];
            cell.backgroundColor = [UIColor clearColor];
            UIImageView * imageView = [[UIImageView alloc]initWithFrame:CGRectMake(0.0f, 0.0f, cell.contentView.frame.size.width,_imageHeaderHeight)];
            imageView.contentMode = UIViewContentModeCenter;
            imageView.tag = kIMAGE_VIEW_TAG;
            imageView.clipsToBounds = YES;
            imageView.autoresizingMask = UIViewAutoresizingFlexibleHeight;
            UIScrollView * svImage = [[UIScrollView alloc]initWithFrame:imageView.frame];
            svImage.delegate = self;
            svImage.userInteractionEnabled = NO;
            [svImage addSubview:imageView];
            
            svImage.tag = kIMAGE_SCROLL_VIEW_TAG;
            svImage.backgroundColor = [UIColor blackColor];
            svImage.zoomScale = 1.0f;
            svImage.minimumZoomScale = 1.0f;
            svImage.maximumZoomScale = 2.0f;
            [cell.contentView addSubview:svImage];
            
            UIImage *img = [UIImage imageNamed:@"header_logo"];
            UIImageView * headerInfo = [[UIImageView alloc]initWithImage:img];
            
            [cell.contentView addSubview:headerInfo];
            
            CGRect headerFrame = headerInfo.frame;
            headerFrame.size.height = kHeaderHeight;
            headerFrame.origin.y = _imageHeaderHeight - kHeaderHeight;
            headerInfo.frame = headerFrame;
        }
        
        UIImageView *imageView = (UIImageView*)[cell viewWithTag:kIMAGE_VIEW_TAG];
        UIImage *img = [UIImage imageNamed:[NSString stringWithFormat:@"bicycle%i.jpg",tableView.tag]];
        CGSize size = CGSizeMake(self.view.frame.size.width, kImageHeaderHeight);
//        UIImage *scaledImage = [img imageByScalingProportionallyToSize:size sourceImage:img];
        UIImage *scaledImage = [img imageByScalingAndCroppingForSize:size image:img];
        imageView.image = scaledImage;
        
    } else {
        static NSString *CellIdentifier = @"cellIdentifier";
        cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
        if(!cell) {
            cell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellIdentifier];
            UIImageView * imageView = [[UIImageView alloc]initWithFrame:CGRectMake(0.0f, 0.0f, self.view.frame.size.width, kImageFooterHeight)];
            imageView.tag = kCONTENT_IMAGE_VIEW_TAG;
            [cell.contentView addSubview:imageView];
        }
        UIImageView *imageView = (UIImageView*)[cell viewWithTag:kCONTENT_IMAGE_VIEW_TAG];
        imageView.image = [UIImage imageNamed:[NSString stringWithFormat:@"content-%i",(tableView.tag%3) + 1]];
        
    }
    
    return cell;
    
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    
    NSArray *classes = [NSArray arrayWithObjects:
                        @"AnimateGridViewController",
                        @"CompressibleStickerViewController",
                        nil];
    UIViewController *controller = [[NSClassFromString([classes objectAtIndex:indexPath.row]) alloc] init];
    [self.navigationController pushViewController:controller animated:YES];
    
}

- (void)tableView:(UITableView *)tableView willDisplayCell:(UITableViewCell *)cell forRowAtIndexPath:(NSIndexPath *)indexPath {

    if (indexPath.row != 0) {
        cell.backgroundColor = [UIColor blackColor];
        cell.textLabel.textColor = [UIColor whiteColor];
        cell.selectionStyle = UITableViewCellSelectionStyleNone;
//        cell.selectedBackgroundView = [[UIView alloc] initWithFrame:cell.frame];
//        cell.selectedBackgroundView.backgroundColor = [UIColor blueColor];
    }
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {

    return 1;
    
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {

    return 2;
    
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {

    if (indexPath.row == 0) {
        return _imageHeaderHeight;
    }
    return kImageFooterHeight;
}

@end
