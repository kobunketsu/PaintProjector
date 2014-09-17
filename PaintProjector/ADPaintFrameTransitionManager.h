//
//  PaintFrameTransitionManager.h
//  PaintProjector
//
//  Created by 胡 文杰 on 1/28/14.
//  Copyright (c) 2014 WenjiHu. All rights reserved.
//

#import <Foundation/Foundation.h>
#define PaintFrameMoveAnimationDuration 0.6
#define PaintFrameFadeAnimationDuration 0.3
@protocol ADPaintFrameTransitionManagerDelegate <NSObject>
- (CGRect)willGetCylinderMirrorFrame;
@end

@interface ADPaintFrameTransitionManager : NSObject<UIViewControllerAnimatedTransitioning>
@property (assign, nonatomic) id <ADPaintFrameTransitionManagerDelegate> delegate;
@property (assign, nonatomic) BOOL isPresenting;
@end
