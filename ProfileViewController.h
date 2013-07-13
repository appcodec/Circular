//
//  MainPageController.h
//  Circular
//
//  Created by Codec on 7/2/56 BE.
//  Copyright (c) 2556 Codec. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <QuartzCore/QuartzCore.h>
#import "ECSlidingViewController.h"
#import "MenuViewController.h"
#import "RDActionSheet.h"
#import "AGMedallionView.h"

@interface ProfileViewController : UIViewController<UINavigationControllerDelegate,
UIImagePickerControllerDelegate>
{
    
    AGMedallionView *medallionView;
}

@property (nonatomic, strong) IBOutlet AGMedallionView *medallionView;
- (IBAction)revealMenu:(id)sender;
@property (strong, nonatomic) IBOutlet UIButton *cover_btn;
-(void)changeProfilePhoto_btn:(id)sender;
-(IBAction)changeCoverPhoto_btn:(id)sender;

@end
