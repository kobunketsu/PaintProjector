//
//  ADTutorialToPaintCollectionTransitionManager.h
//  PaintProjector
//
//  Created by kobunketsu on 9/15/14.
//  Copyright (c) 2014 WenjiHu. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface ADTutorialToPaintCollectionTransitionManager : NSObject
<UIViewControllerAnimatedTransitioning>
@property (assign, nonatomic) BOOL isPresenting;
@end
