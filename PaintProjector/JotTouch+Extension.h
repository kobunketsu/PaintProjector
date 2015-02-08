//
//  JotTouch+Extension.h
//  PaintProjector
//
//  Created by 文杰 胡 on 2/6/15.
//  Copyright (c) 2015 WenjiHu. All rights reserved.
//

#import <JotTouchSDK/JotTouchSDK.h>
static char IsPaintTouchKey;
static char PreLocationKey;
@interface JotTouch (Extension)
- (void)setIsPaintTouch:(BOOL)isPaintTouch;
- (BOOL)isPaintTouch;

- (void)setPreLocation:(CGRect)location;
- (CGRect)preLocation;
@end
