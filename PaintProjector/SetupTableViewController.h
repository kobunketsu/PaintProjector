//
//  ShareTableViewController.h
//  PaintProjector
//
//  Created by 胡 文杰 on 2/15/14.
//  Copyright (c) 2014 WenjiHu. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "CylinderProjectUserInputParams.h"
#import "Animation.h"

@protocol SetupTableViewControllerDelegate
- (void)willCylinderProjectParamsChange;
- (void)willCylinderProjectParamsReset;
@end

@interface SetupTableViewController : UITableViewController <TPPropertyAnimationDelegate>
@property (assign, nonatomic) id delegate;
@property (weak, nonatomic) CylinderProjectUserInputParams *userInputParams;
- (IBAction)sliderValueChanged:(UISlider *)sender;
- (float)tableViewHeight;
@end
