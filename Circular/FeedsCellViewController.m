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
#import "Feed.h"

#define cellStyle01 318
#define cellStyle02 122 

@interface FeedsCellViewController(){
    IBOutlet UIBarButtonItem * barItem;
}
@property (nonatomic, strong) NSMutableArray * feedItem;
@end

@implementation FeedsCellViewController
@synthesize feedItem;
@synthesize tableView;

- (void)awakeFromNib
{
    feedItem = [[NSMutableArray alloc]init];
    
    NSString * plistPath = [[NSBundle mainBundle] pathForResource:@"My Property" ofType:@"plist"];
    _myProperty = [NSDictionary dictionaryWithContentsOfFile:plistPath];
    
    plistPath = [[NSBundle mainBundle] pathForResource:@"News feed" ofType:@"plist"];
    _sampleFeed = [[NSMutableArray alloc ]initWithContentsOfFile:plistPath];
    
    for (NSDictionary * dict in _sampleFeed) {
        NSString * name = [dict objectForKey:@"provider_name"];
        NSString * description = [dict objectForKey:@"description"];
        NSString * image = [dict objectForKey:@"image"];
        Boolean isPost = [[dict objectForKey:@"isPost"] boolValue];
        Boolean withImage = [[dict objectForKey:@"withImage"] boolValue];
        
        Feed * newFeed = [[Feed alloc] initWithProvider:name withDescription:description withImage:image isPost:isPost withImage:withImage];
        
        [feedItem addObject:newFeed];
    }
    
    [self setViewDefault];
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)sectionIndex
{
    return self.feedItem.count;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    if ([[feedItem objectAtIndex:indexPath.row] withImage]) {
        return cellStyle01;
    }else{
        return cellStyle02;
    }
}

- (UITableViewCell *)tableView:(UITableView *)tableView1 cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    NSString *cellIdentifier = [[NSString alloc] init];
    Feed * currentFeed = [[Feed alloc]initWithFeed:[feedItem objectAtIndex:indexPath.row]];
    if ([currentFeed withImage]) {
        cellIdentifier = @"cellStyle01";
    }else{
        cellIdentifier = @"cellStyle02";
    }
    
    CustomCell *cell = [tableView1 dequeueReusableCellWithIdentifier:cellIdentifier];
    if (cell == nil) {
        cell = [[CustomCell alloc]
                initWithStyle:UITableViewCellStyleDefault
                reuseIdentifier:cellIdentifier];
    }
    
    cell.title.text = currentFeed.provider_name;
    cell.title.font = [UIFont fontWithName:[_myProperty valueForKey:@"Font B"] size:20];
    
    cell.description.text = currentFeed.description;
    
    if ([currentFeed withImage]) {
        [cell.image setImage:[UIImage imageNamed:currentFeed.image]];
    }
    
    UILongPressGestureRecognizer *lpgr = [[UILongPressGestureRecognizer alloc]
                                          initWithTarget:self action:@selector(handleLongPress:)];
    lpgr.minimumPressDuration = 1.5; //seconds
    lpgr.delegate = self;
    [cell addGestureRecognizer:lpgr];
    
    return cell;
}


-(void)handleLongPress:(UILongPressGestureRecognizer *)gestureRecognizer
{
    if (gestureRecognizer.state == UIGestureRecognizerStateBegan)
	{
		CustomCell *cell = (CustomCell *)[gestureRecognizer view];
		NSIndexPath *indexPath = [self.tableView indexPathForCell:cell];
		NSLog(@"Long-pressed cell at row %ld", (long)indexPath.row);
	}
}


-(void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    if ([[segue identifier] isEqualToString:@"toDetail"])
    {
//        DetailCellViewController * DVC = [segue destinationViewController];
        
        NSIndexPath *myIndexPath = [self.tableView indexPathForSelectedRow];
        
        int row = [myIndexPath row];
        NSLog(@"Index:%d",row);
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
