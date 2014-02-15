//
//  PaintOperation.m
//  iReporter
//
//  Created by 文杰 胡 on 12-12-25.
//  Copyright (c) 2012年 Marin Todorov. All rights reserved.
//

#import "PaintOperation.h"



@implementation PaintOperation
//@synthesize brush;
@synthesize brushState;
@synthesize delegate;
- (PaintOperation*)initWithBrush:(Brush*)theBrush{
    self = [super init];
    if (self!=nil) {
        brushState = [theBrush.brushState copy];
        _paintPaths = [[NSMutableArray alloc]init];
    }

    return self;
}
- (void)addPathPointStart:(CGPoint)startPoint End:(CGPoint)endPoint{
    if ([_paintPaths count]==0) {
        [_paintPaths addObject:[NSValue valueWithCGPoint:startPoint]];
        [_paintPaths addObject:[NSValue valueWithCGPoint:endPoint]];        
    }
    else {
        [_paintPaths addObject:[NSValue valueWithCGPoint:endPoint]];
    }

}
//- (void)playback{
//    
//}

- (void)draw{
    CGPoint startPoint = [[_paintPaths objectAtIndex:0] CGPointValue];
    [delegate prepareBrushState:brushState FromPoint:startPoint];
//    [delegate prepareBrushStateForDraw:self.brushState];
    for (int i = 0; i < [_paintPaths count]-1; ++i) {
        CGPoint startPoint = [[_paintPaths objectAtIndex:i] CGPointValue];
        CGPoint endPoint = [[_paintPaths objectAtIndex:(i+1)] CGPointValue];        
        [delegate drawFromPoint: startPoint toPoint:endPoint WithBrushId:brushState.brushId];
    }
//    [delegate endDrawPaintOperation];    
}
@end
