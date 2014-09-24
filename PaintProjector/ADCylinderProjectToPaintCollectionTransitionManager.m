//
//  CylinderProjectToPaintCollectionTransitionManager.m
//  PaintProjector
//
//  Created by 胡 文杰 on 3/15/14.
//  Copyright (c) 2014 WenjiHu. All rights reserved.
//

#import "ADCylinderProjectToPaintCollectionTransitionManager.h"
#import "ADPaintCollectionViewController.h"
#import "ADPaintCollectionViewCell.h"

#define TempPaintFrameToGalleryTranslateDuration 0.6
#define TempPaintFrameToGalleryFadeOutDuration 0.5

@implementation ADCylinderProjectToPaintCollectionTransitionManager
//动画方法:
//1.显示的图片动画到圆柱体的右侧后，从圆柱体的右侧飞入圆柱体
//2.显示的图片动画直接飞到圆柱体
- (NSTimeInterval)transitionDuration:(id<UIViewControllerContextTransitioning>)transitionContext
{
    // transition animation time between grid and stack layout
    return 1.5;
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
#pragma mark-
- (UIImageView*)getTransitionImageView{
    return nil;
}

- (void)presentingAnimateTransition:(id<UIViewControllerContextTransitioning>)transitionContext{
    UIViewController *toVC = [transitionContext viewControllerForKey:UITransitionContextToViewControllerKey];
    UIViewController *fromVC = [transitionContext viewControllerForKey:UITransitionContextFromViewControllerKey];
    UIView *containerView = [transitionContext containerView];
    
    ADPaintCollectionViewController *paintCollectionVC = (ADPaintCollectionViewController*)toVC;
    UIView *toView = paintCollectionVC.view;
    
    //更新scroll位置
    NSIndexPath *indexPath = [NSIndexPath indexPathForRow:[ADPaintFrameManager curGroup].curPaintIndex inSection:0];

//    [paintCollectionVC.collectionView selectItemAtIndexPath:indexPath animated:false scrollPosition:UICollectionViewScrollPositionCenteredVertically];
    
    //得到转换ImageView
    UIImageView *transitionImageView = [self getTransitionImageView];
    
    //得到新的当前PaintFrameView
    ADPaintCollectionViewCell *cell = (ADPaintCollectionViewCell *)[paintCollectionVC.collectionView cellForItemAtIndexPath:indexPath];
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
    DebugLog(@"presentingAnimateTransition translating transitionImageView to destRect");
    toView.alpha = 0;
    [UIView animateWithDuration:TempPaintFrameToGalleryTranslateDuration animations:^{
        transitionImageView.frame = destRect;
    } completion:^(BOOL finished) {
        //渐入cylinderProjectView
        [UIView animateWithDuration:TempPaintFrameToGalleryFadeOutDuration animations:^{
            toView.alpha = 1;
            fromVC.view.alpha = 0;
            //变换paintCollectionVC的Cell
            for (int i = 0; i < [ADPaintFrameManager curGroup].paintDocs.count; ++i) {
                NSIndexPath *indexPath = [NSIndexPath indexPathForRow:i inSection:0];
                ADPaintCollectionViewCell *cell = (ADPaintCollectionViewCell*)[paintCollectionVC.collectionView cellForItemAtIndexPath:indexPath];
                [cell.paintFrameView.layer setValue:[NSNumber numberWithFloat:1] forKeyPath:@"transform.scale"];
            }
            //渐出transitionImageView
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

- (void)dismissingAnimateTransition:(id<UIViewControllerContextTransitioning>)transitionContext{
}


@end
