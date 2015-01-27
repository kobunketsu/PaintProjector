//
//  CylinderProjectToPaintCollectionTransitionManager.h
//  PaintProjector
//
//  Created by 胡 文杰 on 3/15/14.
//  Copyright (c) 2014 WenjiHu. All rights reserved.
//

#import <Foundation/Foundation.h>

@protocol ADCylinderProjectToPaintCollectionTransitionManagerDelegate <NSObject>
- (CGRect)willGetCylinderMirrorFrame;
@end

@interface ADCylinderProjectToPaintCollectionTransitionManager : NSObject<UIViewControllerAnimatedTransitioning>
@property (assign, nonatomic) id <ADCylinderProjectToPaintCollectionTransitionManagerDelegate> delegate;
@property (assign, nonatomic) BOOL isPresenting;
@end
