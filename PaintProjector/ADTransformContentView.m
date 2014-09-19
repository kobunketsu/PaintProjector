//
//  TransformContentView.m
//  PaintProjector
//
//  Created by 胡 文杰 on 13-12-9.
//  Copyright (c) 2013年 WenjiHu. All rights reserved.
//

#import "ADTransformContentView.h"
#import "ADTransformContentViewLayer.h"

@implementation ADTransformContentView

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
        self.layer.delegate = self;
        self.backgroundColor = [UIColor clearColor];
    }
    return self;
}

- (id)initWithCoder:(NSCoder *)aDecoder
{
    self = [super initWithCoder:aDecoder];
    if (self) {
        // Initialization code
        self.layer.delegate = self;
        self.backgroundColor = [UIColor clearColor];
    }
    return self;
}

+ (Class)layerClass
{
	return [ADTransformContentViewLayer class];
}

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect
{
    // Drawing code
    TransformContentViewLayer *contentLayer = (TransformContentViewLayer *)self.layer;
    
    //    CGContextRef context = ctx;
    
    UIBezierPath* rectanglePath = [UIBezierPath bezierPathWithRect: self.bounds];
    [[UIColor blueColor] setStroke];
    rectanglePath.lineWidth = 10;
    CGFloat rectanglePattern[] = {20, 10, 20, 10};
    [rectanglePath setLineDash: rectanglePattern count: 4 phase: contentLayer.phase];
    [rectanglePath stroke];
}
*/

//- (void)drawRect:(CGRect)rect{
//   ADTransformContentViewLayer *contentLayer = (ADTransformContentViewLayer *)self.layer;
//
//}

-(void)drawLayer:(CALayer *)layer inContext:(CGContextRef)ctx{
    
    // Drawing code
    ADTransformContentViewLayer *contentLayer = (ADTransformContentViewLayer *)layer;

    DebugLogWarn(@"phase %.1f", contentLayer.phase);
    UIGraphicsPushContext(ctx);

    UIBezierPath* rectanglePath = [UIBezierPath bezierPathWithRect: self.bounds];
    [[UIColor blueColor] setStroke];
    
    //keep line width equal to screen pixel
    NSNumber *num = [self.layer valueForKeyPath:@"transform.scale"];
    rectanglePath.lineWidth = 5.0 / num.floatValue;
    CGFloat rectanglePattern[] = {20, 10, 20, 10};
    [rectanglePath setLineDash: rectanglePattern count: 4 phase: contentLayer.phase];
    [rectanglePath stroke];
    
    UIGraphicsPopContext();
}



@end
