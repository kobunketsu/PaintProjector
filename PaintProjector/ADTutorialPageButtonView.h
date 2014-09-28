//
//  TutorialPage1View.h
//  PaintProjector
//
//  Created by 胡 文杰 on 6/15/14.
//  Copyright (c) 2014 WenjiHu. All rights reserved.
//

#import "ADTutorialPageView.h"

#define TutorialNextButtonWidth 150
#define TutorialNextButtonHeight 64
#define TutorialNextButtonMargin 25

@interface ADTutorialPageButtonView : ADTutorialPageView
//进入下一步的按钮
@property (retain, nonatomic) UIButton *nextButton;
@property (retain, nonatomic) UIButton *cancelButton;
- (void)initWithTutorial:(ADTutorial*)tutorial description:(NSString *)desc bgImage:(UIImage *)image nextButton:(BOOL)nextButton nextButtonName:(NSString*)nextButtonName cancelButton:(BOOL)cancelButton cancelButtonName:(NSString*)cancelButtonName;
@end
