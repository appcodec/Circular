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

@interface FeedsCellViewController()
@property (nonatomic, strong) NSArray *sampleItems;
@end

@implementation FeedsCellViewController
@synthesize sampleItems;
@synthesize table;

- (void)awakeFromNib
{
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
    cell.description.text = @"TEXT";
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

@end
