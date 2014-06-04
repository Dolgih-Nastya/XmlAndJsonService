//
//  PXMLMainService.m
//  XMLAndJSONParsing
//
//  Created by Анастасия Долгих on 6/4/14.
//  Copyright (c) 2014 Dolgih Nastya. All rights reserved.
//

#import "PXMLMainService.h"
#import "AFNetworking.h"
#import "XMLService.h"

@interface PXMLMainService()
@property(nonatomic, strong) AFHTTPClient *xmlClient;
@end
@implementation PXMLMainService
- (void)parseWithComletion:(ActionWithObject)completionBlock
{
    self.xmlClient = [AFHTTPClient clientWithBaseURL:[NSURL URLWithString:@"http://www.pravda.com.ua"]];
    NSURLRequest *request = [self.xmlClient requestWithMethod:@"GET" path:@"/rus/rss/view_news" parameters:nil];
    AFHTTPRequestOperation *operation = [[AFHTTPRequestOperation alloc] initWithRequest:request];
    [operation setCompletionBlockWithSuccess:^(AFHTTPRequestOperation *operation, NSData *responseObject) {
        
        [XMLService parseWithData:responseObject completion:^(NSArray *data) {
            completionBlock(data);
        }];
    } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
        NSLog(@"%@", error);
        
    }];
    [self.xmlClient.operationQueue addOperation:operation];
}
@end
