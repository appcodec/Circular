//
//  CustomCell.h
//  Circular
//
//  Created by KOiSPRK on 7/2/56 BE.
//  Copyright (c) 2556 BE Codec. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface CustomCell : UITableViewCell

@property (strong, nonatomic) IBOutlet UIImageView *image;
@property (strong, nonatomic) IBOutlet UILabel *title;
@property (strong, nonatomic) IBOutlet UITextView *description;

@end
