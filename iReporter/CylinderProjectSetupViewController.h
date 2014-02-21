//
//  SetupViewController.h
//  PaintProjector
//
//  Created by 胡 文杰 on 2/16/14.
//  Copyright (c) 2014 WenjiHu. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "CylinderProjectUserInputParams.h"
#import "Animation.h"

@protocol CylinderProjectSetupViewControllerDelegate
- (void)willCylinderProjectParamsChange;
- (void)willCylinderProjectParamsReset;
@end

@interface CylinderProjectSetupViewController : UIViewController<TPPropertyAnimationDelegate>
@property (weak, nonatomic) IBOutlet UISlider *valueSlider;
@property (assign, nonatomic) id delegate;
@property (weak, nonatomic) CylinderProjectUserInputParams *userInputParams;
@property (strong, nonatomic) IBOutletCollection(UIButton) NSArray *allUserInputParamButtons;
@property (weak, nonatomic) IBOutlet UIView *topToolBar;
@property (weak, nonatomic) IBOutlet UIView *eyeDistanceParam;
@property (weak, nonatomic) IBOutlet UIView *eyeHeightParam;
@property (weak, nonatomic) IBOutlet UIView *unitZoomParam;
@property (weak, nonatomic) IBOutlet UIButton *cylinderDiameterButton;
@property (weak, nonatomic) IBOutlet UIButton *cylinderHeightButton;
@property (weak, nonatomic) IBOutlet UIButton *imageWidthButton;
@property (weak, nonatomic) IBOutlet UIButton *imageHeightButton;
@property (weak, nonatomic) IBOutlet UIButton *eyeDistanceButton;
@property (weak, nonatomic) IBOutlet UIButton *eyeHeightButton;
@property (weak, nonatomic) IBOutlet UIButton *unitZoomButton;


- (IBAction)userInputParamButtonTouchUp:(UIButton *)sender;
- (IBAction)userInputParamSliderValueChanged:(UISlider *)sender;
- (void)resetInputParams;

@end
