//
//  PaintUIKitStyle.h
//  PaintProjector
//
//  Created by 胡 文杰 on 3/25/14.
//  Copyright (c) 2014 WenjiHu. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
#import "ADBarStyleKit.h"

#define BackgroundLayerClearColorChangedNotification @"BackgroundLayerClearColorChangedNotification"

static UIColor *globalRefelectColor = nil;
@interface ADPaintUIKitStyle : NSObject
+ (UIColor *)globalRefelectColor;

+ (void)setGlobalRefelectColor:(UIColor *)color;

+ (void)drawCrystalGradientInView:(UIView*)view;

+ (void)drawCrystalGradientInButton:(UIButton*)button;

+ (CGGradientRef)crystalGradientNormal;

+ (CGGradientRef)crystalGradientHighlighted;

+ (CGFloat)fontCustomSize;
@end
