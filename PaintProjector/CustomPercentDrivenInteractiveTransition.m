//
//  CustomPercentDrivenInteractiveTransition.m
//  PaintProjector
//
//  Created by 胡 文杰 on 2/11/14.
//  Copyright (c) 2014 WenjiHu. All rights reserved.
//

#import "CustomPercentDrivenInteractiveTransition.h"

@interface CustomPercentDrivenInteractiveTransition()

@end

@implementation CustomPercentDrivenInteractiveTransition

- (id)init{
    self = [super init];
    if (self) {
        _completeThresold = 0.25;
        _interactionEnable = true;
    }
    return self;
}

- (void)updateInteractiveTransition:(CGFloat)percentComplete{
    DebugLogFuncStart(@"updateInteractiveTransition percentComplete:%.2f", percentComplete);
    self.percentComplete = percentComplete;
    
    [self.delegate willUpdatingInteractiveTransition:self];
}

- (void)cancelInteractiveTransition{
    DebugLogFuncStart(@"canceling InteractiveTransition");
    self.interactionEnable = false;

    [self.delegate willCancelInteractiveTransition:self completion:^{
        self.percentComplete = 0;
        self.interactionEnable = true;
        DebugLog(@"interactiveTransition canceled");
    }];
}

- (void)finishInteractiveTransition{
    DebugLogFuncStart(@"finishing InteractiveTransition");
    self.interactionEnable = false;

    [self.delegate willFinishInteractiveTransition:self completion:^{
        self.percentComplete = 1;
        self.interactionEnable = true;
        DebugLog(@"interactiveTransition finished");
    }];
    
}
@end
