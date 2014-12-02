//
//  MHAEditedInfo.m
//  MyHomepageApp
//
//  Created by Hannibal Yang on 12/3/14.
//  Copyright (c) 2014 Hannibal Yang. All rights reserved.
//

#import "MHAEditedInfo.h"

@implementation MHAEditedInfo

+ (id)editedInfoWithName:(NSString *)name phone:(int)phoneNumber introduction:(NSString *)intro {

    // [[MHAEditedInfo alloc] init] 此处哪个类调用就放哪个类（子类、父类），故用self
    MHAEditedInfo *info = [[self alloc] init];
    info.nickname = name;
    info.phoneNumber = phoneNumber;
    info.introduction = intro;
    return info;
}

@end
