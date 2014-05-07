//
//  OANumberListingViewController.m
//  CleanTableViewDataSourceSample
//
//  Created by Phat, Le Tan on 5/7/14.
//  Copyright (c) 2014 FourFi. All rights reserved.
//

#import "OANumberListingViewController.h"
#import "OAArrayDataSource.h"

NSString *const kNumberCellIdentifier = @"OANumberTableViewCellIdentifier";

@interface OANumberListingViewController ()

@property (strong, nonatomic) UITableView *numberTableView;
@property (strong, nonatomic) NSArray *numbers;
@property (strong, nonatomic) OAArrayDataSource *arrayDataSource;

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
        _numberTableView = [[UITableView alloc] initWithFrame:self.view.bounds
                                                        style:UITableViewStylePlain];

        //To use CleanTableViewDataSource, you should register the cell with identifer
        [_numberTableView registerClass:[UITableViewCell class] forCellReuseIdentifier:kNumberCellIdentifier];
        _numberTableView.dataSource = self.arrayDataSource;
    }
    return _numberTableView;
}

- (OAArrayDataSource *)arrayDataSource
{
    TableViewCellConfigureBlock configureCell = ^(UITableViewCell *cell, id item) {
        //Configure cell within this block. If there are many types of cell, write more blocks or functions to configure cell depending on the item passing.
        cell.textLabel.text = [item stringValue];
    };
    IdentifierParserBlock identifierParserBlock = ^NSString *(id item) {
        //Depend on item data, return the right cell identifier here.
        return kNumberCellIdentifier;
    };
    if (!_arrayDataSource) {
        _arrayDataSource = [[OAArrayDataSource alloc] initWithItems:self.numbers
                                              identifierParserBlock:identifierParserBlock
                                                 configureCellBlock:configureCell];
    }
    return _arrayDataSource;
}

@end
