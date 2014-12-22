//
//  EPColorView.m
//  EPainter
//
//  Created by Hannibal Yang on 12/22/14.
//  Copyright (c) 2014 Frankenstein Yang. All rights reserved.
//

#import "EPColorView.h"
#define kBtnSpacing 10.0

@implementation EPColorView

- (id)initWithFrame:(CGRect)frame {

    self = [super initWithFrame:frame];
    if (self) {
        self.backgroundColor = [UIColor lightGrayColor];
        [self createBtn];
    }
    
    return self;
}

#pragma mark - 生成按钮图像
- (UIImage *)createImageWithColor:(UIColor *)color size:(CGSize)size {

    // 针对图像启动上下文
    UIGraphicsBeginImageContext(size);
    [color set];
    UIRectFill(CGRectMake(0, 0, size.width, size.height));
    // 获取图像上下文中绘制生成的图像
    UIImage *image = UIGraphicsGetImageFromCurrentImageContext();
    
    UIGraphicsEndImageContext();
    
    return image;
    
}

- (void)createBtn {

    NSArray *colors = @[[UIColor redColor], [UIColor greenColor], [UIColor blueColor],
                        [UIColor brownColor], [UIColor yellowColor], [UIColor cyanColor],
                        [UIColor purpleColor], [UIColor orangeColor], [UIColor magentaColor]];
    
    // 循环创建按钮
    CGFloat w = self.bounds.size.width / colors.count;
    
    // Block循环遍历
    [colors enumerateObjectsUsingBlock:^(UIColor *color, NSUInteger idx, BOOL *stop) {
        UIButton *btn = [UIButton buttonWithType:UIButtonTypeCustom];
        
        CGFloat x = idx * w;
        [btn setFrame:CGRectMake(x, 0, w, self.bounds.size.height)];
        
        CGSize size = CGSizeMake(w - kBtnSpacing, w - kBtnSpacing);
        UIImage *img = [self createImageWithColor:color size:size];
        [btn setImage:img forState:UIControlStateNormal];
        
        btn.tag = idx;
        
        [self addSubview:btn];
        
        [btn addTarget:self action:@selector(tapButton:) forControlEvents:UIControlEventTouchUpInside];
        
    }];
    
}

#pragma mark - 按钮监听方法
- (void)tapButton:(UIButton *)btn {

    
}

@end
