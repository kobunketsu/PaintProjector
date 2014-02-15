//
//  PhotoScreen.m
//  iReporter
//
//  Created by Marin Todorov on 09/02/2012.
//  Copyright (c) 2012 Marin Todorov. All rights reserved.
//

#import "PhotoScreen.h"
#import "API.h"
#import "UIImage+Resize.h"
#import "UIAlertView+error.h"
@implementation PhotoScreen

#pragma mark - View lifecycle
- (void)viewDidLoad
{
    [super viewDidLoad];
    
    // Custom initialization
    self.navigationItem.rightBarButtonItem = btnAction;
    self.navigationItem.title = @"Post photo";
    
    if(![[API sharedInstance] isAuthorized]){
        [self performSegueWithIdentifier:@"ShowLogin" sender:nil];
    }
    
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    // Return YES for supported orientations
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}

#pragma mark - menu

-(IBAction)btnActionTapped:(id)sender
{
    [fldTitle resignFirstResponder];
    
    //show the app menu
    [[[UIActionSheet alloc] initWithTitle:nil
                                 delegate:self
                        cancelButtonTitle:@"Close"
                   destructiveButtonTitle:nil
                        otherButtonTitles:@"Draw pic", @"Take photo", @"Effects!", @"Post Photo", @"Logout", nil] 
     showInView:self.view];
}
-(void)actionSheet:(UIActionSheet *)actionSheet clickedButtonAtIndex:(NSInteger)buttonIndex {
    switch (buttonIndex) {
        case 0:
            [self drawPic]; break;            
        case 1:
            [self takePhoto]; break;
        case 2:
            [self effects];break;
        case 3:
            [self uploadPhoto]; break;
        case 4:
            [self logout]; break;
    }
}
-(void)drawPic{
    [self performSegueWithIdentifier:@"ShowDrawPic" sender:nil];
}
-(void)takePhoto{
    UIImagePickerController *imagePickerController = [[UIImagePickerController alloc]init];
#if TARGET_IPHONE_SIMULATOR
    imagePickerController.sourceType = UIImagePickerControllerSourceTypePhotoLibrary;
#else
    imagePickerController.sourceType = UIImagePickerControllerSourceTypeCamera;
#endif
    imagePickerController.editing = YES;
    imagePickerController.delegate = (id)self;
    
    [self presentModalViewController:imagePickerController animated:YES];
}
#pragma mark - Image picker delegate methdos
-(void)imagePickerController:(UIImagePickerController *)picker didFinishPickingMediaWithInfo:(NSDictionary *)info {
	UIImage *image = [info objectForKey:UIImagePickerControllerOriginalImage];
    // Resize the image from the camera
	UIImage *scaledImage = [image resizedImageWithContentMode:UIViewContentModeScaleAspectFill bounds:CGSizeMake(photo.frame.size.width, photo.frame.size.height) interpolationQuality:kCGInterpolationHigh];
    // Crop the image to a square (yikes, fancy!)
    UIImage *croppedImage = [scaledImage croppedImage:CGRectMake((scaledImage.size.width -photo.frame.size.width)/2, (scaledImage.size.height -photo.frame.size.height)/2, photo.frame.size.width, photo.frame.size.height)];
    // Show the photo on the screen
    photo.image = croppedImage;
    [picker dismissModalViewControllerAnimated:NO];
}
-(void)effects {
    //apply sepia filter - taken from the Beginning Core Image from iOS5 by Tutorials
    CIImage *beginImage = [CIImage imageWithData: UIImagePNGRepresentation(photo.image)];
    CIContext *context = [CIContext contextWithOptions:nil];
    
    CIFilter *filter = [CIFilter filterWithName:@"CISepiaTone" 
                                  keysAndValues: kCIInputImageKey, beginImage, 
                        @"inputIntensity", [NSNumber numberWithFloat:0.8], nil];
    CIImage *outputImage = [filter outputImage];
    
    CGImageRef cgimg = [context createCGImage:outputImage fromRect:[outputImage extent]];
    photo.image = [UIImage imageWithCGImage:cgimg];
    
    CGImageRelease(cgimg);
}
-(void)imagePickerControllerDidCancel:(UIImagePickerController *)picker {
    [picker dismissModalViewControllerAnimated:NO];
}

-(void)uploadPhoto{
    //upload the image and the title to the web service
    [[API sharedInstance] commandWithParams:[NSMutableDictionary dictionaryWithObjectsAndKeys: 
                                             @"upload",@"command",
                                             UIImageJPEGRepresentation(photo.image,70),@"file",
                                             fldTitle.text, @"title",
                                             nil] 
                               onCompletion:^(NSDictionary *json) {
                                   
                                   //completion
                                   if(![json objectForKey:@"error"]){
                                       //success
                                       [[[UIAlertView alloc]initWithTitle:@"Success" message:@"Your photo is uploaded" delegate:nil cancelButtonTitle:@"Yay!" otherButtonTitles:nil] show];
                                   }
                                   else {
                                       //error check for expired session and if so - authorize the user
                                       NSString* errorMsg = [json objectForKey:@"error"];
                                       [UIAlertView error:errorMsg];
                                       
                                       if([@"Authorization requied" compare:errorMsg]==NSOrderedSame){
                                           [self performSegueWithIdentifier:@"ShowLogin" sender:nil];
                                       }
                                   }
                                
                               }];
}
-(void)logout {
    //logout the user from the server, and also upon success destroy the local authorization
    [[API sharedInstance] commandWithParams:[NSMutableDictionary dictionaryWithObjectsAndKeys: 
                                             @"logout",@"command",
                                             nil]
                               onCompletion:^(NSDictionary *json) {
                                   
                                   //logged out from server
                                   [API sharedInstance].user = nil;
                                   [self performSegueWithIdentifier:@"ShowLogin" sender:nil];
                               }];
}
@end
