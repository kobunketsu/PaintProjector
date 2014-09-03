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
#import "ADTutorialManager.h"

#define PaintFrameMoveAnimationDuration 0.6
#define PaintFrameFadeAnimationDuration 0.3

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
    DebugLogWarn(@"presentingAnimateTransition hiding all paintFrames");
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
        DebugLogWarn(@"presentingAnimateTransition translating transitionImageView to destRect");
        toView.alpha = 1;
        [UIView animateWithDuration:PaintFrameMoveAnimationDuration animations:^{
            [imageView.layer setValue:[NSNumber numberWithFloat:1] forKeyPath:@"transform.scale"];
            imageView.frame = destRect;
        } completion:^(BOOL finished) {
            DebugLogWarn(@"presentingAnimateTransition translating transitionImageView to destRect finished");
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
    
    //将paintFrameView转换到CylinderProject rootView
    UIImageView *transitionImageView = (UIImageView *)[fromVC.view subViewWithTag:100];
    [transitionImageView removeFromSuperview];
    
    //更新scroll位置
    [paintCollectionVC.collectionView selectItemAtIndexPath:indexPath animated:false scrollPosition:UICollectionViewScrollPositionNone];
    [containerView addSubview:toView];
    [containerView addSubview:fromVC.view];
    
    //动画
    DebugLogWarn(@"dismissingAnimateTransition translating transitionImageView to destRect");
//    if ([ADTutorialManager current].isActive) {
//        //如果进入教程模式,将教程首页加到paintCollectionVC的子目录下
//        [[ADTutorialManager current].curTutorial.curStep addToRootView:toView];
//    }
    
    //渐入cylinderProjectView
    toView.alpha = 0;
    [UIView animateWithDuration:0 animations:^{
        //        transitionImageView.frame = destRect;
    } completion:^(BOOL finished) {
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
