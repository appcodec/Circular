//
//  MenuViewController.m
//  ECSlidingViewController
//
//  Created by Michael Enriquez on 1/23/12.
//  Copyright (c) 2012 EdgeCase. All rights reserved.
//

#import "MenuViewController.h"

@interface MenuViewController()

@property (nonatomic, strong) NSArray *menuItems;
@property (nonatomic, strong) IBOutlet UITableView *tableView;

@end

@implementation MenuViewController
@synthesize menuItems;

- (void)awakeFromNib
{
    self.menuItems = [NSArray arrayWithObjects:@"Profile", @"News Feed", @" ", @"Category",@"Food & Drink", @"Shopping",@"Entertainment",@"Music & Arts", nil];
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    UIImageView *sbg = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"sidebarbg"]];
    [sbg setFrame:CGRectMake(0, 0, 220, 480)];
    [self.tableView setBackgroundView:sbg];
    
    [self.slidingViewController setAnchorRightRevealAmount:280.0f];
    self.slidingViewController.underLeftWidthLayout = ECFullWidth;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)sectionIndex
{
    return self.menuItems.count;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    if ([[self.menuItems objectAtIndex:indexPath.row] isEqualToString:@"Category"]) {
        return 35;
    }else if ([[self.menuItems objectAtIndex:indexPath.row] isEqualToString:@" "]){
        return 15;
    }else{
        return 45;
    }
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    NSString *cellIdentifier = @"MenuItemCell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellIdentifier];
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:cellIdentifier];
    }
    
    if ([[self.menuItems objectAtIndex:indexPath.row] isEqualToString:@"Category"]) {
        [cell setAccessoryType:UITableViewCellAccessoryNone];
        [cell setSelectionStyle:UITableViewCellSelectionStyleNone];
        cell.textLabel.text = [NSString stringWithFormat:@"%@",[self.menuItems objectAtIndex:indexPath.row]];
        cell.textLabel.font = [UIFont fontWithName:@"Avenir-Black" size:17];
        cell.textLabel.textColor = [UIColor grayColor];
        UIImageView *bg = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"sidebarCellLine"]];
        [bg setFrame:CGRectMake(0, 0, 10, 0)];
        
        cell.backgroundView = bg;
        return cell;
    }else if ([[self.menuItems objectAtIndex:indexPath.row] isEqualToString:@" "]){
        return cell;
    }
    [cell setAccessoryType:UITableViewCellAccessoryDisclosureIndicator];
    [cell setSelectionStyle:UITableViewCellSelectionStyleGray];
    
    cell.textLabel.text = [NSString stringWithFormat:@"      %@",[self.menuItems objectAtIndex:indexPath.row]];
    cell.textLabel.font = [UIFont fontWithName:@"Avenir Romen" size:13];
    cell.textLabel.textColor = [UIColor whiteColor];
    UIImageView *bg = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"sidebarCellLine"]];
    [bg setFrame:CGRectMake(0, 0, 161.5, 42.5)];
    
    cell.backgroundView = bg;
    UIImageView *imv = [[UIImageView alloc]initWithFrame:CGRectMake(10,12, 20, 20)];
    
    imv.image = [UIImage imageNamed:[self.menuItems objectAtIndex:indexPath.row]];
    [cell.contentView addSubview:imv];
    
    
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    NSString *identifier = [NSString stringWithFormat:@"%@", [self.menuItems objectAtIndex:indexPath.row]];
    if (![identifier isEqualToString:@"Category"] && ![identifier isEqualToString:@" "]) {
        UIViewController *newTopViewController = [self.storyboard instantiateViewControllerWithIdentifier:identifier];
        
        [self.slidingViewController anchorTopViewOffScreenTo:ECRight animations:nil onComplete:^{
            CGRect frame = self.slidingViewController.topViewController.view.frame;
            self.slidingViewController.topViewController = newTopViewController;
            self.slidingViewController.topViewController.view.frame = frame;
            [self.slidingViewController resetTopView];
        }];
    }
}

@end
