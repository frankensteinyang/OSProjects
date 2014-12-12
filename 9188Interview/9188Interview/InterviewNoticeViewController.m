//
//  InterviewNoticeViewController.m
//  9188Interview
//
//  Created by Hannibal Yang on 12/10/14.
//  Copyright (c) 2014 Hannibal Yang. All rights reserved.
//

#import "InterviewNoticeViewController.h"

#define kBaseURL @"http://iphone.9188.com/news/appgonggao/appgonggaolist.xml"

@interface InterviewNoticeViewController () <NSXMLParserDelegate> {

    NSMutableArray *_newsList;
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
    cell.textLabel.text = @"Frankenstein!";
    return cell;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {

    return 10;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {

    NSLog(@"***");
}

#pragma mark - NSXMLParserDelegate
- (void)parserDidStartDocument:(NSXMLParser *)parser {

    _newsList = [NSMutableArray array];
    
}

- (void)parser:(NSXMLParser *)parser didStartElement:(NSString *)elementName namespaceURI:(NSString *)namespaceURI qualifiedName:(NSString *)qName attributes:(NSDictionary *)attributeDict {

    
}

- (void)loadXML {

    NSURL *url = [NSURL URLWithString:@"http://iphone.9188.com/news/appgonggao/appgonggaolist.xml"];
    NSURLRequest *request = [NSURLRequest requestWithURL:url cachePolicy:NSURLRequestUseProtocolCachePolicy timeoutInterval:2.0f];
    NSError *error;
    
    NSData *data = [NSURLConnection sendSynchronousRequest:request returningResponse:nil error:&error];
    
    NSLog(@"%d", data.length);
    
    
    
    
}

@end
