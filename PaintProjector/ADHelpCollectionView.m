//
//  ADHelpCollectionView.m
//  PaintProjector
//
//  Created by 胡 文杰 on 9/10/14.
//  Copyright (c) 2014 WenjiHu. All rights reserved.
//

#import "ADHelpCollectionView.h"
#import "ADPaintUIKitStyle.h"

@implementation ADHelpCollectionView

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
- (void)drawRect:(CGRect)rect
{
    // Drawing code
    [ADPaintUIKitStyle drawCrystalGradientInView:self];
}

@end
