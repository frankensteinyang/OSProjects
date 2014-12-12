//
//  UIImage+Interview.m
//  9188Interview
//
//  Created by Hannibal Yang on 12/9/14.
//  Copyright (c) 2014 Hannibal Yang. All rights reserved.
//

#import "UIImage+Interview.h"

@implementation UIImage (Interview)

+ (UIImage *)resizedImage:(NSString *)imgName {

    UIImage *img = [UIImage imageNamed:imgName];
    return [img stretchableImageWithLeftCapWidth:img.size.width * 0.5 topCapHeight:img.size.height * 0.5];
}

@end
