//
//  MainPageController.m
//  Circular
//
//  Created by Codec on 7/2/56 BE.
//  Copyright (c) 2556 Codec. All rights reserved.
//

#import "ProfileViewController.h"
#import <AssetsLibrary/AssetsLibrary.h>
#import <MobileCoreServices/MobileCoreServices.h>

@interface ProfileViewController (){
    IBOutlet UINavigationBar * topBar;
    IBOutlet UIBarButtonItem * barItem;
    UIImage* image;
}
@property (nonatomic,retain)NSDictionary * myProperty;

@end

static inline double radians (double degrees) {return degrees * M_PI/180;}

@implementation ProfileViewController
@synthesize cover_btn;
BOOL isProfilePic;

- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    
    
    // press to change 'cover' picture. Link 'changeCoverPhoto_btn:' in xib.
    image = [UIImage imageNamed:@"cover.jpg"];
    [cover_btn setImage:image forState:UIControlStateNormal];
    
    // press to change 'profile' picture. Call 'changeProfilePhoto_btn:' action
    self.medallionView.image = [UIImage imageNamed:@"Circular3_icon114@2x"];
    UITapGestureRecognizer *tapGestureRecognizer = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(changeProfilePhoto_btn:)];
    [self.medallionView addGestureRecognizer:tapGestureRecognizer];
    
    
    NSString * plistPath = [[NSBundle mainBundle] pathForResource:@"My Property" ofType:@"plist"];
    _myProperty = [NSDictionary dictionaryWithContentsOfFile:plistPath];

    [self setViewDefault];
    
    if (![self.slidingViewController.underLeftViewController isKindOfClass:[MenuViewController class]]) {
        self.slidingViewController.underLeftViewController  = [self.storyboard instantiateViewControllerWithIdentifier:@"Menu"];
    }
    
    
    [self.view addGestureRecognizer:self.slidingViewController.panGesture];
}


#define shouldUseDelegateExample 1

-(void)changeProfilePhoto_btn:(id)sender {
    isProfilePic = true;
    RDActionSheet *actionSheet = [[RDActionSheet alloc] initWithTitle:@"How would you like to set your picture ?" cancelButtonTitle:@"Cancel" primaryButtonTitle:nil destructiveButtonTitle:nil otherButtonTitles:@"Choose Picture", @"Take Picture", nil];
    if (shouldUseDelegateExample) {
        NSLog(@"Delegate callbacks enabled");
        actionSheet.delegate = self;
    } else {
        NSLog(@"Block callbacks enabled");
        actionSheet.callbackBlock = ^(RDActionSheetCallbackType type, NSInteger buttonIndex, NSString *buttonTitle) {
            switch (type) {
                case RDActionSheetCallbackTypeClickedButtonAtIndex:
                    NSLog(@"RDActionSheetCallbackTypeClickedButtonAtIndex %d, title %@", buttonIndex, buttonTitle);
                    break;
                case RDActionSheetCallbackTypeDidDismissWithButtonIndex:
                    NSLog(@"RDActionSheetCallbackTypeDidDismissWithButtonIndex %d, title %@", buttonIndex, buttonTitle);
                    break;
                case RDActionSheetCallbackTypeWillDismissWithButtonIndex:
                    NSLog(@"RDActionSheetCallbackTypeWillDismissWithButtonIndex %d, title %@", buttonIndex, buttonTitle);
                    break;
                case RDActionSheetCallbackTypeDidPresentActionSheet:
                    NSLog(@"RDActionSheetCallbackTypeDidPresentActionSheet");
                    break;
                case RDActionSheetCallbackTypeWillPresentActionSheet:
                    NSLog(@"RDActionSheetCallbackTypeDidPresentActionSheet");
                    break;
            }
        };
    }
    [actionSheet showFrom:self.view];
}

-(void)changeCoverPhoto_btn:(id)sender {
    isProfilePic = false;
    RDActionSheet *actionSheet = [[RDActionSheet alloc] initWithTitle:@"How would you like to set your cover ?" cancelButtonTitle:@"Cancel" primaryButtonTitle:nil destructiveButtonTitle:nil otherButtonTitles:@"Choose Picture", @"Take Picture", nil];
    if (shouldUseDelegateExample) {
        NSLog(@"Delegate callbacks enabled");
        actionSheet.delegate = self;
    } else {
        NSLog(@"Block callbacks enabled");
        actionSheet.callbackBlock = ^(RDActionSheetCallbackType type, NSInteger buttonIndex, NSString *buttonTitle) {
            switch (type) {
                case RDActionSheetCallbackTypeClickedButtonAtIndex:
                    NSLog(@"RDActionSheetCallbackTypeClickedButtonAtIndex %d, title %@", buttonIndex, buttonTitle);
                    break;
                case RDActionSheetCallbackTypeDidDismissWithButtonIndex:
                    NSLog(@"RDActionSheetCallbackTypeDidDismissWithButtonIndex %d, title %@", buttonIndex, buttonTitle);
                    break;
                case RDActionSheetCallbackTypeWillDismissWithButtonIndex:
                    NSLog(@"RDActionSheetCallbackTypeWillDismissWithButtonIndex %d, title %@", buttonIndex, buttonTitle);
                    break;
                case RDActionSheetCallbackTypeDidPresentActionSheet:
                    NSLog(@"RDActionSheetCallbackTypeDidPresentActionSheet");
                    break;
                case RDActionSheetCallbackTypeWillPresentActionSheet:
                    NSLog(@"RDActionSheetCallbackTypeDidPresentActionSheet");
                    break;
            }
        };
    }
    [actionSheet showFrom:self.view];
    
}
    
-(void)actionSheet:(RDActionSheet *)actionSheet didDismissWithButtonIndex:(NSInteger)buttonIndex {
    NSLog(@"didDismissWithButtonIndex %d", buttonIndex);
}

-(void)actionSheet:(RDActionSheet *)actionSheet willDismissWithButtonIndex:(NSInteger)buttonIndex {
    NSLog(@"willDismissWithButtonIndex %d", buttonIndex);
}

-(void)willPresentActionSheet:(RDActionSheet *)actionSheet {
    NSLog(@"willPresentActionSheet");
}

-(void)didPresentActionSheet:(RDActionSheet *)actionSheet {
    NSLog(@"didPresentActionSheet");
}

-(void)actionSheet:(RDActionSheet *)actionSheet clickedButtonAtIndex:(NSInteger)buttonIndex {
    NSLog(@"clickedButtonAtIndex %d", buttonIndex);
    NSLog(@"%@", [actionSheet buttonTitleAtIndex:buttonIndex]);
    
    if (buttonIndex == 2) {
        UIImagePickerController * picker = [[UIImagePickerController alloc] init];
        picker.delegate = self;
        picker.sourceType = UIImagePickerControllerSourceTypeCamera;
        [self presentViewController:picker animated:YES completion:NULL];
    }else if(buttonIndex == 1){
        UIImagePickerController * picker = [[UIImagePickerController alloc] init];
        picker.delegate = self;
        picker.sourceType = UIImagePickerControllerSourceTypePhotoLibrary;
        [self presentViewController:picker animated:YES completion:NULL];
    }
}


- (void)imagePickerController:(UIImagePickerController *)picker didFinishPickingImage:(UIImage *)images
				  editingInfo:(NSDictionary *)editingInfo
{
	[picker dismissViewControllerAnimated:YES completion:NULL];
    
    if (isProfilePic) {
        // set 'profile' image
        self.medallionView.image = images;
    } else {
        // set 'cover' image
        [cover_btn setImage:images forState:UIControlStateNormal];
    }

}


-(UIImage *)resizeImage:(UIImage *)re_image {
    
    CGImageRef imageRef = [re_image CGImage];
    CGImageAlphaInfo alphaInfo = CGImageGetAlphaInfo(imageRef);
    CGColorSpaceRef colorSpaceInfo = CGColorSpaceCreateDeviceRGB();
    
    if (alphaInfo == kCGImageAlphaNone)
        alphaInfo = kCGImageAlphaNoneSkipLast;
    
    int width = 640;
    int height = 640;
    
    CGContextRef bitmap;
    
    if (re_image.imageOrientation == UIImageOrientationUp | re_image.imageOrientation == UIImageOrientationDown) {
        bitmap = CGBitmapContextCreate(NULL, width, height, CGImageGetBitsPerComponent(imageRef), CGImageGetBytesPerRow(imageRef), colorSpaceInfo, alphaInfo);
        
    } else {
        bitmap = CGBitmapContextCreate(NULL, height, width, CGImageGetBitsPerComponent(imageRef), CGImageGetBytesPerRow(imageRef), colorSpaceInfo, alphaInfo);
    }
    
    if (re_image.imageOrientation == UIImageOrientationLeft) {
        NSLog(@"image orientation left");
        CGContextRotateCTM (bitmap, radians(90));
        CGContextTranslateCTM (bitmap, 0, -height);
        
    } else if (re_image.imageOrientation == UIImageOrientationRight) {
        NSLog(@"image orientation right");
        CGContextRotateCTM (bitmap, radians(-90));
        CGContextTranslateCTM (bitmap, -width, 0);
        
    } else if (re_image.imageOrientation == UIImageOrientationUp) {
        NSLog(@"image orientation up");
        
    } else if (re_image.imageOrientation == UIImageOrientationDown) {
        NSLog(@"image orientation down");
        CGContextTranslateCTM (bitmap, width,height);
        CGContextRotateCTM (bitmap, radians(-180.));
    }
    
    CGContextDrawImage(bitmap, CGRectMake(0, 0, width, height), imageRef);
    CGImageRef ref = CGBitmapContextCreateImage(bitmap);
    UIImage *result = [UIImage imageWithCGImage:ref];
    
    CGContextRelease(bitmap);
    CGImageRelease(ref);
    
    return result;
}


- (IBAction)revealMenu:(id)sender
{
    [self.slidingViewController anchorTopViewTo:ECRight];
}

-(void)setViewDefault{
    UIImage *backgroundImage = [UIImage imageNamed:[_myProperty valueForKey:@"NavigationBar"]];
    [topBar setBackgroundImage:backgroundImage forBarMetrics:UIBarMetricsDefault];
    
    UILabel * text = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, 20, 20)];
    text.font = [UIFont fontWithName:[_myProperty valueForKey:@"Font B"] size:19];
    text.textColor = [UIColor grayColor];
    text.text = @"Profile";
    [[topBar topItem] setTitleView:text];
    
    backgroundImage = [UIImage imageNamed:[_myProperty valueForKey:@"Menubutton"]];
    backgroundImage = [backgroundImage stretchableImageWithLeftCapWidth:30 topCapHeight:2];
    [barItem setBackgroundImage:backgroundImage forState:UIControlStateNormal barMetrics:UIBarMetricsDefault];
        
    self.view.layer.shadowOpacity = 0.75f;
    self.view.layer.shadowRadius = 10.0f;
    self.view.layer.shadowColor = [UIColor blackColor].CGColor;
}

@end
