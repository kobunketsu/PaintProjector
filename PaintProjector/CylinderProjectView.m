//
//  CylinderProjectView.m
//  PaintProjector
//
//  Created by 胡 文杰 on 13-8-4.
//  Copyright (c) 2013年 WenjiHu. All rights reserved.
//

#import "CylinderProjectView.h"

@implementation CylinderProjectView

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
    }
    return self;
}

//- (id)initWithCoder:(NSCoder*)coder {
//    if ((self = [super initWithCoder:coder])) {
//		CAEAGLLayer *eaglLayer = (CAEAGLLayer *)self.layer;
//        
//		eaglLayer.opaque = YES;
//		// In this application, we want to retain the EAGLDrawable contents after a call to presentRenderbuffer.
//		eaglLayer.drawableProperties = [NSDictionary dictionaryWithObjectsAndKeys:
//										[NSNumber numberWithBool:YES], kEAGLDrawablePropertyRetainedBacking, kEAGLColorFormatRGBA8, kEAGLDrawablePropertyColorFormat, nil];
//    }
//    return self;
//}

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect
{
    // Drawing code
}
*/

- (void)setUserInteractionEnabled:(BOOL)userInteractionEnabled{
    DebugLogWarn(@"setUserInteractionEnabled %i", userInteractionEnabled);
    [super setUserInteractionEnabled:userInteractionEnabled];
}
@end
