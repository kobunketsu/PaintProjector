//
//  AnaDrawTutorial.m
//  PaintProjector
//
//  Created by 胡 文杰 on 6/17/14.
//  Copyright (c) 2014 WenjiHu. All rights reserved.
//

#import "ADSimpleTutorial.h"
#import "ADTutorialIndicatorView.h"
#import "ADTutorialPageButtonView.h"
#import "ADTutorialPageView.h"
#import "ADTutorialStepButton.h"

@implementation ADSimpleTutorial
- (id)init{
    self = [super init];
    if (self) {
        _cancelView = [[ADTutorialPageButtonView alloc]initWithFrame:CGRectMake(0, 0, TutorialNextButtonHeight, TutorialNextButtonHeight)];
        [_cancelView initWithTutorial:self description:nil bgImage:nil nextButton:NO nextButtonName:nil cancelButton:YES cancelButtonName:@"TutorialCancel"];
    }
    return self;
}
- (ADTutorialStep *)addActionStep:(NSString *)name description:(NSString*)desc bounds:(CGRect)bounds arrowDirection:(UIPopoverArrowDirection)arrowDirection cancelable:(BOOL)cancelable{

    ADTutorialStep *step = [self addStep:name];
    ADTutorialIndicatorView *inidcatorView = [[ADTutorialIndicatorView alloc]initWithFrame:bounds];
    inidcatorView.arrowDirection = arrowDirection;
    [inidcatorView initWithTutorial:self description:desc bgImage:nil];
    [step addIndicatorView:inidcatorView];
    
    step.cancelable = cancelable;
    self.cancelView.hidden = !cancelable;
    return step;
}

- (ADTutorialStep *)addPageStep:(NSString *)name description:(NSString*)desc pageBounds:(CGRect)bounds pageImage:(NSString *)imageName nextButton:(BOOL)nextButton nextButtonName:(NSString*)nextButtonName cancelButton:(BOOL)cancelButton cancelButtonName:(NSString*)cancelButtonName{
    ADTutorialStep *step = [self addStep:name];
    if (nextButton || cancelButton) {
        ADTutorialPageButtonView *view = [[ADTutorialPageButtonView alloc]initWithFrame:bounds];
        [view initWithTutorial:self description:desc bgImage:[UIImage imageNamed:imageName] nextButton:nextButton nextButtonName:nextButtonName cancelButton:cancelButton cancelButtonName:cancelButtonName];
        step.contentView = view;
    }
    else{
        step.contentView = [[ADTutorialPageView alloc]initWithFrame:bounds];
        [step.contentView initWithTutorial:self description:desc bgImage:[UIImage imageNamed:imageName]];
    }
    
    return step;
}

- (void)cancel:(id)sender{
    [self cancel];
}

@end
