//
//  StreamPhotoScreen.h
//  iReporter
//
//  Created by Marin Todorov on 10/02/2012.
//  Copyright (c) 2012 Marin Todorov. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface StreamPhotoScreen : UIViewController
{
    //just the photo view and the photo title
    IBOutlet UIImageView* photoView;
    IBOutlet UILabel* lblTitle;
}

@property (assign, nonatomic) NSNumber* IdPhoto;

@end
