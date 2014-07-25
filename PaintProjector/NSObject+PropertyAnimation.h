//
//  NSObject+PropertyAnimation.h
//  PaintProjector
//
//  Created by 胡 文杰 on 7/25/14.
//  Copyright (c) 2014 WenjiHu. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "REAnimation.h"
#import "REPropertyAnimation.h"

@interface NSObject (PropertyAnimation)
- (void)animationToTarget:(id)target params:(NSMutableDictionary*)params duration:(CGFloat)duration timing:(REPropertyAnimationTiming)timing completionDelegate:(id)delegate completionBlock:(void (^) (void))block;
@end
