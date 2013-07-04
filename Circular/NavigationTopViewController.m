//
//  NavigationTopViewController.m
//  ECSlidingViewController
//
//  Created by Michael Enriquez on 2/13/12.
//  Copyright (c) 2012 EdgeCase. All rights reserved.
//

#import "NavigationTopViewController.h"

@implementation NavigationTopViewController



- (void)viewDidLoad;
{
    NSString * plistPath = [[NSBundle mainBundle] pathForResource:@"My Property" ofType:@"plist"];
    _myProperty = [NSDictionary dictionaryWithContentsOfFile:plistPath];

    [self setViewDefault];
    
    [super viewDidLoad];
}


- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    
    self.view.layer.shadowOpacity = 0.75f;
    self.view.layer.shadowRadius = 10.0f;
    self.view.layer.shadowColor = [UIColor blackColor].CGColor;
    
    if (![self.slidingViewController.underLeftViewController isKindOfClass:[MenuViewController class]]) {
        self.slidingViewController.underLeftViewController  = [self.storyboard instantiateViewControllerWithIdentifier:@"Menu"];
    }
    
    [self.view addGestureRecognizer:self.slidingViewController.panGesture];
}

-(void)setViewDefault{
    UIImage *backgroundImage = [UIImage imageNamed:[_myProperty valueForKey:@"NavigationBar"]];
    [self.navigationBar setBackgroundImage:backgroundImage forBarMetrics:UIBarMetricsDefault];
    
    UILabel * text = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, 20, 20)];
    text.font = [UIFont fontWithName:[_myProperty valueForKey:@"Font B"] size:19];
    text.textColor = [UIColor grayColor];
    text.text = @"News Feed";
    [[self.navigationBar topItem] setTitleView:text];
}

@end
