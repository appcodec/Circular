//
//  SampleTableViewController.m
//  ECSlidingViewController
//
//  Created by Michael Enriquez on 2/13/12.
//  Copyright (c) 2012 EdgeCase. All rights reserved.
//

#import "FeedsCellViewController.h"

@interface FeedsCellViewController(){
    IBOutlet UIBarButtonItem * barItem;
}



@property (nonatomic, strong) NSArray *sampleItems;
@end

@implementation FeedsCellViewController
@synthesize sampleItems;

//-(void)viewDidLoad{
//    [super viewDidLoad];
//
//    UIImage * backgroundImage = [UIImage imageNamed:@"nav_btn_sidebar"];
//    backgroundImage = [backgroundImage stretchableImageWithLeftCapWidth:0.2 topCapHeight:-5];
//    [barItem setBackgroundImage:backgroundImage forState:UIControlStateNormal barMetrics:UIBarMetricsDefault];
//}

- (void)awakeFromNib
{
    NSString * plistPath = [[NSBundle mainBundle] pathForResource:@"My Property" ofType:@"plist"];
    _myProperty = [NSDictionary dictionaryWithContentsOfFile:plistPath];
    
    UIImage * backgroundImage = [UIImage imageNamed:[_myProperty valueForKey:@"Menubutton"]];
    backgroundImage = [backgroundImage stretchableImageWithLeftCapWidth:30 topCapHeight:2];
    [barItem setBackgroundImage:backgroundImage forState:UIControlStateNormal barMetrics:UIBarMetricsDefault];
    
    self.sampleItems = [NSArray arrayWithObjects:@"One", @"Two", @"Three", nil];
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)sectionIndex
{
    return self.sampleItems.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    NSString *cellIdentifier = @"SampleCell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellIdentifier];
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:cellIdentifier];
    }
    
    cell.textLabel.text = [self.sampleItems objectAtIndex:indexPath.row];
    
    return cell;
}

- (IBAction)revealMenu:(id)sender
{
    [self.slidingViewController anchorTopViewTo:ECRight];
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)toInterfaceOrientation
{
    return YES;
}

@end
