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

#define cellStyle01 98 // only text
#define cellStyle02 320 // text + image

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
//    return self.sampleItems.count;
    return 20;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (indexPath.row % 2 == 0) {
        return cellStyle01;
    }else{
        return cellStyle02;
    }
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    NSString *cellIdentifier = [[NSString alloc] init];
    if (indexPath.row % 2 == 0) {
        cellIdentifier = @"cellStyle01";
    }else{
        cellIdentifier = @"cellStyle02";
    }
    
    CustomCell *cell = [tableView dequeueReusableCellWithIdentifier:cellIdentifier];
    if (cell == nil) {
        cell = [[CustomCell alloc]
                initWithStyle:UITableViewCellStyleDefault
                reuseIdentifier:cellIdentifier];
    }
    
    cell.title.text = @"CentralWorld";
    cell.title.font = [UIFont fontWithName:[_myProperty valueForKey:@"Font B"] size:20];
    cell.title.textColor = [UIColor grayColor];

    cell.description.text = @"Grand Sale Promotion 30-70% รับเพิ่มคะแนน The 1 Card 5,000 คะแนน เมื่อรวมยอดซื้อประกันชีวิตทุก 50,000.- จากเมืองไทยประกันชีวิตหรือ รับเพิ่ม 1,000 คะแนน เมื่อซื้อประกันภัยรถยนต์ชั้น 1 จากสินมั่นคง";
    cell.description.textColor = [UIColor blackColor];
    
    [cell.image setImage:[UIImage imageNamed:@"News_test01.jpg"]];
    
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
        DetailCellViewController * DVC = [segue destinationViewController];
        
        NSIndexPath *myIndexPath = [self.table indexPathForSelectedRow];
        
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
