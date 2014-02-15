//
//  PhotoScreen.h
//  iReporter
//
//  Created by Marin Todorov on 09/02/2012.
//  Copyright (c) 2012 Marin Todorov. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface PhotoScreen : UIViewController<UIImagePickerControllerDelegate, UIActionSheetDelegate, UITextFieldDelegate>
{
    IBOutlet UIImageView* photo;
    IBOutlet UIBarButtonItem* btnAction;
    IBOutlet UITextField* fldTitle;
}

//show the app menu 
-(IBAction)btnActionTapped:(id)sender;
-(void)drawPic;
-(void)takePhoto;
-(void)effects;
-(void)uploadPhoto;
-(void)logout;

@end
