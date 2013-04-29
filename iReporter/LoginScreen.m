 //
//  LoginScreen.m
//  iReporter
//
//  Created by Marin Todorov on 09/02/2012.
//  Copyright (c) 2012 Marin Todorov. All rights reserved.
//

#import "LoginScreen.h"
#import "UIAlertView+error.h"
#import "API.h"
#include <CommonCrypto/CommonDigest.h>

#define kSalt @"adlfu3489tyh2jnkLIUGI&%EV(&0982cbgrykxjnk8855"

@implementation LoginScreen
-(void)viewDidLoad {
    [super viewDidLoad];
//    url = [API sharedInstance].baseURL;
    //focus on the username field / show keyboard
    [fldUsername becomeFirstResponder];
}
#pragma mark - View lifecycle

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    // Return YES for supported orientations
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}

-(IBAction)btnLoginRegisterTapped:(UIButton*)sender
{
    API* sharedInstance = [API sharedInstance];    
    //form fields validation
    if (fldUsername.text.length < 4 || fldPassword.text.length < 4) {
        [UIAlertView error:@"Enter username and password over 4 chars each."];
        return;
    }
    
    //salt the password
    NSString* saltedPassword = [NSString stringWithFormat:@"%@%@", fldPassword.text, kSalt];
    
    //prepare the hashed storage
    NSString* hashedPassword = nil;
    unsigned char hashedPasswordData[CC_SHA1_DIGEST_LENGTH];
    
    //hash the pass
    NSData *data = [saltedPassword dataUsingEncoding: NSUTF8StringEncoding];
    if (CC_SHA1([data bytes], [data length], hashedPasswordData)) {
        hashedPassword = [[NSString alloc] initWithBytes:hashedPasswordData length:sizeof(hashedPasswordData) encoding:NSASCIIStringEncoding];
    } else {
        [UIAlertView error:@"Password can't be sent"];
        return;
    }   
    
    //check whether it's a login or register
    NSString* command = (sender.tag==1)?@"register":@"login";
    NSMutableDictionary* params =[NSMutableDictionary dictionaryWithObjectsAndKeys: 
                                  command, @"command",
                                  fldUsername.text, @"username",
                                  hashedPassword, @"password",
                                  nil];
    
    //make the call to the web API

    [sharedInstance commandWithParams:params
                               onCompletion:^(NSDictionary *json) {
                                   //result returned
                                   NSDictionary* res = [[json objectForKey:@"result"] objectAtIndex:0];
                                   
                                   if ([json objectForKey:@"error"]==nil && [[res objectForKey:@"IdUser"] intValue]>0) {
                                       [[API sharedInstance] setUser: res];
                                       [self.presentingViewController dismissViewControllerAnimated:YES completion:nil];
                                       
                                       //show message to the user
                                       [[[UIAlertView alloc] initWithTitle:@"Logged in" 
                                                                   message:[NSString stringWithFormat:@"Welcome %@",[res objectForKey:@"username"] ]
                                                                  delegate:nil 
                                                         cancelButtonTitle:@"Close" 
                                                         otherButtonTitles: nil] show];
                                       
                                   } else {
                                       //error
                                       [UIAlertView error:[json objectForKey:@"error"]];
                                   }
                                   
                               }];    
}

- (IBAction)testPassword:(id)sender {
//        API* sharedInstance = [API sharedInstance];
}

- (IBAction)testPassword2:(id)sender {
//    API* sharedInstance = [API sharedInstance];
}

@end
