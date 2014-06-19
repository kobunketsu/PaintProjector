//
//  TutorialStep.m
//  PaintProjector
//
//  Created by 胡 文杰 on 6/15/14.
//  Copyright (c) 2014 WenjiHu. All rights reserved.
//

#import "TutorialStep.h"



@implementation TutorialStep
- (id)init{
    self = [super init];
    if (self) {
        _indicatorViews = [[NSMutableArray alloc]init];
    }
    return self;
}

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
        [self removeFromRootView];
    }
}

- (void)addToRootView:(UIView *)rootView{
    for (TutorialIndicatorView *view in self.indicatorViews) {
        [rootView addSubview:view];
    }
    if (self.contentView) {
        [rootView addSubview:self.contentView];
    }
}
- (void)removeFromRootView{
    for (TutorialIndicatorView *view in self.indicatorViews) {
        [view removeFromSuperview];
    }
    if (self.contentView) {
        [self.contentView removeFromSuperview];
    }
}

- (void)addIndicatorView:(TutorialIndicatorView*)view{
    [self.indicatorViews addObject:view];
    if (self.indicatorViews.count == 1) {
        self.indicatorView = view;
    }
}
- (void)removeIndicatorView:(TutorialIndicatorView*)view{
    if ([self.indicatorViews containsObject:view]) {
        [self.indicatorViews removeObject:view];
    }

    if (self.indicatorViews.count == 0) {
        self.indicatorView = nil;
    }
}
- (void)removeAllIndicatorViews{
    [self.indicatorViews removeAllObjects];
}
@end
