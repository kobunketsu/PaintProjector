//
//  TutorialPage1View.m
//  PaintProjector
//
//  Created by 胡 文杰 on 6/15/14.
//  Copyright (c) 2014 WenjiHu. All rights reserved.
//

#import "ADTutorialPageButtonView.h"
#import "ADTutorialStepButton.h"

@implementation ADTutorialPageButtonView

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
    }
    return self;
}

- (void)initWithTutorial:(ADTutorial*)tutorial description:(NSString *)desc bgImage:(UIImage *)image nextButton:(BOOL)nextButton nextButtonName:(NSString*)nextButtonName cancelButton:(BOOL)cancelButton cancelButtonName:(NSString*)cancelButtonName{
    [super initWithTutorial:tutorial description:desc bgImage:image];
    CGFloat width = TutorialNextButtonWidth;CGFloat height = TutorialNextButtonHeight; CGFloat offset = TutorialNextButtonMargin;
    if (nextButton) {
        CGFloat x = MAX(self.bounds.size.width - width - offset, 0);
        CGFloat y = MAX(self.bounds.size.height - height - offset, 0);
        _nextButton = [[ADTutorialStepButton alloc]initWithFrame:CGRectMake(x, y, width, height)];
        
        [self addSubview:self.nextButton];
        [self.nextButton setTitle:NSLocalizedString(@"TutorialNext", nil) forState:UIControlStateNormal];
        [self.nextButton addTarget:self action:@selector(nextButtonTouchUp:) forControlEvents:UIControlEventTouchUpInside];
        [self.nextButton setTitle:nextButtonName forState:UIControlStateNormal];
    }

    if (cancelButton) {
        CGFloat x = MAX(offset, 0);
        CGFloat y = MAX(self.bounds.size.height - height - offset, 0);
        _cancelButton = [[ADTutorialStepButton alloc]initWithFrame:CGRectMake(x, y, height, height)];
        
        [self addSubview:self.cancelButton];
        [self.cancelButton setTitle:NSLocalizedString(@"TutorialCancel", nil) forState:UIControlStateNormal];
        [self.cancelButton addTarget:self action:@selector(cancelButtonTouchUp:) forControlEvents:UIControlEventTouchUpInside];
    }

}
/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect
{
    // Drawing code
}
*/

- (void)nextButtonTouchUp:(UIButton *)sender
{
    [RemoteLog logAction:@"TU_tutorialNextButtonTouchUp" identifier:sender];
    [self.delegate willStepNextImmediate];
}

- (void)cancelButtonTouchUp:(UIButton *)sender
{
    [RemoteLog logAction:@"TU_tutorialCancelButtonTouchUp" identifier:sender];
    [self.delegate willStepCancelImmediate];
}
@end
