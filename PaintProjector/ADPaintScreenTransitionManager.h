//
//  PaintScreenTransitionManager.h
//  PaintProjector
//
//  Created by kobunketsu on 14-2-8.
//  Copyright (c) 2014年 WenjiHu. All rights reserved.
//

#import <Foundation/Foundation.h>

@protocol ADPaintScreenTransitionManagerDelegate <NSObject>
- (CGRect)willGetCylinderMirrorFrame;
@end

@interface ADPaintScreenTransitionManager : NSObject
<UIViewControllerAnimatedTransitioning>
@property (assign, nonatomic) id <ADPaintScreenTransitionManagerDelegate> delegate;
@property (assign, nonatomic) BOOL isPresenting;

@end
