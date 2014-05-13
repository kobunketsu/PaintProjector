//
//  PaintUIKitStyle.h
//  PaintProjector
//
//  Created by 胡 文杰 on 3/25/14.
//  Copyright (c) 2014 WenjiHu. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

#define BackgroundLayerClearColorChangedNotification @"BackgroundLayerClearColorChangedNotification"

static UIColor *globalRefelectColor = nil;
@interface PaintUIKitStyle : NSObject
+ (UIColor *)globalRefelectColor;

+ (void)setGlobalRefelectColor:(UIColor *)color;

+ (void)drawCrystalGradientInView:(UIView*)view;
@end
