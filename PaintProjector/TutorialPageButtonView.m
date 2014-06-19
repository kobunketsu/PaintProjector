//
//  TutorialPage1View.m
//  PaintProjector
//
//  Created by 胡 文杰 on 6/15/14.
//  Copyright (c) 2014 WenjiHu. All rights reserved.
//

#import "TutorialPageButtonView.h"
#import "TutorialNextButton.h"
@implementation TutorialPageButtonView

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
    }
    return self;
}

- (void)initWithTutorial:(Tutorial*)tutorial description:(NSString *)desc bgImage:(UIImage *)image{
    [super initWithTutorial:tutorial description:desc bgImage:image];
    
    CGFloat width = 128;CGFloat height = 64; CGFloat offset = 20;
    _nextButton = [[TutorialNextButton alloc]initWithFrame:CGRectMake(self.bounds.size.width - width - offset, self.bounds.size.height - height - offset, width, height)];

    [self addSubview:self.nextButton];
    [self.nextButton setTitle:NSLocalizedString(@"TutorialNext", nil) forState:UIControlStateNormal];
    [self.nextButton addTarget:self action:@selector(nextButtonTouchUp:) forControlEvents:UIControlEventTouchUpInside];
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
    [self.delegate willStepNextImmediate];
}
@end
