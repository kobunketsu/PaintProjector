//
//  Display.h
//  PaintProjector
//
//  Created by 胡 文杰 on 2/4/14.
//  Copyright (c) 2014 WenjiHu. All rights reserved.
//

#import "Object.h"
#import "GLWrapper.h"

#define ToSeeCylinderTopPixelOffset 40

@class Display;
static Display *main;

@interface Display : Object
@property(weak, nonatomic)GLKView* view;
+ (Display*)main;
+ (void)setMain:(Display*)display;
- (id)initWithGLKView:(GLKView*)view;
- (void)active;
@end

