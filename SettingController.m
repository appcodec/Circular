//
//  SettingController.m
//  Circular
//
//  Created by Codec on 7/3/56 BE.
//  Copyright (c) 2556 Codec. All rights reserved.
//

#import "SettingController.h"

@interface SettingController (){
    IBOutlet UINavigationBar * topBar;
    IBOutlet UIBarButtonItem * barItem;
}
@property (nonatomic,retain)NSDictionary * myProperty;

@end

@implementation SettingController

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
    
    if (![self.slidingViewController.underLeftViewController isKindOfClass:[MenuViewController class]]) {
        self.slidingViewController.underLeftViewController  = [self.storyboard instantiateViewControllerWithIdentifier:@"Menu"];
    }
    
    
    [self.view addGestureRecognizer:self.slidingViewController.panGesture];
}

- (IBAction)revealMenu:(id)sender
{
    [self.slidingViewController anchorTopViewTo:ECRight];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void)setViewDefault{
    UIImage *backgroundImage = [UIImage imageNamed:[_myProperty valueForKey:@"NavigationBar"]];
    [topBar setBackgroundImage:backgroundImage forBarMetrics:UIBarMetricsDefault];
    
    UILabel * text = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, 20, 20)];
    text.font = [UIFont fontWithName:[_myProperty valueForKey:@"Font B"] size:19];
    text.textColor = [UIColor grayColor];
    text.text = @"Account Setting";
    [[topBar topItem] setTitleView:text];
    
    backgroundImage = [UIImage imageNamed:[_myProperty valueForKey:@"Menubutton"]];
    backgroundImage = [backgroundImage stretchableImageWithLeftCapWidth:30 topCapHeight:2];
    [barItem setBackgroundImage:backgroundImage forState:UIControlStateNormal barMetrics:UIBarMetricsDefault];
    
    self.view.layer.shadowOpacity = 0.75f;
    self.view.layer.shadowRadius = 10.0f;
    self.view.layer.shadowColor = [UIColor blackColor].CGColor;
}

@end
