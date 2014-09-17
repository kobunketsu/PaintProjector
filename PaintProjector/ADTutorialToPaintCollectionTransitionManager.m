//
//  ADTutorialToPaintCollectionTransitionManager.m
//  PaintProjector
//
//  Created by kobunketsu on 9/15/14.
//  Copyright (c) 2014 WenjiHu. All rights reserved.
//

#import "ADTutorialToPaintCollectionTransitionManager.h"
#import "ADSimpleTutorialViewController.h"
#import "ADPaintCollectionViewController.h"
#import "ADCrystalGradientStyleButton.h"

#define TutorialFadeOutDuration 0.6
@interface ADTutorialToPaintCollectionTransitionManager()
@property (assign, nonatomic) CGRect selectedButtonSrcFrame;
@end

@implementation ADTutorialToPaintCollectionTransitionManager

- (NSTimeInterval)transitionDuration:(id<UIViewControllerContextTransitioning>)transitionContext
{
    // transition animation time between grid and stack layout
    return 1.5;
}

- (void)presentingAnimateTransition:(id<UIViewControllerContextTransitioning>)transitionContext{
    UIViewController *toVC = [transitionContext viewControllerForKey:UITransitionContextToViewControllerKey];
    
    ADSimpleTutorialViewController *fromVC = (ADSimpleTutorialViewController*)[transitionContext viewControllerForKey:UITransitionContextFromViewControllerKey];
    
    UIView *containerView = [transitionContext containerView];
    [containerView addSubview:toVC.view];
    [containerView sendSubviewToBack:toVC.view];


    [UIView animateWithDuration:TutorialFadeOutDuration animations:^{
        //fade out other views
        for (ADTextSplitter *textSplitter in fromVC.tutorialListTextSplitters) {
            for (UILabel *label in textSplitter.characters) {
                label.alpha = 0;
            }
        }
        for (UIView *view in fromVC.tutorialAllViews) {
            if ([view isEqual:fromVC.selectedButton]) {
                continue;
            }
            view.alpha = 0;
        }
        

        for (UIView *group in fromVC.tutorialButtonGroups) {
            if ([fromVC.selectedButton.superview isEqual:group]) {
                //slide button to left
                [group setFrameOriginX:-200];
            }
            else{
                //slide other to right
                [group setFrameOriginX:fromVC.view.frame.size.width];
             }
        }
    }completion:^(BOOL finished) {
        self.selectedButtonSrcFrame = fromVC.selectedButton.frame;
        [UIView animateWithDuration:TutorialFadeOutDuration animations:^{
//            //stretch button
            CGRect targetView = [fromVC.view convertRect:fromVC.view.frame toView:fromVC.selectedButton.superview];
            CGRect frame = fromVC.selectedButton.frame;
            frame.origin.y = targetView.origin.y;
            frame.size.height = fromVC.view.frame.size.height;
            fromVC.selectedButton.frame = frame;
            
        }completion:^(BOOL finished) {
            [UIView animateWithDuration:TutorialFadeOutDuration animations:^{
//                //fade out fromVC.view
                fromVC.view.alpha = 0;
            }completion:^(BOOL finished) {
                if ([transitionContext transitionWasCancelled]) {
                }
                else {
                }
                [transitionContext completeTransition:![transitionContext transitionWasCancelled]];
            }];
        }];
    }];
}

- (void)dismissingAnimateTransition:(id<UIViewControllerContextTransitioning>)transitionContext{
    
    ADSimpleTutorialViewController *toVC = (ADSimpleTutorialViewController*)[transitionContext viewControllerForKey:UITransitionContextToViewControllerKey];
    
    UIViewController *fromVC = [transitionContext viewControllerForKey:UITransitionContextFromViewControllerKey];
    
    UIView *containerView = [transitionContext containerView];
    
    [containerView addSubview:toVC.view];
    
//    //add tutorialButton override the screen
    [UIView animateWithDuration:TutorialFadeOutDuration animations:^{
//        //fade in toView.view
        toVC.view.alpha = 1;
    }completion:^(BOOL finished) {
        [UIView animateWithDuration:TutorialFadeOutDuration animations:^{
//            //button shrink to normal
            toVC.selectedButton.frame = self.selectedButtonSrcFrame;
        }completion:^(BOOL finished) {
//            CGRect rect = toVC.selectedButton.frame;
            [UIView animateWithDuration:TutorialFadeOutDuration animations:^{
                //fade in other views
                for (ADTextSplitter *textSplitter in toVC.tutorialListTextSplitters) {
                    for (UILabel *label in textSplitter.characters) {
                        label.alpha = 1;
                    }
                }
                for (UIView *view in toVC.tutorialAllViews) {
                    view.alpha = 1;
                }
                
                //slide other views to normal
                for (UIView *group in toVC.tutorialButtonGroups) {
                    [group setFrameOriginX:0];
                }
            }completion:^(BOOL finished) {

                if ([transitionContext transitionWasCancelled]) {
                    
                }
                else {
                }
                [transitionContext completeTransition:![transitionContext transitionWasCancelled]];
            }];
        }];
    }];
}

- (void)animateTransition:(id<UIViewControllerContextTransitioning>)transitionContext
{
    DebugLog(@"animateTransition");
    if (self.isPresenting) {
        [self presentingAnimateTransition:transitionContext];
    }
    else{
        [self dismissingAnimateTransition:transitionContext];
    }
}
@end
