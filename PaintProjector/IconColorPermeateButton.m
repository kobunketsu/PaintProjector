//
//  IconColorPermeateButton.m
//  PaintProjector
//
//  Created by 胡 文杰 on 3/23/14.
//  Copyright (c) 2014 WenjiHu. All rights reserved.
//

#import "IconColorPermeateButton.h"

@implementation IconColorPermeateButton

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
    }
    return self;
}

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect
{
    // Drawing code
}
*/

-(void)drawLayer:(CALayer *)layer inContext:(CGContextRef)ctx{
    //    DebugLog(@"LayerButton drawLayer inContext");
    CGFloat r = ((CustomLayer*)layer).baseColorR;
    CGFloat g = ((CustomLayer*)layer).baseColorG;
    CGFloat b = ((CustomLayer*)layer).baseColorB;
    UIColor* iconColor = self.isHighlighted ? [UIColor whiteColor] : [UIColor colorWithRed:r green:g blue:b alpha:1.0];
    
    UIGraphicsPushContext(ctx);
    
    [self pastPaintCode:ctx iconColor:iconColor];
    
    UIGraphicsPopContext();
}
@end
