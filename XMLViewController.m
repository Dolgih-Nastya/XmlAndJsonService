//
//  XMLViewController.m
//  XMLAndJSONParsing
//
//  Created by Vlad Korzun on 01.06.14.
//  Copyright (c) 2014 Dolgih Nastya. All rights reserved.
//

#import "XMLViewController.h"
#import "AFNetworking.h"
#import "XMLService.h"
#import "PXMLFeed.h"
#import "JSONKit.h"

@interface XMLViewController ()
@property(nonatomic, strong) AFHTTPClient *xmlClient;
@property(nonatomic, strong) AFHTTPClient *jsonClient;
@property(nonatomic, strong) IBOutlet UITableView *tableView;
@property(nonatomic, strong) NSArray *data;
@end

@implementation XMLViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    self.xmlClient = [AFHTTPClient clientWithBaseURL:[NSURL URLWithString:@"http://www.pravda.com.ua"]];
    self.jsonClient = [AFHTTPClient clientWithBaseURL:[NSURL URLWithString:@"https://vip-services.privatbank.ua"]];
    [self.tableView registerClass:[UITableViewCell class] forCellReuseIdentifier:@"cell"];
}

- (IBAction)xml:(id)sender
{
    NSURLRequest *request = [self.xmlClient requestWithMethod:@"GET" path:@"/rus/rss/view_news" parameters:nil];
    AFHTTPRequestOperation *operation = [[AFHTTPRequestOperation alloc] initWithRequest:request];
    [operation setCompletionBlockWithSuccess:^(AFHTTPRequestOperation *operation, NSData *responseObject) {
        
        [XMLService parseWithData:responseObject completion:^(NSArray *data) {
            self.data = data;
            [self.tableView reloadData];
        }];
    } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
        
    }];
    [self.xmlClient.operationQueue addOperation:operation];
}

- (IBAction)json:(id)sender
{
    NSURLRequest *request = [self.jsonClient requestWithMethod:@"GET" path:@"/getpoints/?sel=circle&lat=50.58&lng=32.38&rad=10000&format=json" parameters:nil];
    AFHTTPRequestOperation *operation = [[AFHTTPRequestOperation alloc] initWithRequest:request];
    [operation setCompletionBlockWithSuccess:^(AFHTTPRequestOperation *operation, NSData *responseObject) {
        NSError *error = nil;
        NSDictionary *dict = [NSJSONSerialization JSONObjectWithData:responseObject options:NSJSONReadingAllowFragments error:&error];
//        [XMLService parseWithData:responseObject completion:^(NSArray *data) {
//            self.data = data;
//            [self.tableView reloadData];
//        }];
        NSLog(@"%@",dict);
        NSDictionary *dict2 = [responseObject objectFromJSONData];
        NSLog(@"%@",dict2);
    } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
        
    }];
    [self.jsonClient.operationQueue addOperation:operation];
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return self.data.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *cell = [self.tableView dequeueReusableCellWithIdentifier:@"cell"];
    cell.textLabel.text = [self.data[indexPath.row] title];
    return cell;
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
