//
//  PaintScreenTransitionManager.m
//  PaintProjector
//
//  Created by kobunketsu on 14-2-8.
//  Copyright (c) 2014年 WenjiHu. All rights reserved.
//

#import "PaintScreenTransitionManager.h"
#import "PaintScreen.h"
#import "CylinderProjectViewController.h"
#import "UIView+Tag.h"
@interface PaintScreenTransitionManager()
@property (assign, nonatomic) CGFloat scale;
@end
@implementation PaintScreenTransitionManager

- (NSTimeInterval)transitionDuration:(id<UIViewControllerContextTransitioning>)transitionContext
{
    // transition animation time between grid and stack layout
    return 1.5;
}

- (void)presentingAnimateTransition:(id<UIViewControllerContextTransitioning>)transitionContext{
    CylinderProjectViewController *fromVC = (CylinderProjectViewController *)[transitionContext viewControllerForKey:UITransitionContextFromViewControllerKey];
    UIView *fromView = fromVC.view;
    
    [transitionContext completeTransition:![transitionContext transitionWasCancelled]];
    [fromView.layer setValue:[NSNumber numberWithFloat:1] forKeyPath:@"transform.scale"];
}

//- (void)presentingAnimateTransition:(id<UIViewControllerContextTransitioning>)transitionContext{
//    
//    PaintScreen *toVC = (PaintScreen *)[transitionContext viewControllerForKey:UITransitionContextToViewControllerKey];
//    UIView *toView = toVC.view;
//    
//    CylinderProjectViewController *fromVC = (CylinderProjectViewController *)[transitionContext viewControllerForKey:UITransitionContextFromViewControllerKey];
//    UIView *fromView = fromVC.view;
//    
//    //获得圆柱体的位置和图片
//    CGRect rect = [self.delegate willGetCylinderMirrorFrame];
//    UIImageView *tempImageView = (UIImageView *)[fromVC.view subViewWithTag:100];
//
//    //加入图片view到变换容器view
//    UIView *containerView = [transitionContext containerView];
//    [tempImageView removeFromSuperview];
//    [containerView addSubview:tempImageView];
//    
//    //确定fromView的锚点，和放大缩小的尺寸
//    self.scale = fromView.frame.size.width / rect.size.width;
//    CGPoint rectCenter = CGPointMake(rect.origin.x + rect.size.width * 0.5, rect.origin.y + rect.size.height * 0.5);
//    rectCenter = CGPointMake(rectCenter.x, rectCenter.y - 25);
//    fromView.layer.anchorPoint = CGPointMake(rectCenter.x / fromView.frame.size.width, rectCenter.y / fromView.frame.size.height);
//    fromView.layer.position = rectCenter;
//    
//    
//    [UIView animateWithDuration:0.8 animations:^{
//        //底和图片一起放大
//        tempImageView.frame = toView.frame;
//        [fromView.layer setValue:[NSNumber numberWithFloat:self.scale] forKeyPath:@"transform.scale"];
//    } completion:^(BOOL finished) {
//        if ([transitionContext transitionWasCancelled]) {
//            
//        } else {
//            [tempImageView removeFromSuperview];
//            [fromView addSubview:tempImageView];
//        }
//        
//        [transitionContext completeTransition:![transitionContext transitionWasCancelled]];
//        [fromView.layer setValue:[NSNumber numberWithFloat:1] forKeyPath:@"transform.scale"];
//        DebugLog(@"transitionContext completed");
//        
//    }];
//}

- (void)dismissingAnimateTransition:(id<UIViewControllerContextTransitioning>)transitionContext{
    [transitionContext completeTransition:![transitionContext transitionWasCancelled]];
}

//- (void)dismissingAnimateTransition:(id<UIViewControllerContextTransitioning>)transitionContext{
//    
//    CylinderProjectViewController *toVC = (CylinderProjectViewController *)[transitionContext viewControllerForKey:UITransitionContextToViewControllerKey];
//    UIView *toView = toVC.view;
//    
//    NSNumber *num = [toView.layer valueForKeyPath:@"transform.scale"];
//    DebugLog(@"scale %.1f", num.floatValue);
//    DebugLog(@"anchorPoint %@", NSStringFromCGPoint(toView.layer.anchorPoint));
//
//    
//    PaintScreen *fromVC = (PaintScreen *)[transitionContext viewControllerForKey:UITransitionContextFromViewControllerKey];
//    UIView *fromView = fromVC.view;
//    
//    //获得圆柱体的位置和图片
//    CGRect rect = [self.delegate willGetCylinderMirrorFrame];
//    UIImageView *tempImageView = [[UIImageView alloc]initWithFrame:fromView.frame];
//
//    NSString *thumbImagePath = [[Ultility applicationDocumentDirectory] stringByAppendingPathComponent:fromVC.paintDoc.thumbImagePath];
//    tempImageView.image = [UIImage imageWithContentsOfFile:thumbImagePath];
//    
//    //加入图片view到变换容器view
//    UIView *containerView = [transitionContext containerView];
//    
//    [containerView addSubview:tempImageView];
//    [containerView addSubview:toView];
//    [containerView sendSubviewToBack:toView];
//    
//    //初始化变换开始大小
//    fromView.alpha = 0;
//    tempImageView.alpha = 1;
//    [toView.layer setValue:[NSNumber numberWithFloat:self.scale] forKeyPath:@"transform.scale"];
//    
//    //变换动画
//    [UIView animateWithDuration:0.5 animations:^{
//        tempImageView.alpha = 0;
//    }completion:^(BOOL finished) {
//    }];
//    
//    [UIView animateWithDuration:0.8 animations:^{
//        tempImageView.frame = rect;
//        [toView.layer setValue:[NSNumber numberWithFloat:1] forKeyPath:@"transform.scale"];
//    } completion:^(BOOL finished) {
//        //打开从paintCollectionVC transition 时添加的view
////        UIView *tempView = [toView subViewWithTag:100];
////        if (tempView) {
////            tempView.alpha = 1;
////        }
//
//        if ([transitionContext transitionWasCancelled]) {
//            
//        } else {
//            [toView removeFromSuperview];
//            [tempImageView removeFromSuperview];
//        }
//        
//        [transitionContext completeTransition:![transitionContext transitionWasCancelled]];
//        DebugLog(@"transitionContext completed");
//
//    }];
//
//}

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
