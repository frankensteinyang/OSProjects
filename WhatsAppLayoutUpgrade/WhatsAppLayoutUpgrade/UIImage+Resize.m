//
//  UIImage+Resize.m
//  WhatsAppLayout
//
//  Created by Hannibal Yang on 11/16/14.
//  Copyright (c) 2014 Hannibal Yang. All rights reserved.
//

#import "UIImage+Resize.h"

@implementation UIImage (Resize)
+ (UIImage *)resizedImage:(NSString *)name left:(CGFloat)leftScale top:(CGFloat)topScale {
    
    // 加载图片
    UIImage *image = [UIImage imageNamed:name];
    
    // 左边多少内容需要保护
    CGFloat left = image.size.width * leftScale;
    
    // 顶部多少内容需要保护
    CGFloat top = image.size.height * topScale;
    
    // 这个方法只会拉伸中间的1x1区域
    return [image stretchableImageWithLeftCapWidth:left topCapHeight:top];
}

+ (UIImage *)resizedImage:(NSString *)name {
    
    return [self resizedImage:name left:0.5 top:0.5];
}
@end
