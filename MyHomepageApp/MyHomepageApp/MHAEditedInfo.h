//
//  MHAEditedInfo.h
//  MyHomepageApp
//
//  Created by Hannibal Yang on 12/3/14.
//  Copyright (c) 2014 Hannibal Yang. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface MHAEditedInfo : NSObject

@property (nonatomic, copy) NSString *nickname;
@property (nonatomic, assign) int phoneNumber;
@property (nonatomic, copy) NSString *introduction;

+ (id)editedInfoWithName:(NSString *)name phone:(int)phoneNumber introduction:(NSString *)intro;

@end
