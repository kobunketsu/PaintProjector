//
//  IBActionReport.m
//  PaintProjector
//
//  Created by 胡 文杰 on 5/28/14.
//  Copyright (c) 2014 WenjiHu. All rights reserved.
//

#import "RemoteLog.h"

@implementation RemoteLog
+ (void)logAction:(NSString *)name identifier:(id)sender{

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
    
#if DEBUG
    DebugLogIBAction(@"%@",name);
#elif TESTFLIGHT
    [TestFlight passCheckpoint:name];
#else
    [Flurry logEvent:name];
#endif
}

+ (void)log:(NSString *)name{
    CLSLog(name, nil);//debug release mode inside
#if TESTFLIGHT
    TFLog(name, nil);
#endif
}
@end
