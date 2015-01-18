//
//  GHDSortViewController.m
//  GrouponHD
//
//  Created by Frankenstein Yang on 1/19/15.
//  Copyright (c) 2015 Frankenstein Yang. All rights reserved.
//

#import "GHDSortViewController.h"
#import "GHDSort.h"

#pragma mark - 自定义Button
@interface GHDSortButton : UIButton

@property (nonatomic, strong) GHDSort *sort;

@end

@implementation GHDSortButton

- (id)initWithFrame:(CGRect)frame {
    
    if (self = [super initWithFrame:frame]) {
        self.bgImage = @"btn_filter_normal";
        self.selectedBgImage = @"btn_filter_selected";
        self.titleColor = [UIColor blackColor];
        self.selectedTitleColor = [UIColor whiteColor];
    }
    return self;
    
}

- (void)setHighlighted:(BOOL)highlighted {

    
}

- (void)setSort:(GHDSort *)sort {

    _sort = sort;
    self.title = sort.label;
    
}

@end

#pragma mark - 控制器代码
@interface GHDSortViewController ()

@property (nonatomic, weak) GHDSortButton *selectedButton;

@end

@implementation GHDSortViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    
    // 设置Popover的尺寸
    self.preferredContentSize = self.view.size;
    // 根据排序模型的个数，创建对应的按钮
    CGFloat buttonX = 20;
    CGFloat buttonW = self.view.width - 2 * buttonX;
    CGFloat buttonSpacing = 15;
    NSArray *sorts = [GHDMetadataTool sharedMetadataTool].sorts;
    int count = sorts.count;
    CGFloat contentH = 0;
    for (int i = 0; i < count; i++) {
        // 创建按钮
        GHDSortButton *button = [[GHDSortButton alloc] init];
        // 取出模型
        button.sort = sorts[i];
        // 设置尺寸
        button.x = buttonX;
        button.width = buttonW;
        button.height = 30;
        button.y = buttonSpacing + i * (button.height + buttonSpacing);
        // 监听按钮点击
        [button addTarget:self action:@selector(sortButtonClick:) forControlEvents:UIControlEventTouchDown];
        [self.view addSubview:button];
        
        // 内容高度
        contentH = button.maxY + buttonSpacing;
    }
    
    // 设置contentSize
    UIScrollView *scrollView = (UIScrollView *)self.view;
    scrollView.contentSize = CGSizeMake(0, contentH);
    
}

- (void)sortButtonClick:(GHDSortButton *)button
{
    
    // 修改状态
    self.selectedButton.selected = NO;
    button.selected = YES;
    self.selectedButton = button;
    
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
