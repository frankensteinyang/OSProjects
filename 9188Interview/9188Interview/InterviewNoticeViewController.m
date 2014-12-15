//
//  InterviewNoticeViewController.m
//  9188Interview
//
//  Created by Hannibal Yang on 12/10/14.
//  Copyright (c) 2014 Hannibal Yang. All rights reserved.
//

#import "InterviewNoticeViewController.h"
#import "InterviewNewsList.h"
#import "InterviewNewsViewController.h"

@interface InterviewNoticeViewController () <NSXMLParserDelegate> {

    NSMutableArray *_dataList;
    // 当前解析的新闻列表模型对象
    InterviewNewsList *_newsList;
}
@end

@implementation InterviewNoticeViewController

- (void)viewDidLoad {

    self.title = @"公告";
    [self loadXML];
    
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {

    static NSString *ID = @"NoticeCellID";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:ID];
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:ID];
    }
    InterviewNewsList *list = _dataList[indexPath.row];
    cell.textLabel.text = list.ntitle;
    return cell;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {

    return _dataList.count;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    
    InterviewNewsViewController *newsC = [[InterviewNewsViewController alloc] init];
    [self.navigationController pushViewController:newsC animated:YES];
}

#pragma mark - 解析XML的代理方法
// 开始解析文档
- (void)parserDidStartDocument:(NSXMLParser *)parser {

    // 初始化数字
    _dataList = [NSMutableArray array];
    
}

// 解析一个节点
- (void)parser:(NSXMLParser *)parser didStartElement:(NSString *)elementName namespaceURI:(NSString *)namespaceURI qualifiedName:(NSString *)qName attributes:(NSDictionary *)attributeDict {

//    NSLog(@"解析一个节点:%@ %@", elementName, attributeDict);
    if ([elementName isEqualToString:@"row"]) {
        _newsList = [[InterviewNewsList alloc] init];
        _newsList.arcurl = attributeDict[@"arcurl"];
        _newsList.ntitle = attributeDict[@"ntitle"];
        _newsList.ndate = attributeDict[@"ndate"];
    }
    
}

// 查找节点内容
- (void)parser:(NSXMLParser *)parser foundCharacters:(NSString *)string {
    
//    NSLog(@"查找节点内容:%@", string);
}

// 节点完成
- (void)parser:(NSXMLParser *)parser didEndElement:(NSString *)elementName namespaceURI:(NSString *)namespaceURI qualifiedName:(NSString *)qName {

    if ([elementName isEqualToString:@"row"]) {
        // 对象的属性填充完毕，添加到数组
        [_dataList addObject:_newsList];
    }
    
}

// 解析完成
- (void)parserDidEndDocument:(NSXMLParser *)parser {

}

// 解析出错
- (void)parser:(NSXMLParser *)parser parseErrorOccurred:(NSError *)parseError {

    NSLog(@"%@", parseError.localizedDescription);
}

- (void)loadXML {

    NSURL *url = [NSURL URLWithString:@"http://iphone.9188.com/news/appgonggao/appgonggaolist.xml"];
    NSURLRequest *request = [NSURLRequest requestWithURL:url cachePolicy:NSURLRequestUseProtocolCachePolicy timeoutInterval:2.0f];
    NSError *error;
    
    NSData *data = [NSURLConnection sendSynchronousRequest:request returningResponse:nil error:&error];
    
    // 解析器
    NSXMLParser *parser = [[NSXMLParser alloc] initWithData:data];
    // 设置代理
    parser.delegate = self;
    // 开始解析
    [parser parse];
    
    if (data != nil) {
//        NSString *result = [[NSString alloc] initWithData:data encoding:NSUTF8StringEncoding];
    } else if (error == nil) {
        NSLog(@"空数据！");
    } else {
        NSLog(@"%@", error.localizedDescription);
    }
    
}

@end
