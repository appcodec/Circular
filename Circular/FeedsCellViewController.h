//
//  SampleTableViewController.h
//  ECSlidingViewController
//
//  Created by Michael Enriquez on 2/13/12.
//  Copyright (c) 2012 EdgeCase. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ECSlidingViewController.h"

@interface FeedsCellViewController : UITableViewController <UITableViewDataSource, UITabBarControllerDelegate , UIGestureRecognizerDelegate>

@property (nonatomic,strong) IBOutlet UITableView * tableView;
@property (nonatomic,retain)NSDictionary * myProperty;
@property (nonatomic,retain)NSMutableArray * sampleFeed;

- (IBAction)revealMenu:(id)sender;

@end
