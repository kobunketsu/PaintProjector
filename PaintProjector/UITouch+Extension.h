//
//  UITouch+Extension.h
//  PaintProjector
//
//  Created by 文杰 胡 on 2/6/15.
//  Copyright (c) 2015 WenjiHu. All rights reserved.
//

#import <UIKit/UIKit.h>
static char IsPaintTouchKey;
@interface UITouch (Extension)
- (void)setIsPaintTouch:(BOOL)isPaintTouch;
- (BOOL)isPaintTouch;
@end
