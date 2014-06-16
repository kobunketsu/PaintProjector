//
//  TutorialStep.m
//  PaintProjector
//
//  Created by 胡 文杰 on 6/15/14.
//  Copyright (c) 2014 WenjiHu. All rights reserved.
//

#import "TutorialStep.h"

@implementation TutorialStep
- (void) start{
    if (self.delegate) {
        //禁止用户可交互操作的UI
        [self.delegate willTutorialEnableUserInteraction:false withStep:self];
        
        //排版
        [self.delegate willTutorialLayoutWithStep:self];
    }
}

- (void)end{
    if (self.delegate) {
        //恢复用户可交互操作的UI
        [self.delegate willTutorialEnableUserInteraction:true withStep:self];
        
        //TODO: anim fade
        [self.contentView removeFromSuperview];
        [self.indicatorView removeFromSuperview];
    }
}

- (void)targetViewFrame:(CGRect)frame{
    if (!self.indicatorView) {
        return;
    }

    CGRect finalFrame = self.indicatorView.frame;
    if (self.indicatorView.arrowDirection == UIPopoverArrowDirectionUp) {
        finalFrame.origin.x = frame.origin.x + frame.size.width * 0.5 - self.indicatorView.bounds.size.width * 0.5;
        finalFrame.origin.y = frame.origin.y + frame.size.height;
    }
    else if (self.indicatorView.arrowDirection == UIPopoverArrowDirectionDown) {
        finalFrame.origin.x = frame.origin.x + frame.size.width * 0.5 - self.indicatorView.bounds.size.width * 0.5;
        finalFrame.origin.y = frame.origin.y - self.indicatorView.bounds.size.height;
    }
    else if (self.indicatorView.arrowDirection == UIPopoverArrowDirectionLeft) {
    }
    else if (self.indicatorView.arrowDirection == UIPopoverArrowDirectionRight) {
    }
    
    self.indicatorView.frame = finalFrame;
}
@end
