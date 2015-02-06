//
//  SharedTableView.m
//  PaintProjector
//
//  Created by 胡 文杰 on 3/26/14.
//  Copyright (c) 2014 WenjiHu. All rights reserved.
//

#import "ADSharedTableView.h"
#import "ADPaintUIKitStyle.h"

@implementation ADSharedTableView

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
//        [[NSNotificationCenter defaultCenter] addObserver:self
//                                                 selector:@selector(backgroundLayerClearColorChanged)
//                                                     name:BackgroundLayerClearColorChangedNotification
//                                                   object:nil];
    }
    return self;
}

- (id)initWithCoder:(NSCoder *)aDecoder
{
    self = [super initWithCoder:aDecoder];
    if (self) {
        // Initialization code
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

- (void)drawRect:(CGRect)rect
{
    // Drawing code
    [ADSharedUIStyleKit drawPanelBackgourndWithFrame:rect];
}
@end
