//
//  WacomTouch.m
//  PaintProjector
//
//  Created by 文杰 胡 on 2/10/15.
//  Copyright (c) 2015 WenjiHu. All rights reserved.
//

#import "WacomTouch.h"

@implementation WacomTouch
+ (id)touchFromTrackedTouch:(TrackedTouch *)trackedTouch{
    WacomTouch *touch = [[WacomTouch alloc]init];
    touch.trackedTouch = trackedTouch;
    return touch;
}

//- (CGPoint)locationInView:(UIView *)view{
//    self.trackedTouch.currentTouchLocation
//}
@end
