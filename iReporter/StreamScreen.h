//
//  StreamScreen.h
//  iReporter
//
//  Created by Marin Todorov on 10/02/2012.
//  Copyright (c) 2012 Marin Todorov. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "PhotoView.h"
@interface StreamScreen : UIViewController
{
    IBOutlet UIBarButtonItem* btnCompose;
    IBOutlet UIBarButtonItem* btnRefresh;
    IBOutlet UIScrollView* listView;
}

//refresh the photo stream
-(IBAction)btnRefreshTapped;

@end
