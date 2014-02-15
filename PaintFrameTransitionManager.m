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

    //动画隐藏所有paintFrame
//    paintCollectionVC.view.alpha = 0;
    [UIView animateWithDuration:0.5 animations:^{
        paintCollectionVC.view.alpha = 0;
        
        for (int i = 0; i < paintCollectionVC.paintFrameManager.curPaintFrameGroup.paintDocs.count; ++i) {
            NSIndexPath *indexPath = [NSIndexPath indexPathForRow:i inSection:0];
            PaintCollectionViewCell *cell = (PaintCollectionViewCell*)[paintCollectionVC.collectionView cellForItemAtIndexPath:indexPath];
            [cell.paintFrameView.layer setValue:[NSNumber numberWithFloat:0.95] forKeyPath:@"transform.scale"];
        }
        
        [imageView.layer setValue:[NSNumber numberWithFloat:1.1] forKeyPath:@"transform.scale"];
    } completion:^(BOOL finished) {
        //初始化
        toView.alpha = 1;
//        CGFloat destScale = destRect.size.width / imageView.frame.size.width;
//        CGPoint destRectCenter = CGPointMake(destRect.origin.x + destRect.size.width * 0.5, destRect.origin.y + destRect.size.height * 0.5);
//        CGFloat offsetX = destRectCenter.x - imageView.center.x;
//        CGFloat offsetY = destRectCenter.y - imageView.center.y;
        
//        [UIView animateKeyframesWithDuration:0.8 delay:0 options:UIViewKeyframeAnimationOptionCalculationModeCubic animations:^{
//            //移动paintFrameView到cylinder position位置
//            //frame animation无效
//            CGFloat fakeCloseToScreenScale = 1.1;
//            [UIView addKeyframeWithRelativeStartTime:0 relativeDuration:0.4 animations:^{
//                CGAffineTransform transform = CGAffineTransformMakeTranslation(offsetX * 0.3, offsetY * 0.3);
//                transform = CGAffineTransformScale(transform, fakeCloseToScreenScale, fakeCloseToScreenScale);
//                imageView.layer.affineTransform = transform;
//            }];
//            
//            [UIView addKeyframeWithRelativeStartTime:0.4 relativeDuration:0.6 animations:^{
//                CGAffineTransform transform = CGAffineTransformMakeTranslation(offsetX, offsetY);
//                transform = CGAffineTransformScale(transform, destScale, destScale);
//                imageView.layer.affineTransform = transform;
//            }];
        
        [UIView animateWithDuration:0.6 animations:^{
//            CGAffineTransform transform = CGAffineTransformMakeTranslation(offsetX, offsetY);
//            transform = CGAffineTransformScale(transform, destScale, destScale);
//            imageView.layer.affineTransform = transform;
            [imageView.layer setValue:[NSNumber numberWithFloat:1] forKeyPath:@"transform.scale"];
            imageView.frame = destRect;
        } completion:^(BOOL finished) {
            //加入临时imageView用来fill containView 消失之后带来的问题
            UIImageView *tempImageView = [[UIImageView alloc]initWithFrame:destRect];
            tempImageView.image = imageView.image;
            tempImageView.tag = 100;
            [toView addSubview:tempImageView];
            [imageView removeFromSuperview];
            imageView.alpha = 1;
            
            //渐入cylinderProjectView
            //        [UIView animateWithDuration:0 animations:^{
            //            toView.alpha = 1;
            //            imageView.alpha = 0;
            //        }completion:^(BOOL finished) {
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
    UIView *toView = paintCollectionVC.view;
    
    //更新scroll位置
    NSIndexPath *indexPath = [NSIndexPath indexPathForRow:paintCollectionVC.paintFrameManager.curPaintFrameGroup.curPaintIndex inSection:0];
    [paintCollectionVC.collectionView selectItemAtIndexPath:indexPath animated:false scrollPosition:UICollectionViewScrollPositionCenteredVertically];

    ImageView *tempImageView = (ImageView *)[fromVC.view subViewWithTag:100];
    [tempImageView removeFromSuperview];
    
    //得到新的当前PaintFrameView
    PaintCollectionViewCell *cell = (PaintCollectionViewCell *)[paintCollectionVC.collectionView cellForItemAtIndexPath:indexPath];
    UIButton *paintFrameView = cell.paintFrameView;
    [paintFrameView setImage:tempImageView.image forState:UIControlStateNormal];
    CGRect destRect = [paintFrameView convertRect:paintFrameView.frame toView:toView];
    //patch:处理奇怪的偏移
    destRect.origin.x -= 5;
    destRect.origin.y -= 5;
    
    //得到圆柱体在屏幕上的大小
//    CGRect srcRect = [self.delegate willGetCylinderMirrorFrame];
//    UIButton *imageView = [[UIButton alloc]initWithFrame:srcRect];
//    [imageView setImage:image forState:UIControlStateNormal];
//    imageView.alpha = 1;
    

    
    [containerView addSubview:toView];
    [containerView addSubview:fromVC.view];
    [containerView addSubview:tempImageView];
    
    //动画
    toView.alpha = 0;
//    paintCollectionVC.collectionView.alpha = 0;
//    CGFloat destScale = destRect.size.width / imageView.frame.size.width;
//    CGPoint destRectCenter = CGPointMake(destRect.origin.x + destRect.size.width * 0.5, destRect.origin.y + destRect.size.height * 0.5);
//    CGFloat offsetX = destRectCenter.x - imageView.center.x;
//    CGFloat offsetY = destRectCenter.y - imageView.center.y;
    
    [UIView animateWithDuration:0 animations:^{
        //得到paintFrameView
//        toView.alpha = 1;
//        imageView.alpha = 1;
        
    } completion:^(BOOL finished) {
//        [UIView animateKeyframesWithDuration:0.8 delay:0 options:UIViewKeyframeAnimationOptionCalculationModeCubic animations:^{
//            //移动paintFrameView到cylinder position位置
//            [UIView addKeyframeWithRelativeStartTime:0 relativeDuration:1 animations:^{
//                CGAffineTransform transform = CGAffineTransformMakeTranslation(offsetX, offsetY);
//                transform = CGAffineTransformScale(transform, destScale, destScale);
//                imageView.layer.affineTransform = transform;
//            }];
        [UIView animateWithDuration:0.6 animations:^{
            tempImageView.frame = destRect;
        } completion:^(BOOL finished) {
            //渐入cylinderProjectView
            [UIView animateWithDuration:0.5 animations:^{
                toView.alpha = 1;
                fromVC.view.alpha = 0;
//                paintCollectionVC.collectionView.alpha = 1;
                
                for (int i = 0; i < paintCollectionVC.paintFrameManager.curPaintFrameGroup.paintDocs.count; ++i) {
                    NSIndexPath *indexPath = [NSIndexPath indexPathForRow:i inSection:0];
                    PaintCollectionViewCell *cell = (PaintCollectionViewCell*)[paintCollectionVC.collectionView cellForItemAtIndexPath:indexPath];
                    [cell.paintFrameView.layer setValue:[NSNumber numberWithFloat:1] forKeyPath:@"transform.scale"];
                }
                
                tempImageView.alpha = 0;
            }completion:^(BOOL finished) {
                if ([transitionContext transitionWasCancelled]) {
                    
                } else {
                    // reset from- view to its original state
                    [tempImageView removeFromSuperview];
                    tempImageView.alpha = 1;
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
