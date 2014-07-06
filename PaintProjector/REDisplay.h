//
//  Display.h
//  PaintProjector
//
//  Created by 胡 文杰 on 2/4/14.
//  Copyright (c) 2014 WenjiHu. All rights reserved.
//

#import "REObject.h"
#import "REGLWrapper.h"

@class REDisplay;
static REDisplay *main;

@protocol REDisplayDelegate <NSObject>
- (CGRect)willGetViewport;
@end


@interface REDisplay : REObject
@property(weak, nonatomic)GLKView* view;
@property(assign, nonatomic)id delegate;
+ (REDisplay*)main;
+ (void)setMain:(REDisplay*)display;
- (id)initWithGLKView:(GLKView*)view;
- (void)active;
@end

