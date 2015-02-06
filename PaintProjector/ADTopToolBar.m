//
//  TopToolBar.m
//  ProjectPaint
//
//  Created by 胡 文杰 on 13-5-5.
//  Copyright (c) 2013年 WenjiHu. All rights reserved.
//

#import "ADTopToolBar.h"
#import "ADPaintUIKitStyle.h"

@implementation ADTopToolBar

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
    }
    return self;
}

- (id)initWithCoder:(NSCoder *)aDecoder
{
    self = [super initWithCoder:aDecoder];
    if (self) {
        // Initialization code
        self.layer.shadowColor = [UIColor blackColor].CGColor;
        self.layer.shadowOffset = CGSizeMake(0, 0);
        self.layer.shadowOpacity = 0.3;
        self.layer.shadowRadius = 8.0;
//        [[NSNotificationCenter defaultCenter] addObserver:self
//                                                 selector:@selector(backgroundLayerClearColorChanged)
//                                                     name:BackgroundLayerClearColorChangedNotification
//                                                   object:nil];
    }
    return self;
}
- (void)dealloc{
//    [[NSNotificationCenter defaultCenter] removeObserver:self name:BackgroundLayerClearColorChangedNotification object:nil];
}
- (void)backgroundLayerClearColorChanged{
    [self setNeedsDisplay];
}
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect
{
    [self drawCanvas1WithFrame:rect];
}
- (void)drawCanvas1WithFrame: (CGRect)frame
{
    
    
    //// Subframes
    CGRect aDTopToolBar = CGRectMake(CGRectGetMinX(frame) + 0.5, CGRectGetMinY(frame) + 0.5, CGRectGetWidth(frame) - 1, CGRectGetHeight(frame) - 1);
    
    
    //// ADTopToolBar
    {
        //// Rounded Rectangle Drawing
        UIBezierPath* roundedRectanglePath = [UIBezierPath bezierPathWithRoundedRect: CGRectMake(CGRectGetMinX(aDTopToolBar) + floor(CGRectGetWidth(aDTopToolBar) * 0.00000 + 0.5), CGRectGetMinY(aDTopToolBar) + floor(CGRectGetHeight(aDTopToolBar) * 0.00000 + 0.5), floor(CGRectGetWidth(aDTopToolBar) * 1.00000 + 0.5) - floor(CGRectGetWidth(aDTopToolBar) * 0.00000 + 0.5), floor(CGRectGetHeight(aDTopToolBar) * 1.00000 + 0.5) - floor(CGRectGetHeight(aDTopToolBar) * 0.00000 + 0.5)) byRoundingCorners: UIRectCornerBottomLeft | UIRectCornerBottomRight cornerRadii: CGSizeMake(8, 8)];
        [roundedRectanglePath closePath];
        [ADSharedUIStyleKit.cToolBarBackground setFill];
        [roundedRectanglePath fill];
        [ADSharedUIStyleKit.cToolBarBackground setStroke];
        roundedRectanglePath.lineWidth = 1;
        [roundedRectanglePath stroke];
    }
}


@end
