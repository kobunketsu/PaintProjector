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
#import "UIView+Tag.h"

#define PaintFrameMoveAnimationDuration 0.6
#define PaintFrameFadeAnimationDuration 0.3
#define PaintFrameFadeOutScale 0.95

@implementation PaintFrameTransitionManager
//动画方法:
//1.显示的图片动画到圆柱体的右侧后，从圆柱体的右侧飞入圆柱体
//2.显示的图片动画直接飞到圆柱体

- (NSTimeInterval)transitionDuration:(id<UIViewControllerContextTransitioning>)transitionContext
{
    // transition animation time between grid and stack layout
    return 1.5;
}


- (void)presentingAnimateTransition:(id<UIViewControllerContextTransitioning>)transitionContext{
    UIViewController *toVC = [transitionContext viewControllerForKey:UITransitionContextToViewControllerKey];
    //初始化view controller
    CylinderProjectViewController *cylinderProjectVC = (CylinderProjectViewController *)toVC;
    cylinderProjectVC.downToolBar.hidden = true;

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
    CGRect destRect = [self.delegate willGetCylinderMirrorFrame];
    
    UIImageView *imageView = [[UIImageView alloc]initWithFrame:srcRect];
    imageView.image = image;
    [containerView addSubview:toView];
    [containerView sendSubviewToBack:toView];
    [containerView addSubview:imageView];

    //第一次启动处理launchImageView
    if (!paintCollectionVC.isLaunchTransitioned) {
        [paintCollectionVC.launchImageView removeFromSuperview];
        [containerView addSubview:paintCollectionVC.launchImageView];
    }
    
    //动画隐藏所有paintFrame
    [UIView animateWithDuration:PaintFrameFadeAnimationDuration animations:^{
        paintCollectionVC.view.alpha = 0;
        
        for (int i = 0; i < paintCollectionVC.paintFrameManager.curPaintFrameGroup.paintDocs.count; ++i) {
            NSIndexPath *indexPath = [NSIndexPath indexPathForRow:i inSection:0];
            PaintCollectionViewCell *cell = (PaintCollectionViewCell*)[paintCollectionVC.collectionView cellForItemAtIndexPath:indexPath];
            [cell.paintFrameView.layer setValue:[NSNumber numberWithFloat:PaintFrameFadeOutScale] forKeyPath:@"transform.scale"];
        }
        
        [imageView.layer setValue:[NSNumber numberWithFloat:1.0] forKeyPath:@"transform.scale"];
    } completion:^(BOOL finished) {
        //初始化
        toView.alpha = 1;
        
        [UIView animateWithDuration:PaintFrameMoveAnimationDuration animations:^{
            [imageView.layer setValue:[NSNumber numberWithFloat:1] forKeyPath:@"transform.scale"];
            imageView.frame = destRect;
        } completion:^(BOOL finished) {
       
            //加入转换imageView用来fill containView 消失之后带来的问题
            UIImageView *transitionImageView = [[UIImageView alloc]initWithFrame:destRect];
            transitionImageView.image = imageView.image;
            transitionImageView.tag = 100;
            [toView addSubview:transitionImageView];
            [imageView removeFromSuperview];
            imageView.alpha = 1;
            
            //第一次启动处理launchImageView
            if (!paintCollectionVC.isLaunchTransitioned) {
                [paintCollectionVC.launchImageView removeFromSuperview];
                [toView addSubview:paintCollectionVC.launchImageView];
            }
            
            if ([transitionContext transitionWasCancelled]) {
                
            } else {
                // reset from- view to its original state
                //                [imageView removeFromSuperview];
                //                imageView.alpha = 1;
                paintCollectionVC.view.alpha = 1;
                [paintCollectionVC.paintFrameManager.curPaintFrameView.layer setValue:[NSNumber numberWithFloat:1] forKeyPath:@"transform.scale"];
            }
            [transitionContext completeTransition:![transitionContext transitionWasCancelled]];
            DebugLog(@"transitionContext completed");
            //        }];
        }];
    }];
    

}

- (void)dismissingAnimateTransition:(id<UIViewControllerContextTransitioning>)transitionContext{
    
    UIViewController *toVC = [transitionContext viewControllerForKey:UITransitionContextToViewControllerKey];
    UIViewController *fromVC = [transitionContext viewControllerForKey:UITransitionContextFromViewControllerKey];
    UIView *containerView = [transitionContext containerView];
    
    PaintCollectionViewController *paintCollectionVC = (PaintCollectionViewController*)toVC;
    paintCollectionVC.downToolBar.hidden = true;
    UIView *toView = paintCollectionVC.view;
    
    //更新scroll位置
    NSIndexPath *indexPath = [NSIndexPath indexPathForRow:paintCollectionVC.paintFrameManager.curPaintFrameGroup.curPaintIndex inSection:0];
    [paintCollectionVC.collectionView selectItemAtIndexPath:indexPath animated:false scrollPosition:UICollectionViewScrollPositionCenteredVertically];

    UIImageView *transitionImageView = (UIImageView *)[fromVC.view subViewWithTag:100];
    [transitionImageView removeFromSuperview];
    
    //得到新的当前PaintFrameView
    PaintCollectionViewCell *cell = (PaintCollectionViewCell *)[paintCollectionVC.collectionView cellForItemAtIndexPath:indexPath];
    UIButton *paintFrameView = cell.paintFrameView;
    [paintFrameView setImage:transitionImageView.image forState:UIControlStateNormal];
    CGRect destRect = [paintFrameView convertRect:paintFrameView.frame toView:toView];
    //patch:处理奇怪的偏移
    destRect.origin.x -= 5;
    destRect.origin.y -= 5;
    
    [containerView addSubview:toView];
    [containerView addSubview:fromVC.view];
    [containerView addSubview:transitionImageView];
    
    //动画
    toView.alpha = 0;
    
    [UIView animateWithDuration:PaintFrameMoveAnimationDuration animations:^{
        transitionImageView.frame = destRect;
    } completion:^(BOOL finished) {
        //渐入cylinderProjectView
        [UIView animateWithDuration:PaintFrameFadeAnimationDuration animations:^{
            toView.alpha = 1;
            fromVC.view.alpha = 0;
            
            for (int i = 0; i < paintCollectionVC.paintFrameManager.curPaintFrameGroup.paintDocs.count; ++i) {
                NSIndexPath *indexPath = [NSIndexPath indexPathForRow:i inSection:0];
                PaintCollectionViewCell *cell = (PaintCollectionViewCell*)[paintCollectionVC.collectionView cellForItemAtIndexPath:indexPath];
                [cell.paintFrameView.layer setValue:[NSNumber numberWithFloat:1] forKeyPath:@"transform.scale"];
            }
            
            transitionImageView.alpha = 0;
        }completion:^(BOOL finished) {
            if ([transitionContext transitionWasCancelled]) {
                
            } else {
                // reset from- view to its original state
                [transitionImageView removeFromSuperview];
                transitionImageView.alpha = 1;
            }
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

//- (void)animationEnded:(BOOL) transitionCompleted{
//    
//}

@end
