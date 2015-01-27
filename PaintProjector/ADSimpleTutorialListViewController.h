//
//  ADSimpleTutorialListViewController.h
//  PaintProjector
//
//  Created by 胡 文杰 on 9/9/14.
//  Copyright (c) 2014 WenjiHu. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ADAnamorphosisBasicViewController.h"

@interface ADSimpleTutorialListViewController : UIViewController
<ADAnamorphosisBasicViewControllerDelegate>
@property (assign, nonatomic) id delegate;
- (IBAction)tutorialDoneButtonTouchUp:(id)sender;
@end

@protocol ADSimpleTutorialListViewControllerDelegate
- (void)willTutorialListDone;
@end