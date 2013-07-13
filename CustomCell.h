//
//  CustomCell.h
//  Circular
//
//  Created by KOiSPRK on 7/2/56 BE.
//  Copyright (c) 2556 BE Codec. All rights reserved.
//

#import <UIKit/UIKit.h>

/* cellStyle01 : This cell contains title and description. The height row is 98.
   cellStyle02 : This cell contains title, description, and image. The height row is 320. */


@interface CustomCell : UITableViewCell

@property (strong, nonatomic) IBOutlet UIImageView *image;
@property (strong, nonatomic) IBOutlet UILabel *title;
@property (strong, nonatomic) IBOutlet UILabel *description;

@end
