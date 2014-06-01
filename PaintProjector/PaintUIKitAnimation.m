//
//  PaintUIKitAnimation.m
//  PaintProjector
//
//  Created by 胡 文杰 on 1/22/14.
//  Copyright (c) 2014 WenjiHu. All rights reserved.
//

#import "PaintUIKitAnimation.h"
#import "DownToolBar.h"
#import "TopToolBar.h"

#define TopDownToolBarFadeAnimationDuration 0.3

@implementation PaintUIKitAnimation

+ (void)view:(UIView*)view switchDownToolBarFromView:(DownToolBar*)fromView completion: (void (^) (void))block1 toView:(DownToolBar*)toView completion: (void (^) (void)) block2{
    DebugLogFuncStart(@"switchDownToolBarFromView fromView:%@ toView:%@", fromView, toView);
    //如果存在另一个相同的动画，则需要等另一个动画结束之后才开始。加上一定延迟
    CGFloat delay = 0;
    
    [UIView animateWithDuration:TopDownToolBarFadeAnimationDuration delay:delay options:UIViewAnimationOptionCurveEaseInOut animations:^{
        if (fromView) {
            fromView.center = CGPointMake(fromView.center.x, view.bounds.size.height + fromView.bounds.size.height * 0.5);
        }
    }completion:^(BOOL finished){//显示TransformBar
        DebugLog(@"switchDownToolBar completion fromView:%@", fromView);
        if (fromView) {
            fromView.hidden = true;
        }

        if (toView) {
//            [toView removeFuzzyTransparent];
//            toView.hidden = true;
            toView.center = CGPointMake(toView.center.x, view.bounds.size.height + toView.bounds.size.height * 0.5);
            toView.hidden = false;
        }
        
        if (block1) {
            block1();
        }
        
        [UIView animateWithDuration:TopDownToolBarFadeAnimationDuration animations:^{
            if (toView) {
                toView.center = CGPointMake(toView.center.x, view.bounds.size.height - toView.bounds.size.height * 0.5);
            }
        }completion:^(BOOL finished){
            DebugLog(@"switchDownToolBar completion toView:%@", toView);
            if (block2) {
                block2();
            }
//            [toView setFuzzyTransparentSourceView:view];
        }];
    }];
}

+ (void)view:(UIView*)view switchTopToolBarFromView:(TopToolBar*)fromView completion: (void (^) (void))block1 toView:(TopToolBar*)toView completion: (void (^) (void)) block2{
    DebugLogFuncStart(@"switchTopToolBarFromView fromView:%@ toView:%@", fromView, toView);
    CGFloat delay = 0;
    
    [UIView animateWithDuration:TopDownToolBarFadeAnimationDuration delay:delay options:UIViewAnimationOptionCurveEaseInOut animations:^{
        if (fromView) {
            fromView.center = CGPointMake(fromView.center.x, -fromView.bounds.size.height * 0.5);
        }
    }completion:^(BOOL finished){//显示TransformBar
        DebugLog(@"switchTopToolBar completion fromView:%@", fromView);
        if (fromView) {
            fromView.hidden = true;
        }

        if (toView) {
//            [toView removeFuzzyTransparent];
//            toView.hidden = true;
            toView.center = CGPointMake(toView.center.x, -toView.bounds.size.height * 0.5);
            toView.hidden = false;
        }
        
        if (block1) {
            block1();
        }
        
        [UIView animateWithDuration:TopDownToolBarFadeAnimationDuration animations:^{
            if (toView) {
                toView.center = CGPointMake(toView.center.x, toView.bounds.size.height * 0.5);
            }
        }completion:^(BOOL finished){
            DebugLog(@"switchTopToolBar completion toView:%@", toView);
            if (block2) {
                block2();
            }
//            [toView setFuzzyTransparentSourceView:view];
        }];
        
    }];
}

+ (void)view:(UIView*)view slideToolBarRightDirection:(BOOL)right outView:(UIView*)outView inView:(UIView*)inView completion: (void (^) (void)) block1{
    //移出View的最终状态
    CGRect outFrameTarget = outView.frame;
    if (right) {
        outFrameTarget.origin.x += view.frame.size.width;
    }
    else{
        outFrameTarget.origin.x -= view.frame.size.width;
    }
    
    //移入View的最终状态
    CGRect inFrameTarget = outView.frame;
    
    //移出View的初始状态
    outView.hidden = false;
    
    //移入View的初始状态
    CGRect inFrameSrc = outView.frame;
    if (right) {
        inFrameSrc.origin.x -= view.frame.size.width;
    }
    else{
        inFrameSrc.origin.x += view.frame.size.width;
    }
    inView.frame = inFrameSrc;
    inView.hidden = false;
    
    //开始动画
    [UIView animateWithDuration:TopDownToolBarFadeAnimationDuration animations:^{
        inView.frame = inFrameTarget;
        outView.frame = outFrameTarget;
    } completion:^(BOOL finished) {
        outView.hidden = true;
        block1();
    }];
}
@end
