//
//  ADSimpleTutorialViewController.h
//  PaintProjector
//
//  Created by 胡 文杰 on 9/8/14.
//  Copyright (c) 2014 WenjiHu. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ADAnamorphosisBasicViewController.h"
#import "ADTutorialManager.h"
#import "ADTutorialPageButtonView.h"
#import "ADTextSplitter.h"

#define TutorialListFadeInDuration 0.6
#define TutorialListFadeInSpringDamp 0.7
#define TutorialListFadeInSpringVelocity 0.5
#define TutorialListTextFadeInDuration 0.6
#define TutorialListButtonFadeInDuration 0.4
#define TutorialButtonFadeInDuration 0.2

@interface ADSimpleTutorialViewController : UIViewController
<
UIViewControllerTransitioningDelegate,
ADAnamorphosisBasicViewControllerDelegate,
ADTutorialManagerDelegate,
ADTextSplitterDelegate
>

@property (assign, nonatomic) id delegate;

#pragma mark- TutorialWelcomView
@property (weak, nonatomic) IBOutlet UIView *tutorialWelcomeView;
@property (weak, nonatomic) IBOutlet UIView *bookBGImageView;
@property (weak, nonatomic) IBOutlet UIView *setup2ImageView;
@property (weak, nonatomic) IBOutlet UIView *setup3ImageView;
@property (weak, nonatomic) IBOutlet UIView *setupImageView;
@property (weak, nonatomic) IBOutlet UIView *pickupImageView;
@property (weak, nonatomic) IBOutlet UIView *viewDeviceSrcImageView;
@property (weak, nonatomic) IBOutlet UIView *putDeviceImageView;
@property (weak, nonatomic) IBOutlet UILabel *authorNameLabel;
@property (weak, nonatomic) IBOutlet UILabel *anaDrawWelcomeLabel;
@property (weak, nonatomic) IBOutlet UILabel *whatIsAnaDrawLabel;
@property (weak, nonatomic) IBOutlet UIView *startTutorialButton;
@property (strong, nonatomic) IBOutletCollection(UIView) NSArray *miscViews;


#pragma mark- TutorialListView
@property (weak, nonatomic) IBOutlet UIView *tutorialListView;
@property (weak, nonatomic) IBOutlet UILabel *tutorialListTitleLabel;
@property (weak, nonatomic) IBOutlet UITextView *tutorialListTitleTextView;
@property (weak, nonatomic) IBOutlet UIView *setup3ImageTargetView;
@property (weak, nonatomic) IBOutlet UIView *setupImageTargetView;
@property (weak, nonatomic) IBOutlet UIView *pickupImageTargetView;
@property (weak, nonatomic) IBOutlet UIView *viewDeviceSrcImageTargetView;
@property (weak, nonatomic) IBOutlet UIView *putDeviceImageTargetView;

@property (strong, nonatomic) IBOutletCollection(UIView) NSArray *tutorialButtonGroups;
@property (strong, nonatomic) IBOutletCollection(UIButton) NSArray *tutorialButtons;
@property (strong, nonatomic) IBOutletCollection(UILabel) NSArray *tutorialButtonLabels;
@property (strong, nonatomic) IBOutletCollection(UIView) NSArray *tutorialStatusViews;
@property (strong, nonatomic) IBOutletCollection(UIImageView) NSArray *tutorialImageViews;
@property (strong, nonatomic) IBOutletCollection(UIView) NSArray *tutorialAllViews;
@property (retain, nonatomic) NSMutableArray *tutorialListTextSplitters;
@property (weak, nonatomic) IBOutlet UIButton *tutorialNextButton;

@property (retain, nonatomic) UIButton *selectedButton;

- (IBAction)startTutorialButtonTouchUp:(id)sender;
- (IBAction)tutorialDoneButtonTouchUp:(id)sender;
- (IBAction)tutorialAnamorphosisBasicButtonTouchUp:(id)sender;
- (IBAction)tutorialAnaDrawBasicButtonTouchUp:(id)sender;
- (IBAction)tutorialAdvancedSetupButtonTouchUp:(id)sender;
- (IBAction)tutorialDrawReflectionButtonTouchUp:(id)sender;
- (IBAction)tutorialDrawAnamorphosisButtonTouchUp:(id)sender;
@end

@protocol ADSimpleTutorialViewControllerDelegate
- (void)willTutorialViewControllerDissmiss;
@end
