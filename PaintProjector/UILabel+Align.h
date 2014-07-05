//
//  UIView+VerticalAlign.h
//  PaintProjector
//
//  Created by 胡 文杰 on 6/13/14.
//  Copyright (c) 2014 WenjiHu. All rights reserved.
//

#import <UIKit/UIKit.h>
static char FrameOriginXKey;
@interface UILabel (VerticalAlign)

- (void)alignTop;
- (void)alignBottom;

- (void)alignTextHorizonCenterWithFontSize:(CGFloat)size;
@end
