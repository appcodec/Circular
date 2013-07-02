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
    
    UIImage *backgroundImage = [UIImage imageNamed:[_myProperty valueForKey:@"NavigationBar"]];
    [topBar setBackgroundImage:backgroundImage forBarMetrics:UIBarMetricsDefault];
    
    backgroundImage = [UIImage imageNamed:[_myProperty valueForKey:@"Menubutton"]];
    backgroundImage = [backgroundImage stretchableImageWithLeftCapWidth:30 topCapHeight:2];
    [barItem setBackgroundImage:backgroundImage forState:UIControlStateNormal barMetrics:UIBarMetricsDefault];
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
