//
//  PaintUIKitAnimation.m
//  PaintProjector
//
//  Created by 胡 文杰 on 1/22/14.
//  Copyright (c) 2014 WenjiHu. All rights reserved.
//

#import "ADPaintUIKitAnimation.h"
#import "ADDownToolBar.h"
#import "ADTopToolBar.h"

#define TopDownToolBarFadeAnimationDuration 0.4

@implementation ADPaintUIKitAnimation
+ (void)view:(UIView*)view switchDownToolBarFromView:(ADTopToolBar*)fromView completion: (void (^) (void))block1{
//    DebugLogFuncStart(@"switchDownToolBarFromView");
    [fromView.layer removeAllAnimations];
    
//    fromView.center = CGPointMake(fromView.center.x, view.bounds.size.height - fromView.bounds.size.height * 0.5);
    fromView.hidden = false;
    
    [UIView animateWithDuration:TopDownToolBarFadeAnimationDuration delay:0 options:UIViewAnimationOptionBeginFromCurrentState animations:^{
        fromView.center = CGPointMake(fromView.center.x, view.bounds.size.height + fromView.bounds.size.height * 0.5);
    }completion:^(BOOL finished){//显示TransformBar
//        DebugLogWarn(@"switchDownToolBar completion finished:%i fromView:%@",finished, fromView);

//        fromView.hidden = true;
        
        if (block1) {
            block1();
        }
    }];
}
+ (void)view:(UIView*)view switchDownToolBarToView:(ADTopToolBar*)toView completion: (void (^) (void)) block2{
//    DebugLogFuncStart(@"switchDownToolBarToView");
    [toView.layer removeAllAnimations];
    
//    toView.center = CGPointMake(toView.center.x, view.bounds.size.height + toView.bounds.size.height * 0.5);
    toView.hidden = false;
    
    [UIView animateWithDuration:TopDownToolBarFadeAnimationDuration delay:0 options:UIViewAnimationOptionBeginFromCurrentState animations:^{
        toView.center = CGPointMake(toView.center.x, view.bounds.size.height - toView.bounds.size.height * 0.5);
    }completion:^(BOOL finished){
//        DebugLogWarn(@"switchDownToolBar completion finished:%i toView:%@", finished, toView);
        toView.hidden = false;
        
        if (block2) {
            block2();
        }
    }];
}

+ (void)view:(UIView*)view switchDownToolBarFromView:(ADDownToolBar*)fromView completion: (void (^) (void))block1 toView:(ADDownToolBar*)toView completion: (void (^) (void)) block2{
//    DebugLogFuncStart(@"switchDownToolBar");
    //如果存在另一个相同的动画，则需要等另一个动画结束之后才开始。加上一定延迟
    CGFloat delay = 0;
    
    //立刻归位
    if (fromView) {
        [fromView.layer removeAllAnimations];
    }
    if (toView) {
        [toView.layer removeAllAnimations];
    }
    
    [UIView animateWithDuration:TopDownToolBarFadeAnimationDuration delay:delay options:UIViewAnimationOptionBeginFromCurrentState animations:^{
        if (fromView) {
            fromView.center = CGPointMake(fromView.center.x, view.bounds.size.height + fromView.bounds.size.height * 0.5);
        }
    }completion:^(BOOL finished){//显示TransformBar
//        DebugLogWarn(@"switchDownToolBar completion finished:%i fromView:%@",finished, fromView);
        if (fromView) {
            fromView.hidden = true;
        }

        if (toView) {
            toView.center = CGPointMake(toView.center.x, view.bounds.size.height + toView.bounds.size.height * 0.5);
            toView.hidden = false;
        }
        
        if (block1) {
            block1();
        }

        [UIView animateWithDuration:TopDownToolBarFadeAnimationDuration delay:delay options:UIViewAnimationOptionBeginFromCurrentState animations:^{
            if (toView) {
                toView.center = CGPointMake(toView.center.x, view.bounds.size.height - toView.bounds.size.height * 0.5);
            }
        }completion:^(BOOL finished){
//            DebugLogWarn(@"switchDownToolBar completion finished:%i toView:%@", finished, toView);
            if (block2) {
                block2();
            }
        }];
    }];
}


+ (void)view:(UIView*)view switchTopToolBarFromView:(ADTopToolBar*)fromView completion: (void (^) (void))block1{
//    DebugLogFuncStart(@"switchTopToolBarFromView");
    [fromView.layer removeAllAnimations];
    
    //    fromView.center = CGPointMake(fromView.center.x, view.bounds.size.height - fromView.bounds.size.height * 0.5);
    fromView.hidden = false;
    
    [UIView animateWithDuration:TopDownToolBarFadeAnimationDuration delay:0 options:UIViewAnimationOptionBeginFromCurrentState animations:^{
        fromView.center = CGPointMake(fromView.center.x, -fromView.bounds.size.height * 0.5);
    }completion:^(BOOL finished){//显示TransformBar
//        DebugLogWarn(@"switchDownToolBar completion finished:%i fromView:%@",finished, fromView);
        
        //        fromView.hidden = true;
        
        if (block1) {
            block1();
        }
    }];
}
+ (void)view:(UIView*)view switchTopToolBarToView:(ADTopToolBar*)toView completion: (void (^) (void)) block2{
//    DebugLogFuncStart(@"switchTopToolBarToView");
    [toView.layer removeAllAnimations];
    
    //    toView.center = CGPointMake(toView.center.x, view.bounds.size.height + toView.bounds.size.height * 0.5);
    toView.hidden = false;
    
    [UIView animateWithDuration:TopDownToolBarFadeAnimationDuration delay:0 options:UIViewAnimationOptionBeginFromCurrentState animations:^{
        toView.center = CGPointMake(toView.center.x, toView.bounds.size.height * 0.5);
    }completion:^(BOOL finished){
//        DebugLogWarn(@"switchDownToolBar completion finished:%i toView:%@", finished, toView);
        toView.hidden = false;
        
        if (block2) {
            block2();
        }
    }];
}
+ (void)view:(UIView*)view switchTopToolBarFromView:(ADTopToolBar*)fromView completion: (void (^) (void))block1 toView:(ADTopToolBar*)toView completion: (void (^) (void)) block2{
//    DebugLogFuncStart(@"switchTopToolBar");
    CGFloat delay = 0;
    //立刻归位
    if (fromView) {
        [fromView.layer removeAllAnimations];
    }
    if (toView) {
        [toView.layer removeAllAnimations];
    }

    [UIView animateWithDuration:TopDownToolBarFadeAnimationDuration delay:delay options:UIViewAnimationOptionBeginFromCurrentState animations:^{
        if (fromView) {
            fromView.center = CGPointMake(fromView.center.x, -fromView.bounds.size.height * 0.5);
        }
    }completion:^(BOOL finished){//显示TransformBar
//        DebugLogWarn(@"switchTopToolBar completion finished:%i fromView:%@", finished, fromView);
        if (fromView) {
            fromView.hidden = true;
        }

        if (toView) {
            toView.center = CGPointMake(toView.center.x, -toView.bounds.size.height * 0.5);
            toView.hidden = false;
        }
        
        if (block1) {
            block1();
        }
        
        [UIView animateWithDuration:TopDownToolBarFadeAnimationDuration delay:delay options:UIViewAnimationOptionBeginFromCurrentState animations:^{
            if (toView) {
                toView.center = CGPointMake(toView.center.x, toView.bounds.size.height * 0.5);
            }
        }completion:^(BOOL finished){
//            DebugLogWarn(@"switchTopToolBar completion finished:%i toView:%@", finished, toView);
            if (block2) {
                block2();
            }
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
