//
//  LoginScreen.h
//  iReporter
//
//  Created by Marin Todorov on 09/02/2012.
//  Copyright (c) 2012 Marin Todorov. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "API.h"
@interface LoginScreen : UIViewController
{
    //the login form fields
    IBOutlet UITextField* fldUsername;
    IBOutlet UITextField* fldPassword;
//    API* _sharedInstance;
//    NSURL* url;
    
}

//action for when either button is pressed
-(IBAction)btnLoginRegisterTapped:(id)sender;
- (IBAction)testPassword:(id)sender;
- (IBAction)testPassword2:(id)sender;

@end