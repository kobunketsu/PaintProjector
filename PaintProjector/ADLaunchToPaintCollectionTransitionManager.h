//
//  ADLaunchToPaintCollectionTransitionManager.h
//  PaintProjector
//
//  Created by kobunketsu on 9/16/14.
//  Copyright (c) 2014 WenjiHu. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ADLaunchToPaintCollectionTransitionManager : NSObject
<UIViewControllerAnimatedTransitioning>
@property (assign, nonatomic) BOOL isPresenting;
@end
