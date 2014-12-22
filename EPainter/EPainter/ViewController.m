//
//  ViewController.m
//  EPainter
//
//  Created by Hannibal Yang on 12/21/14.
//  Copyright (c) 2014 Frankenstein Yang. All rights reserved.
//

#import "ViewController.h"
#import "EPPainterView.h"
#import "EPToolsView.h"

@interface ViewController () <EPPainterViewDelegate, EPToolsViewDelegate, UINavigationControllerDelegate, UIImagePickerControllerDelegate>

@property (weak, nonatomic) EPPainterView *painterView;
@property (weak, nonatomic) EPToolsView *toolsView;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    // 实例化绘图视图
    EPPainterView *view = [[EPPainterView alloc] initWithFrame:self.view.bounds];
    // self.view对view进行强引用，如不作此操作，{}结束后，被标识为weak的view会消失
    view.delegate = self;
    [self.view addSubview:view];
    self.painterView = view;
    
    // 实例化工具视图
    // 判断系统的版本
    EPToolsView *toolsView = toolsView = [[EPToolsView alloc] initWithFrame:CGRectMake(0, 0, self.view.bounds.size.width, kToolsViewHeight)];
    
    // 设置代理
    toolsView.delegate = self;
    
    [self.view addSubview:toolsView];
    
    // 将手势事件后的toolsView重新赋值
    self.toolsView = toolsView;
    
}

#pragma mark - EPToolsView的代理方法的实现
- (void)toolsViewSelectedColor:(UIColor *)color {

    // 发送消息给绘图板视图，修改颜色
    [self.painterView setColor:color];
}

- (void)toolsViewSelectedLineWidth:(CGFloat)lineWidth {

    [self.painterView setLineWidth:lineWidth];
}

#pragma mark - EPPainterView的代理方法
- (void)painterViewBeTapped {

    CGRect toolsViewFrame = self.toolsView.frame;
    
    if (toolsViewFrame.origin.y < 0) {
        toolsViewFrame.origin = CGPointZero;
    } else {
        toolsViewFrame.origin = CGPointMake(0, -kToolsViewHeight);
    }
    
    [UIView animateWithDuration:0.4f animations:^{
        [self.toolsView setFrame:toolsViewFrame];
    }];
    
}

- (void)toolsViewSelectedFunction:(kToolsViewFunction)function {

    switch (function) {
        case kToolsViewEraser:
            self.painterView.color = [UIColor whiteColor];
            [self.painterView setLineWidth:40.0f];
            break;
            
        case kToolsViewUndo:
            // 通知绘制视图撤销一步操作
            [self.painterView undo];
            break;
            
        case kToolsViewClear:
            [self.painterView clear];
            break;
            
        case kToolsViewPhoto:
            [self selectPhoto];
            break;
            
        case kToolsViewSave:
            [self.painterView savePhoto];
            break;
            
        default:
            break;
    }
}

#pragma mark - 选择线宽
- (void)toolsViewselectedLineWidth:(CGFloat)lineWidth {

    [self.painterView setLineWidth:lineWidth];
}

#pragma mark 选择照片
- (void)selectPhoto {

    // 实现步骤：
    // 实例化照片选择器
    // 从照片库选择照片:指定照片来源
    // 设置代理
    // 模态显示照片选择器
    
    UIImagePickerController *picker = [[UIImagePickerController alloc] init];
    [picker setSourceType:UIImagePickerControllerSourceTypePhotoLibrary];
    [picker setDelegate:self];
    [self presentViewController:picker animated:YES completion:nil];
    
}

#pragma mark - 照片选择器代理
- (void)imagePickerController:(UIImagePickerController *)picker
didFinishPickingMediaWithInfo:(NSDictionary *)info {

    // 取出照片
    UIImage *img = info[UIImagePickerControllerOriginalImage];
    
    // 把照片传递给绘图板
    [self.painterView setImage:img];
    
    // 模态：关闭照片选择器
    [self dismissViewControllerAnimated:YES completion:nil];
    
}

@end
