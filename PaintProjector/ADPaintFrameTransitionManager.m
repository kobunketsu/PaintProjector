//
//  PaintFrameTransitionManager.m
//  PaintProjector
//
//  Created by 胡 文杰 on 1/28/14.
//  Copyright (c) 2014 WenjiHu. All rights reserved.
//

#import "ADPaintFrameTransitionManager.h"
#import "ADPaintCollectionViewController.h"
#import "ADPaintCollectionViewCell.h"

#define PaintFrameMoveAnimationDuration 0.6
#define PaintFrameFadeAnimationDuration 0.3
#define PaintFrameFadeOutScale 0.95

@implementation ADPaintFrameTransitionManager
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
    ADCylinderProjectViewController *cylinderProjectVC = (ADCylinderProjectViewController *)toVC;
    cylinderProjectVC.downToolBar.hidden = true;

    UIView *toView = toVC.view;
    UIViewController *fromVC = [transitionContext viewControllerForKey:UITransitionContextFromViewControllerKey];
    
    UIView *containerView = [transitionContext containerView];
    
    //将paintFrameView层级从cell转移根节点
    ADPaintCollectionViewController *paintCollectionVC = (ADPaintCollectionViewController*)fromVC;
    UIButton *view = paintCollectionVC.curPaintFrameView;
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
        
        for (int i = 0; i < [ADPaintFrameManager curGroup].paintDocs.count; ++i) {
            NSIndexPath *indexPath = [NSIndexPath indexPathForRow:i inSection:0];
            ADPaintCollectionViewCell *cell = (ADPaintCollectionViewCell*)[paintCollectionVC.collectionView cellForItemAtIndexPath:indexPath];
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
                
                //unload paintFrameView
                [paintCollectionVC.curPaintFrameView.layer setValue:[NSNumber numberWithFloat:1] forKeyPath:@"transform.scale"];
                [paintCollectionVC.curPaintFrameView setPaintDoc:nil];
                [paintCollectionVC.curPaintFrameView unloadForDisplay];
                
//                DebugLog(@"paintCollectionVC.curPaintFrameView frame %@", NSStringFromCGRect(paintCollectionVC.curPaintFrameView.frame));
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
    
    ADPaintCollectionViewController *paintCollectionVC = (ADPaintCollectionViewController*)toVC;
    paintCollectionVC.downToolBar.hidden = true;
    UIView *toView = paintCollectionVC.view;
    

    
    NSIndexPath *indexPath = [NSIndexPath indexPathForRow:[ADPaintFrameManager curGroup].curPaintIndex inSection:0];
    DebugLog(@"indexPath row %d", indexPath.row);
    
    paintCollectionVC.pageControl.currentPage = (NSInteger)floorf((float)indexPath.row / (float)paintCollectionVC.numberOfPaintPerPage);
    
    //得到新的当前PaintFrameView
//    PaintCollectionViewCell *cell = (PaintCollectionViewCell *)[paintCollectionVC collectionView:paintCollectionVC.collectionView cellForItemAtIndexPath:indexPath];
    
    //将paintFrameView转换到CylinderProject rootView
    UIImageView *transitionImageView = (UIImageView *)[fromVC.view subViewWithTag:100];
    [transitionImageView removeFromSuperview];
//    UIButton *paintFrameView = cell.paintFrameView;
//    [paintFrameView setImage:transitionImageView.image forState:UIControlStateNormal];

//    CGSize defaultSize = paintCollectionVC.curPaintFrameView.frame.size;
//    CGRect destRect = [paintFrameView convertRect:paintFrameView.frame toView:toView];
//    destRect.size = defaultSize;
    
    //更新scroll位置
//    [paintCollectionVC.collectionView scrollToItemAtIndexPath:indexPath atScrollPosition:UICollectionViewScrollPositionNone animated:false];
    [paintCollectionVC.collectionView selectItemAtIndexPath:indexPath animated:false scrollPosition:UICollectionViewScrollPositionNone];
    
    //patch:处理奇怪的偏移
//    destRect.origin.x -= 15;
//    destRect.origin.y -= 20;

//    DebugLogWarn(@"paintFrameView.frame %@", NSStringFromCGRect(paintFrameView.frame));
//    DebugLogWarn(@"destRect rootView %@", NSStringFromCGRect(destRect));
//    DebugLogWarn(@"contentOffset %@", NSStringFromCGPoint(paintCollectionVC.collectionView.contentOffset));
    
    //解决scroll过paintCollection之后返回位置不对的显示问题
//    if (destRect.origin.y > toView.bounds.size.height) {
//        destRect.origin.x -= paintCollectionVC.collectionView.contentOffset.x;
//        destRect.origin.y -= paintCollectionVC.collectionView.contentOffset.y;
//    }

    [containerView addSubview:toView];
    [containerView addSubview:fromVC.view];
//    [containerView addSubview:transitionImageView];
    
    //动画
    toView.alpha = 0;
    
    [UIView animateWithDuration:0 animations:^{
//        transitionImageView.frame = destRect;
    } completion:^(BOOL finished) {
        //渐入cylinderProjectView
        [UIView animateWithDuration:PaintFrameFadeAnimationDuration animations:^{
            toView.alpha = 1;
            fromVC.view.alpha = 0;
            
            for (int i = 0; i < [ADPaintFrameManager curGroup].paintDocs.count; ++i) {
                NSIndexPath *indexPath = [NSIndexPath indexPathForRow:i inSection:0];
                ADPaintCollectionViewCell *cell = (ADPaintCollectionViewCell*)[paintCollectionVC.collectionView cellForItemAtIndexPath:indexPath];
                [cell.paintFrameView.layer setValue:[NSNumber numberWithFloat:1] forKeyPath:@"transform.scale"];
            }
            
            transitionImageView.alpha = 0;
        }completion:^(BOOL finished) {
            if ([transitionContext transitionWasCancelled]) {
                
            } else {
                // reset from- view to its original state
//                [transitionImageView removeFromSuperview];
//                transitionImageView.alpha = 1;
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
