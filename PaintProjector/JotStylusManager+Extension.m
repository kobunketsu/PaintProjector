//
//  JotStylusManager+Extension.m
//  PaintProjector
//
//  Created by 文杰 胡 on 2/8/15.
//  Copyright (c) 2015 WenjiHu. All rights reserved.
//

#import "JotStylusManager+Extension.h"

@implementation JotStylusManager (Extension)
-(BOOL)isJotStylusActiveTouching:(NSSet*)touches{
    if (![JotStylusManager sharedInstance].isStylusConnected) {
        return false;
    }
    
    for (UITouch *touch in touches) {
        if ([touch isKindOfClass:[JotTouch class]]) {
            if (((JotTouch*)touch).pressure > [JotStylusManager sharedInstance].unconnectedPressure) {
                return true;
            }
        }
    }
    
    return false;
}
@end
