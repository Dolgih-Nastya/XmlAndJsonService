//
//  PJSONMainService.m
//  XMLAndJSONParsing
//
//  Created by Анастасия Долгих on 6/4/14.
//  Copyright (c) 2014 Dolgih Nastya. All rights reserved.
//

#import "PJSONMainService.h"
#import "AFNetworking.h"
#import "PJSONParser.h"
#import "PJSONObject.h"

@interface PJSONMainService ()
@property(nonatomic, strong) AFHTTPClient *jsonClient;
@end
@implementation PJSONMainService
- (void)parseWithComletion:(ActionWithObject)completionBlock
{
    self.jsonClient = [AFHTTPClient clientWithBaseURL:[NSURL URLWithString:@"http://echo.jsontest.com"]];
    NSURLRequest *request = [self.jsonClient requestWithMethod:@"GET" path:@"/key/value/one/two" parameters:nil];
    AFJSONRequestOperation *operation = [[AFJSONRequestOperation alloc] initWithRequest:request];
    [operation setCompletionBlockWithSuccess:^(AFHTTPRequestOperation *operation, id responseObject) {
        [PJSONParser parseWithData:responseObject completion:^(PJSONObject *data) {
            completionBlock(data);
        }];
        
    } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
        
    }];
    [self.jsonClient.operationQueue addOperation:operation];
}
@end
