//
//  Twitter.h
//  UsingCodeToCreateCell
//
//  Created by Hannibal Yang on 11/8/14.
//  Copyright (c) 2014 Hannibal Yang. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Twitter : NSObject

@property (nonatomic, copy) NSString *nickname;
@property (nonatomic, copy) NSString *content;
@property (nonatomic, copy) NSString *icon;
@property (nonatomic, copy) NSString *time;
@property (nonatomic, copy) NSString *source;
@property (nonatomic, copy) NSString *image;
@property (nonatomic, assign) BOOL isVip;

- (id)initWithDict:(NSDictionary *)dict;
+ (id)twitterWithDick:(NSDictionary *)dict;

@end
