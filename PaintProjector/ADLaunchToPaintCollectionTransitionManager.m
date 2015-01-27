//
//  ADLaunchToPaintCollectionTransitionManager.m
//  PaintProjector
//
//  Created by kobunketsu on 9/16/14.
//  Copyright (c) 2014 WenjiHu. All rights reserved.
//

#import "ADLaunchToPaintCollectionTransitionManager.h"
#import "ADPaintCollectionViewController.h"
#import "ADLaunchViewController.h"

@implementation ADLaunchToPaintCollectionTransitionManager

- (NSTimeInterval)transitionDuration:(id<UIViewControllerContextTransitioning>)transitionContext
{
    // transition animation time between grid and stack layout
    return PaintFrameMoveAnimationDuration;
}

- (void)presentingAnimateTransition:(id<UIViewControllerContextTransitioning>)transitionContext{
    ADPaintCollectionViewController *toVC = (ADPaintCollectionViewController*)[transitionContext viewControllerForKey:UITransitionContextToViewControllerKey];
    
//    UIViewController *fromVC = [transitionContext viewControllerForKey:UITransitionContextFromViewControllerKey];
    
    UIView *containerView = [transitionContext containerView];
    [containerView addSubview:toVC.view];
    
    toVC.view.alpha = 0;
    
    for (int i = 0; i < [ADPaintFrameManager curGroup].paintDocs.count; ++i) {
        NSIndexPath *indexPath = [NSIndexPath indexPathForRow:i inSection:0];
        ADPaintCollectionViewCell *cell = (ADPaintCollectionViewCell*)[toVC.collectionView cellForItemAtIndexPath:indexPath];
        [cell.paintFrameView.layer setValue:[NSNumber numberWithFloat:PaintFrameFadeOutScale] forKeyPath:@"transform.scale"];
    }
    
    [UIView animateWithDuration:PaintFrameFadeAnimationDuration animations:^{
        toVC.view.alpha = 1;
        
        for (int i = 0; i < [ADPaintFrameManager curGroup].paintDocs.count; ++i) {
            NSIndexPath *indexPath = [NSIndexPath indexPathForRow:i inSection:0];
            ADPaintCollectionViewCell *cell = (ADPaintCollectionViewCell*)[toVC.collectionView cellForItemAtIndexPath:indexPath];
            [cell.paintFrameView.layer setValue:[NSNumber numberWithFloat:1] forKeyPath:@"transform.scale"];
        }
    }completion:^(BOOL finished) {
        if ([transitionContext transitionWasCancelled]) {
        }
        else {
        }
        [transitionContext completeTransition:![transitionContext transitionWasCancelled]];
    }];
}

- (void)dismissingAnimateTransition:(id<UIViewControllerContextTransitioning>)transitionContext{
    
//    ADSimpleTutorialViewController *toVC = (ADSimpleTutorialViewController*)[transitionContext viewControllerForKey:UITransitionContextToViewControllerKey];
//    
//    UIViewController *fromVC = [transitionContext viewControllerForKey:UITransitionContextFromViewControllerKey];
//    
//    UIView *containerView = [transitionContext containerView];
    if ([transitionContext transitionWasCancelled]) {
        
    }
    else {
    }
    [transitionContext completeTransition:![transitionContext transitionWasCancelled]];
    
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
