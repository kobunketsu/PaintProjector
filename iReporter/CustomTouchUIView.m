//
//  CustomTouchUIView.m
//  iReporter
//
//  Created by 文杰 胡 on 12-11-10.
//  Copyright (c) 2012年 Marin Todorov. All rights reserved.
//

#import "CustomTouchUIView.h"

@implementation CustomTouchUIView

#pragma mark - Synthesize
@synthesize delegate;

#pragma mark - Touches
- (BOOL)pointInside:(CGPoint)point withEvent:(UIEvent *)event
{
    if( point.x > 0 && point.x < self.frame.size.width && point.y > 0 && point.y < self.frame.size.height )
    {
        [delegate uiViewTouched:YES ];
        return YES;
    }
    
    [delegate uiViewTouched:NO ];
    return NO;
}
@end