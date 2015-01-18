//
//  GHDGrouponsViewController.m
//  GrouponHD
//
//  Created by Frankenstein Yang on 1/17/15.
//  Copyright (c) 2015 Frankenstein Yang. All rights reserved.
//

#import "GHDGrouponsViewController.h"
#import "GHDGrouponTool.h"
#import "AwesomeMenu.h"
#import "AwesomeMenuItem.h"
#import "GHDGrouponsTopMenu.h"
#import "UIBarButtonItem+Extension.h"

@interface GHDGrouponsViewController () <AwesomeMenuDelegate>

/** 分类菜单 */
@property (weak, nonatomic) GHDGrouponsTopMenu *categoryMenu;
/** 区域菜单 */
@property (weak, nonatomic) GHDGrouponsTopMenu *regionMenu;
/** 排序菜单 */
@property (weak, nonatomic) GHDGrouponsTopMenu *sortMenu;

@end

@implementation GHDGrouponsViewController

static NSString * const reuseIdentifier = @"Cell";

- (void)viewDidLoad {
    [super viewDidLoad];
    
    // 用户菜单
    [self setupUserMenu];
    
    // 设置导航栏左边的内容
    [self setupNavLeft];
    
    // 设置导航栏右边的内容
    [self setupNavRight];
    
    //    GHDFindDealsParam *param = [[GHDFindDealsParam alloc] init];
    //    param.city = @"北京";
    //    [GHDGrouponTool findDeals:param success:^(GHDFindDealsResult *result) {
    //        NSLog(@"搜索成功");
    //    } failure:^(NSError *error) {
    //        NSLog(@"搜索失败");
    //    }];
    
    GHDGetSingleGrouponParam *param = [[GHDGetSingleGrouponParam alloc] init];
    param.deal_id = @"2-6390770";
    [GHDGrouponTool getSingleDeal:param success:^(GHDGetSingleGrouponResult *result) {
        NSLog(@"搜索成功 %@", result.deals);
    } failure:^(NSError *error) {
        NSLog(@"搜索失败 %@", error);
    }];
    
    
}

#pragma mark - 设置导航栏左边的内容
- (void)setupNavLeft {
    
    // 1.logo
    UIBarButtonItem *logoItem = [UIBarButtonItem itemWithImageName:@"icon_meituan_logo" highImageName:@"icon_meituan_logo" target:nil action:nil];
    logoItem.customView.userInteractionEnabled = NO;
    
    // 2.分类
    GHDGrouponsTopMenu *categoryMenu = [GHDGrouponsTopMenu menu];
    UIBarButtonItem *categoryItem = [[UIBarButtonItem alloc] initWithCustomView:categoryMenu];
    self.categoryMenu = categoryMenu;
    
    // 3.区域
    GHDGrouponsTopMenu *regionMenu = [GHDGrouponsTopMenu menu];
    UIBarButtonItem *regionItem = [[UIBarButtonItem alloc] initWithCustomView:regionMenu];
    self.regionMenu = regionMenu;
    
    // 4.排序
    GHDGrouponsTopMenu *sortMenu = [GHDGrouponsTopMenu menu];
    UIBarButtonItem *sortItem = [[UIBarButtonItem alloc] initWithCustomView:sortMenu];
    self.sortMenu = sortMenu;
    
    self.navigationItem.leftBarButtonItems = @[logoItem, categoryItem, regionItem, sortItem];
    
}

#pragma mark - 设置导航栏右边的内容
- (void)setupNavRight {

    UIBarButtonItem *mapItem = [UIBarButtonItem itemWithImageName:@"icon_map" highImageName:@"icon_map_highlighted" target:self action:@selector(mapClick)];
    mapItem.customView.width = 50;
    mapItem.customView.height = 27;
    
    UIBarButtonItem *searchItem = [UIBarButtonItem itemWithImageName:@"icon_search" highImageName:@"icon_search_highlighted" target:self action:@selector(searchClick)];
    searchItem.customView.width = mapItem.customView.width;
    searchItem.customView.height = mapItem.customView.height;
    
    self.navigationItem.rightBarButtonItems = @[mapItem, searchItem];
    
}

- (void)mapClick {

}

- (void)searchClick {
    
}

/**
 *  用户菜单
 */
- (void)setupUserMenu {

    // 1.周边的item
    AwesomeMenuItem *mineItem = [self itemWithContent:@"icon_pathMenu_mine_normal" highlightedContent:@"icon_pathMenu_mine_highlighted"];
    AwesomeMenuItem *collectItem = [self itemWithContent:@"icon_pathMenu_collect_normal" highlightedContent:@"icon_pathMenu_collect_highlighted"];
    AwesomeMenuItem *scanItem = [self itemWithContent:@"icon_pathMenu_scan_normal" highlightedContent:@"icon_pathMenu_scan_highlighted"];
    AwesomeMenuItem *moreItem = [self itemWithContent:@"icon_pathMenu_more_normal" highlightedContent:@"icon_pathMenu_more_highlighted"];
    NSArray *items = @[mineItem, collectItem, scanItem, moreItem];
    
    // 2.中间的开始item
    AwesomeMenuItem *startItem = [[AwesomeMenuItem alloc] initWithImage:[UIImage imageNamed:@"icon_pathMenu_background_normal"]
                                                       highlightedImage:[UIImage imageNamed:@"icon_pathMenu_background_highlighted"]
                                                           ContentImage:[UIImage imageNamed:@"icon_pathMenu_mainMine_normal"]
                                                highlightedContentImage:[UIImage imageNamed:@"icon_pathMenu_mainMine_highlighted"]];
    
    AwesomeMenu *menu = [[AwesomeMenu alloc] initWithFrame:CGRectZero startItem:startItem optionMenus:items];
    [self.view addSubview:menu];
    // 整个菜单的活动范围
    menu.menuWholeAngle = M_PI_2;
    // 约束
    CGFloat menuH = 200;
    [menu autoSetDimensionsToSize:CGSizeMake(200, menuH)];
    [menu autoPinEdgeToSuperviewEdge:ALEdgeLeft withInset:0];
    [menu autoPinEdgeToSuperviewEdge:ALEdgeBottom withInset:0];
    
    // 3.添加一个背景
    UIImageView *menuBg = [[UIImageView alloc] init];
    menuBg.image = [UIImage imageNamed:@"icon_pathMenu_background"];
    [menu insertSubview:menuBg atIndex:0];
    // 约束
    [menuBg autoSetDimensionsToSize:menuBg.image.size];
    [menuBg autoPinEdgeToSuperviewEdge:ALEdgeLeft withInset:0];
    [menuBg autoPinEdgeToSuperviewEdge:ALEdgeBottom withInset:0];
    
    // 起点
    menu.startPoint = CGPointMake(menuBg.image.size.width * 0.5, menuH - menuBg.image.size.height * 0.5);
    // 禁止中间按钮旋转
    menu.rotateAddButton = NO;
    
    // 设置代理
    menu.delegate = self;
    
}

/**
 *  创建菜单item
 */
- (AwesomeMenuItem *)itemWithContent:(NSString *)content highlightedContent:(NSString *)highlightedContent
{
    UIImage *itemBg = [UIImage imageNamed:@"bg_pathMenu_black_normal"];
    return [[AwesomeMenuItem alloc] initWithImage:itemBg
                                 highlightedImage:nil
                                     ContentImage:[UIImage imageNamed:content]
                          highlightedContentImage:[UIImage imageNamed:highlightedContent]];
}

#pragma mark - AwesomeMenuDelegate
- (void)awesomeMenuWillAnimateOpen:(AwesomeMenu *)menu {

    menu.contentImage = [UIImage imageNamed:@"icon_pathMenu_cross_normal"];
    menu.highlightedContentImage = [UIImage imageNamed:@"icon_pathMenu_cross_highlighted"];
    
}

- (void)awesomeMenuWillAnimateClose:(AwesomeMenu *)menu {

    menu.contentImage = [UIImage imageNamed:@"icon_pathMenu_mainMine_normal"];
    menu.highlightedContentImage = [UIImage imageNamed:@"icon_pathMenu_mainMine_highlighted"];
    
}

- (void)awesomeMenu:(AwesomeMenu *)menu didSelectIndex:(NSInteger)idx {

    [self awesomeMenuWillAnimateClose:menu];
    
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

#pragma mark <UICollectionViewDataSource>

- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView {
#warning Incomplete method implementation -- Return the number of sections
    return 0;
}


- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
#warning Incomplete method implementation -- Return the number of items in the section
    return 0;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    UICollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:reuseIdentifier forIndexPath:indexPath];
    
    // Configure the cell
    
    return cell;
}

#pragma mark <UICollectionViewDelegate>

/*
// Uncomment this method to specify if the specified item should be highlighted during tracking
- (BOOL)collectionView:(UICollectionView *)collectionView shouldHighlightItemAtIndexPath:(NSIndexPath *)indexPath {
	return YES;
}
*/

/*
// Uncomment this method to specify if the specified item should be selected
- (BOOL)collectionView:(UICollectionView *)collectionView shouldSelectItemAtIndexPath:(NSIndexPath *)indexPath {
    return YES;
}
*/

/*
// Uncomment these methods to specify if an action menu should be displayed for the specified item, and react to actions performed on the item
- (BOOL)collectionView:(UICollectionView *)collectionView shouldShowMenuForItemAtIndexPath:(NSIndexPath *)indexPath {
	return NO;
}

- (BOOL)collectionView:(UICollectionView *)collectionView canPerformAction:(SEL)action forItemAtIndexPath:(NSIndexPath *)indexPath withSender:(id)sender {
	return NO;
}

- (void)collectionView:(UICollectionView *)collectionView performAction:(SEL)action forItemAtIndexPath:(NSIndexPath *)indexPath withSender:(id)sender {
	
}
*/

@end
