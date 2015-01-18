# GrouponHD
# iPad

// 单元测试断言
XCTAssert(tool.categories.count > 0, @"分类数据加载失败！");
XCTAssert(tool.cities.count > 0, @"城市数据加载失败！");
XCTAssert(tool.cityGroups.count > 0, @"城市组数据加载失败！");
XCTAssert(tool.sorts.count > 0, @"排序数据加载失败！");

XCTAssert([[tool.categories firstObject] isKindOfClass:[GHDGrouponCategory class]], @"分类数据内容错误！");

