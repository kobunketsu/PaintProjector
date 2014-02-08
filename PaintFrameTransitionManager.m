//
//  PaintFrameTransitionManager.m
//  PaintProjector
//
//  Created by 胡 文杰 on 1/28/14.
//  Copyright (c) 2014 WenjiHu. All rights reserved.
//

#import "PaintFrameTransitionManager.h"
#import "PaintCollectionViewController.h"
#import "PaintCollectionViewCell.h"

@implementation PaintFrameTransitionManager
//动画方法:
//1.显示的图片动画到圆柱体的右侧后，从圆柱体的右侧飞入圆柱体
//2.显示的图片动画直接飞到圆柱体

- (NSTimeInterval)transitionDuration:(id<UIViewControllerContextTransitioning>)transitionContext
{
    // transition animation time between grid and stack layout
    return 1.5;
}

-(CGRect)getCylinderMirrorFrame{
    return CGRectMake(311, 300, 145, 145 / 3.0 * 4.0);
}

- (void)presentingAnimateTransition:(id<UIViewControllerContextTransitioning>)transitionContext{
    UIViewController *toVC = [transitionContext viewControllerForKey:UITransitionContextToViewControllerKey];
    UIView *toView = toVC.view;
    UIViewController *fromVC = [transitionContext viewControllerForKey:UITransitionContextFromViewControllerKey];
    
    UIView *containerView = [transitionContext containerView];
    
    //将paintFrameView层级从cell转移根节点
    PaintCollectionViewController *paintCollectionVC = (PaintCollectionViewController*)fromVC;
    UIButton *view = paintCollectionVC.paintFrameManager.curPaintFrameView;
    UIImage *image = [view imageForState:UIControlStateNormal];
    CGRect srcRect = [view convertRect:view.frame toView:containerView];
    //patch:处理奇怪的偏移
    srcRect.origin.x -= 5;
    srcRect.origin.y -= 5;
    
    //得到圆柱体在屏幕上的大小
    CGRect destRect = [self getCylinderMirrorFrame];
    
    UIButton *fromView = [[UIButton alloc]initWithFrame:srcRect];
    [fromView setImage:image forState:UIControlStateNormal];
    [containerView addSubview:toView];
    [containerView insertSubview:fromView aboveSubview:toView];

    //动画
    [UIView animateWithDuration:0.5 animations:^{
        //得到paintFrameView
        paintCollectionVC.collectionView.alpha = 0;
        
        for (int i = 0; i < paintCollectionVC.paintFrameManager.curPaintFrameGroup.paintDocs.count; ++i) {
            NSIndexPath *indexPath = [NSIndexPath indexPathForRow:i inSection:0];
            PaintCollectionViewCell *cell = (PaintCollectionViewCell*)[paintCollectionVC.collectionView cellForItemAtIndexPath:indexPath];
            [cell.paintFrameView.layer setValue:[NSNumber numberWithFloat:0.95] forKeyPath:@"transform.scale"];
        }
    } completion:^(BOOL finished) {
    }];
    
    toView.alpha = 0;
    CGFloat destScale = destRect.size.width / fromView.frame.size.width;
    CGPoint destRectCenter = CGPointMake(destRect.origin.x + destRect.size.width * 0.5, destRect.origin.y + destRect.size.height * 0.5);
    CGFloat offsetX = destRectCenter.x - fromView.center.x;
    CGFloat offsetY = destRectCenter.y - fromView.center.y;

    [UIView animateKeyframesWithDuration:0.8 delay:0 options:UIViewKeyframeAnimationOptionCalculationModeCubic animations:^{
        //移动paintFrameView到cylinder position位置
        //frame animation无效
        CGFloat fakeCloseToScreenScale = 1.1;
        [UIView addKeyframeWithRelativeStartTime:0 relativeDuration:0.4 animations:^{
            CGAffineTransform transform = CGAffineTransformMakeTranslation(offsetX * 0.3, offsetY * 0.3);
            transform = CGAffineTransformScale(transform, fakeCloseToScreenScale, fakeCloseToScreenScale);
            fromView.layer.affineTransform = transform;
        }];
        
        [UIView addKeyframeWithRelativeStartTime:0.4 relativeDuration:0.6 animations:^{
            CGAffineTransform transform = CGAffineTransformMakeTranslation(offsetX, offsetY);
            transform = CGAffineTransformScale(transform, destScale, destScale);
            fromView.layer.affineTransform = transform;
        }];
    } completion:^(BOOL finished) {
        //渐入cylinderProjectView
        [UIView animateWithDuration:0.5 animations:^{
            toView.alpha = 1;
            fromView.alpha = 0;
        }completion:^(BOOL finished) {
            if ([transitionContext transitionWasCancelled]) {
                
            } else {
                // reset from- view to its original state
                [fromView removeFromSuperview];
                fromView.alpha = 1;
                paintCollectionVC.collectionView.alpha = 1;
                [paintCollectionVC.paintFrameManager.curPaintFrameView.layer setValue:[NSNumber numberWithFloat:1] forKeyPath:@"transform.scale"];
            }
            [transitionContext completeTransition:![transitionContext transitionWasCancelled]];
        }];
    }];
}

- (void)dismissingAnimateTransition:(id<UIViewControllerContextTransitioning>)transitionContext{
    
    UIViewController *toVC = [transitionContext viewControllerForKey:UITransitionContextToViewControllerKey];
    UIViewController *fromVC = [transitionContext viewControllerForKey:UITransitionContextFromViewControllerKey];
    UIView *containerView = [transitionContext containerView];
    
    PaintCollectionViewController *paintCollectionVC = (PaintCollectionViewController*)toVC;
    UIView *toView = paintCollectionVC.view;
    
    UIButton *view = paintCollectionVC.paintFrameManager.curPaintFrameView;
    UIImage *image = [view imageForState:UIControlStateNormal];
    
    CGRect destRect = [view convertRect:view.frame toView:toView];
    //patch:处理奇怪的偏移
    destRect.origin.x -= 5;
    destRect.origin.y -= 5;
    
    //得到圆柱体在屏幕上的大小
    CGRect srcRect = [self getCylinderMirrorFrame];
    
    UIButton *fromView = [[UIButton alloc]initWithFrame:srcRect];
    [fromView setImage:image forState:UIControlStateNormal];
    fromView.alpha = 0;
    
    [containerView addSubview:toView];
    [containerView addSubview:fromVC.view];
    [containerView addSubview:fromView];
    
    //动画
    paintCollectionVC.collectionView.alpha = 0;
    CGFloat destScale = destRect.size.width / fromView.frame.size.width;
    CGPoint destRectCenter = CGPointMake(destRect.origin.x + destRect.size.width * 0.5, destRect.origin.y + destRect.size.height * 0.5);
    CGFloat offsetX = destRectCenter.x - fromView.center.x;
    CGFloat offsetY = destRectCenter.y - fromView.center.y;
    
    [UIView animateWithDuration:0.5 animations:^{
        //得到paintFrameView
        fromVC.view.alpha = 0;
        fromView.alpha = 1;
    } completion:^(BOOL finished) {
        [UIView animateKeyframesWithDuration:0.8 delay:0 options:UIViewKeyframeAnimationOptionCalculationModeCubic animations:^{
            //移动paintFrameView到cylinder position位置
            [UIView addKeyframeWithRelativeStartTime:0 relativeDuration:1 animations:^{
                CGAffineTransform transform = CGAffineTransformMakeTranslation(offsetX, offsetY);
                transform = CGAffineTransformScale(transform, destScale, destScale);
                fromView.layer.affineTransform = transform;
            }];
        } completion:^(BOOL finished) {
            //渐入cylinderProjectView
            [UIView animateWithDuration:0.5 animations:^{
                paintCollectionVC.collectionView.alpha = 1;
                
                for (int i = 0; i < paintCollectionVC.paintFrameManager.curPaintFrameGroup.paintDocs.count; ++i) {
                    NSIndexPath *indexPath = [NSIndexPath indexPathForRow:i inSection:0];
                    PaintCollectionViewCell *cell = (PaintCollectionViewCell*)[paintCollectionVC.collectionView cellForItemAtIndexPath:indexPath];
                    [cell.paintFrameView.layer setValue:[NSNumber numberWithFloat:1] forKeyPath:@"transform.scale"];
                }
                
                fromView.alpha = 0;
            }completion:^(BOOL finished) {
                if ([transitionContext transitionWasCancelled]) {
                    
                } else {
                    // reset from- view to its original state
                    [fromView removeFromSuperview];
                    fromView.alpha = 1;
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

//- (void)animationEnded:(BOOL) transitionCompleted{
//    
//}

@end
