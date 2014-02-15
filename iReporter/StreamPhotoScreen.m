//
//  StreamPhotoScreen.m
//  iReporter
//
//  Created by Marin Todorov on 10/02/2012.
//  Copyright (c) 2012 Marin Todorov. All rights reserved.
//

#import "StreamPhotoScreen.h"
#import "API.h"
@implementation StreamPhotoScreen

@synthesize IdPhoto;

#pragma mark - View lifecycle

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    // Return YES for supported orientations
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}

- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    
}
-(void)viewDidLoad {
    API* api = [API sharedInstance];
    
    //load the caption of the selected photo
    [api commandWithParams:[NSMutableDictionary dictionaryWithObjectsAndKeys: 
                            @"stream",@"command",
                            IdPhoto,@"IdPhoto",
                            nil] 
     
              onCompletion:^(NSDictionary *json) {
                  
                  //show the text in the label
                  NSArray* list = [json objectForKey:@"result"];
                  NSDictionary* photo = [list objectAtIndex:0];
                  lblTitle.text = [photo objectForKey:@"title"];
              }];
    
    //load the big size photo
    NSURL* imageURL = [api urlForImageWithId:IdPhoto isThumb:NO];
    [photoView setImageWithURL: imageURL];
}
@end
