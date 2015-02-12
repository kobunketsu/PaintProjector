//
//  WacomTouch.m
//  PaintProjector
//
//  Created by 文杰 胡 on 2/10/15.
//  Copyright (c) 2015 WenjiHu. All rights reserved.
//

#import "WacomTouch.h"

@implementation WacomTouch
+ (id)touchFromTrackedTouch:(TrackedTouch *)trackedTouch rawTrackedTouch:(UITouch*)rawTrackedTouch rawTouch:(UITouch*)rawTouch{
    WacomTouch *touch = [[WacomTouch alloc]init];
    touch.trackedTouch = trackedTouch;
    touch.rawTouch = rawTouch;
    
    DebugLogWarn(@"trackedTouch location %@", NSStringFromCGPoint(trackedTouch.currentLocation));
    DebugLogWarn(@"trackedTouch touchlocation %@", NSStringFromCGPoint(trackedTouch.currentTouchLocation));
    return touch;
}

//- (CGPoint)locationInView:(UIView *)view{
//    self.trackedTouch.currentTouchLocation
//}
@end
