//
//  MHAInformation.h
//  UsingStoryboard
//
//  Created by Hannibal Yang on 12/4/14.
//  Copyright (c) 2014 Hannibal Yang. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface MHAInformation : NSObject

@property (copy, nonatomic) NSString *nickname;

+ (MHAInformation *)informationWithName:(NSString *)name;

@end
