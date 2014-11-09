//
//  News.h
//  XibCustomisesCell
//
//  Created by Hannibal Yang on 11/10/14.
//  Copyright (c) 2014 Hannibal Yang. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface News : NSObject

@property (nonatomic, copy) NSString *title;
@property (nonatomic, assign) int comments;
@property (nonatomic, copy) NSString *image;
@property (nonatomic, copy) NSString *author;

- (id)initWithDict:(NSDictionary *)dict;
+ (id)newsWithDict:(NSDictionary *)dict;

@end
