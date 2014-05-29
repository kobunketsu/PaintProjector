//
//  IBActionReport.m
//  PaintProjector
//
//  Created by 胡 文杰 on 5/28/14.
//  Copyright (c) 2014 WenjiHu. All rights reserved.
//

#import "IBActionReport.h"

@implementation IBActionReport
+ (void)logAction:(NSString *)name identifier:(id)sender{
#if DEBUG
//    DebugLogIBAction(name,nil);
#endif
    
    if ([sender isKindOfClass:[UISlider class]]) {
        return;
    }
    else if ([sender isKindOfClass:[UIGestureRecognizer class]]) {
        if ([sender isKindOfClass:[UIPanGestureRecognizer class]]) {
            return;
        }
        UIGestureRecognizer *gesture = (UIGestureRecognizer *)sender;
        if (gesture.state != UIGestureRecognizerStateEnded){
            return;
        }
    }
    
    [Flurry logEvent:name];
    [TestFlight passCheckpoint:name];
}

+ (void)logCrash:(NSString *)name{
    CLSLog(name, nil);
    TFLog(name, nil);
}
@end
