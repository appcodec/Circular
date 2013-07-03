//
//  DetailCellViewController.m
//  Circular
//
//  Created by Codec on 7/2/56 BE.
//  Copyright (c) 2556 Codec. All rights reserved.
//

#import "DetailCellViewController.h"

@interface DetailCellViewController ()

@end

@implementation DetailCellViewController

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
    NSString * plistPath = [[NSBundle mainBundle] pathForResource:@"My Property" ofType:@"plist"];
    _myProperty = [NSDictionary dictionaryWithContentsOfFile:plistPath];
    
    [self setViewDefault];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)setViewDefault
{
    UIButton *backButton = [[UIButton alloc] initWithFrame:CGRectMake(0, 0, 34, 26)];
    [backButton setBackgroundImage:[UIImage imageNamed:[_myProperty valueForKey:@"Backbutton"]] forState:UIControlStateNormal];
    UIBarButtonItem *barBackButtonItem = [[UIBarButtonItem alloc] initWithCustomView:backButton];
    [backButton addTarget:self action:@selector(popCurrentViewController) forControlEvents:UIControlEventTouchUpInside];
    self.navigationItem.leftBarButtonItem = barBackButtonItem;
    self.navigationItem.hidesBackButton = YES;
}

- (void)popCurrentViewController
{
    [self.navigationController popViewControllerAnimated:YES];
}

@end
