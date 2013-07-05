//
//  SampleTableViewController.h
//  ECSlidingViewController
//
//  Created by Michael Enriquez on 2/13/12.
//  Copyright (c) 2012 EdgeCase. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ECSlidingViewController.h"

@interface FeedsCellViewController : UITableViewController <UITableViewDataSource, UITabBarControllerDelegate>
@property (nonatomic,retain) IBOutlet UITableView * table;
- (IBAction)revealMenu:(id)sender;
@end
