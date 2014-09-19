//
//  AppDelegate.h
//  PaintProjector
//
//  Created by 胡 文杰 on 09/02/2012.
//  Copyright (c) 2012 Hu Wenjie. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ADSimpleTutorialManager.h"

#define TutorialGrid 64

@interface AppDelegate : UIResponder
<UIApplicationDelegate,
ADTutorialManagerDelegate>

@property (strong, nonatomic) UIWindow *window;
- (void)initTutorialManager;
- (void)destoryTutorialManager;
//- (void)addHelpStepWithTutorial:(ADSimpleTutorial*)tutorial;
//- (void)willTutorialEnd:(ADTutorial *)tutorial;
- (void)copyCollectionFromMainBundleToUserDocument;
@end
