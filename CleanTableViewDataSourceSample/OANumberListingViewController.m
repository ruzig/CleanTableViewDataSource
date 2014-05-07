//
//  OANumberListingViewController.m
//  CleanTableViewDataSourceSample
//
//  Created by Phat, Le Tan on 5/7/14.
//  Copyright (c) 2014 FourFi. All rights reserved.
//

#import "OANumberListingViewController.h"

@interface OANumberListingViewController ()

@property (strong, nonatomic) UITableView *numberTableView;
@property (strong, nonatomic) NSArray *numbers;

@end

@implementation OANumberListingViewController

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
    // Do any additional setup after loading the view.
    self.numbers = @[ @1, @2, @3, @4, @5, @6, @7 ];
    [self.view addSubview:self.numberTableView];
}

- (UITableView *)numberTableView
{
    if (!_numberTableView) {
        _numberTableView = [[UITableView alloc] initWithFrame:self.view.bounds style:UITableViewStylePlain];
    }
    return _numberTableView;
}

@end
