//
//  PaintScreenTransitionManager.m
//  PaintProjector
//
//  Created by kobunketsu on 14-2-8.
//  Copyright (c) 2014年 WenjiHu. All rights reserved.
//

#import "PaintScreenTransitionManager.h"
#import "PaintScreen.h"

@implementation PaintScreenTransitionManager

- (NSTimeInterval)transitionDuration:(id<UIViewControllerContextTransitioning>)transitionContext
{
    // transition animation time between grid and stack layout
    return 1.5;
}

- (void)presentingAnimateTransition:(id<UIViewControllerContextTransitioning>)transitionContext{
    UIViewController *toVC = [transitionContext viewControllerForKey:UITransitionContextToViewControllerKey];
    UIView *toView = toVC.view;
    UIViewController *fromVC = [transitionContext viewControllerForKey:UITransitionContextFromViewControllerKey];
    UIView *fromView = fromVC.view;
    UIView *containerView = [transitionContext containerView];
    
    [containerView addSubview:toView];
    [containerView sendSubviewToBack:toView];
    
    CGRect rect = CGRectMake(315, 333, 140, 186);
    CGPoint center = CGPointMake(rect.origin.x + rect.size.width * 0.5, rect.origin.y + rect.size.height * 0.5);
    
    fromView.layer.anchorPoint = CGPointMake(center.x / fromView.bounds.size.width, center.y / fromView.bounds.size.height);
    fromView.layer.position = center;
    float scale = fromView.bounds.size.width / rect.size.width;
    
    [UIView animateKeyframesWithDuration:0.8 delay:0 options:UIViewKeyframeAnimationOptionCalculationModeCubic animations:^{
        
        [fromView.layer setValue:[NSNumber numberWithFloat:scale] forKeyPath:@"transform.scale"];
        
    } completion:^(BOOL finished) {
        //渐入cylinderProjectView
        [UIView animateWithDuration:0.5 animations:^{

        }completion:^(BOOL finished) {
            if ([transitionContext transitionWasCancelled]) {
                
            } else {

            }
            [transitionContext completeTransition:![transitionContext transitionWasCancelled]];
        }];
    }];
}


- (void)dismissingAnimateTransition:(id<UIViewControllerContextTransitioning>)transitionContext{
    
    UIViewController *toVC = [transitionContext viewControllerForKey:UITransitionContextToViewControllerKey];
    UIViewController *fromVC = [transitionContext viewControllerForKey:UITransitionContextFromViewControllerKey];
    UIView *containerView = [transitionContext containerView];
    
    PaintScreen *paintScreenVC = (PaintScreen*)toVC;
    UIView *toView = paintScreenVC.view;
    
  
    [UIView animateWithDuration:0.5 animations:^{

    } completion:^(BOOL finished) {
        [UIView animateKeyframesWithDuration:0.8 delay:0 options:UIViewKeyframeAnimationOptionCalculationModeCubic animations:^{

        } completion:^(BOOL finished) {
            
            [transitionContext completeTransition:![transitionContext transitionWasCancelled]];
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
