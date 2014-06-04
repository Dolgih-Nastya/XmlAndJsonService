//
//  XMLViewController.m
//  XMLAndJSONParsing
//
//  Copyright (c) 2014 Dolgih Nastya. All rights reserved.
//

#import "XMLViewController.h"
#import "PXMLMainService.h"
#import "PJSONMainService.h"

@interface XMLViewController ()
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
    [self.tableView registerClass:[UITableViewCell class] forCellReuseIdentifier:@"cell"];
}

- (IBAction)xml:(id)sender
{
    PXMLMainService *service = [PXMLMainService new];
    __weak typeof(self) weakSelf = self;
    [service parseWithComletion:^(NSArray *data)
     {
         weakSelf.data = data;
         [weakSelf.tableView reloadData];
     }];
}

- (IBAction)json:(id)sender
{
    PJSONMainService *service = [PJSONMainService new];
    [service parseWithComletion:^(id obj)
     {
         NSLog(@"%@", obj);
     }];
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
