//
//  CustomCell.m
//  Circular
//
//  Created by KOiSPRK on 7/2/56 BE.
//  Copyright (c) 2556 BE Codec. All rights reserved.
//

#import "CustomCell.h"

@implementation CustomCell
@synthesize image;
@synthesize description;
@synthesize title;

- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        // Initialization code
    }
    return self;
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated
{
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
