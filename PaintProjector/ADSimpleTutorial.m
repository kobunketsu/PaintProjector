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

@implementation ADSimpleTutorial
- (ADTutorialStep *)addActionStep:(NSString *)name description:(NSString*)desc bounds:(CGRect)bounds arrowDirection:(UIPopoverArrowDirection)arrowDirection{

    ADTutorialStep *step = [self addStep:name];
    ADTutorialIndicatorView *inidcatorView = [[ADTutorialIndicatorView alloc]initWithFrame:bounds];
    inidcatorView.arrowDirection = arrowDirection;
    [inidcatorView initWithTutorial:self description:desc bgImage:nil];
    [step addIndicatorView:inidcatorView];
    
    return step;
}

- (ADTutorialStep *)addPageStep:(NSString *)name description:(NSString*)desc pageBounds:(CGRect)bounds pageImage:(NSString *)imageName withNextButton:(BOOL)withNextButton{
    ADTutorialStep *step = [self addStep:name];
    if (withNextButton) {
        step.contentView = [[ADTutorialPageButtonView alloc]initWithFrame:bounds];
    }
    else{
        step.contentView = [[ADTutorialPageView alloc]initWithFrame:bounds];
    }
    
    [step.contentView initWithTutorial:self description:desc bgImage:[UIImage imageNamed:imageName]];
    return step;
}


@end
