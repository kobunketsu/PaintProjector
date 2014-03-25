//
//  IconColorPermeateButton.h
//  PaintProjector
//
//  Created by 胡 文杰 on 3/23/14.
//  Copyright (c) 2014 WenjiHu. All rights reserved.
//

#import "AutoRotateButton.h"

@interface IconColorPermeateButton : AutoRotateButton
-(void)pastPaintCode:(CGContextRef)ctx iconColor:(UIColor*)iconColor;
@end
