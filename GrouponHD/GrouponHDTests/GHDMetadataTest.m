//
//  GHDMetadataTest.m
//  GrouponHD
//
//  Created by Frankenstein Yang on 1/18/15.
//  Copyright (c) 2015 Frankenstein Yang. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <XCTest/XCTest.h>
#import "GHDMetadataTool.h"
#import "GHDGrouponCategory.h"

@interface GHDMetadataTest : XCTestCase

@end

@implementation GHDMetadataTest

- (void)setUp {
    [super setUp];
    // Put setup code here. This method is called before the invocation of each test method in the class.
}

- (void)tearDown {
    // Put teardown code here. This method is called after the invocation of each test method in the class.
    [super tearDown];
}

- (void)testExample {
    // This is an example of a functional test case.
    XCTAssert(YES, @"Pass");
}

- (void)testPerformanceExample {
    // This is an example of a performance test case.
    [self measureBlock:^{
        // Put the code you want to measure the time of here.
    }];
}

- (void)testLoadMetadata {

    GHDMetadataTool *tool = [GHDMetadataTool sharedMetadataTool];
    // 单元测试断言
    XCTAssert(tool.categories.count > 0, @"分类数据加载失败！");
    XCTAssert(tool.cities.count > 0, @"城市数据加载失败！");
    XCTAssert(tool.cityGroups.count > 0, @"城市组数据加载失败！");
    XCTAssert(tool.sorts.count > 0, @"排序数据加载失败！");
    
    XCTAssert([[tool.categories firstObject] isKindOfClass:[GHDGrouponCategory class]], @"分类数据内容错误！");
    
}

@end
