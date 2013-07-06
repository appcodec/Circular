//
//  SampleTableViewController.m
//  ECSlidingViewController
//
//  Created by Michael Enriquez on 2/13/12.
//  Copyright (c) 2012 EdgeCase. All rights reserved.
//

#import "FeedsCellViewController.h"
#import "DetailCellViewController.h"
#import "CustomCell.h"

@interface FeedsCellViewController(){
    IBOutlet UIBarButtonItem * barItem;
}



@property (nonatomic, strong) NSArray *sampleItems;
@end

@implementation FeedsCellViewController
@synthesize sampleItems;
@synthesize table;

- (void)awakeFromNib
{
    NSString * plistPath = [[NSBundle mainBundle] pathForResource:@"My Property" ofType:@"plist"];
    _myProperty = [NSDictionary dictionaryWithContentsOfFile:plistPath];
    
    [self setViewDefault];
    
    self.sampleItems = [NSArray arrayWithObjects:@"One", @"Two", @"Three", nil];
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)sectionIndex
{
    return self.sampleItems.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    NSString *cellIdentifier = @"toDetail";
    
    
    CustomCell *cell = [tableView dequeueReusableCellWithIdentifier:cellIdentifier];
    if (cell == nil) {
        cell = [[CustomCell alloc]
                initWithStyle:UITableViewCellStyleDefault
                reuseIdentifier:cellIdentifier];
    }
    
    cell.title.text = @"Hot News !!";
    cell.title.font = [UIFont fontWithName:[_myProperty valueForKey:@"Font B"] size:17];
    cell.title.textColor = [UIColor grayColor];

//    cell.description.text = @"TEXT";
    cell.description.font = [UIFont fontWithName:[_myProperty valueForKey:@"Font"] size:13];
    cell.description.textColor = [UIColor grayColor];
    
    [cell.image setImage:[UIImage imageNamed:@"Default"]];
    
    return cell;
}


-(void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    if ([[segue identifier] isEqualToString:@"toDetail"])
    {
        
        DetailCellViewController *DVC = [segue destinationViewController];
//        PeekPagedScrollViewController *peekPagedScrollViewController = [segue destinationViewController];
        
        NSIndexPath *myIndexPath = [self.table indexPathForSelectedRow];
        
        int row = [myIndexPath row];
        
//        NSLog(@"Index:%d",row);

    }
}

- (IBAction)revealMenu:(id)sender
{
    [self.slidingViewController anchorTopViewTo:ECRight];
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)toInterfaceOrientation
{
    return YES;
}

-(void)setViewDefault{
    UIImage * backgroundImage = [UIImage imageNamed:[_myProperty valueForKey:@"Menubutton"]];
    backgroundImage = [backgroundImage stretchableImageWithLeftCapWidth:30 topCapHeight:2];
    [barItem setBackgroundImage:backgroundImage forState:UIControlStateNormal barMetrics:UIBarMetricsDefault];
}

@end
