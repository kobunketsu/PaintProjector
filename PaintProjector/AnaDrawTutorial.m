//
//  AnaDrawTutorial.m
//  PaintProjector
//
//  Created by 胡 文杰 on 6/17/14.
//  Copyright (c) 2014 WenjiHu. All rights reserved.
//

#import "AnaDrawTutorial.h"
#import "TutorialIndicatorView.h"
#import "TutorialPageButtonView.h"
#import "TutorialPageView.h"

@implementation AnaDrawTutorial
- (TutorialStep *)addActionStep:(NSString *)name description:(NSString*)desc bounds:(CGRect)bounds arrowDirection:(UIPopoverArrowDirection)arrowDirection{

    TutorialStep *step = [self addStep:name];
    TutorialIndicatorView *inidcatorView = [[TutorialIndicatorView alloc]initWithFrame:bounds];
    inidcatorView.arrowDirection = arrowDirection;
    [inidcatorView initWithTutorial:self description:desc bgImage:nil];
    [step addIndicatorView:inidcatorView];
    
    return step;
}

- (TutorialStep *)addPageStep:(NSString *)name description:(NSString*)desc pageBounds:(CGRect)bounds pageImage:(NSString *)imageName withNextButton:(BOOL)withNextButton{
    TutorialStep *step = [self addStep:name];
    if (withNextButton) {
        step.contentView = [[TutorialPageButtonView alloc]initWithFrame:bounds];
    }
    else{
        step.contentView = [[TutorialPageView alloc]initWithFrame:bounds];
    }
    
    [step.contentView initWithTutorial:self description:desc bgImage:[UIImage imageNamed:imageName]];
    return step;
}


@end
