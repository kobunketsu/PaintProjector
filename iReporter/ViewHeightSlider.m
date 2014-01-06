//
//  ViewHeightSlider.m
//  ProjectPaint
//
//  Created by 胡 文杰 on 13-7-12.
//  Copyright (c) 2013年 WenjiHu. All rights reserved.
//

#import "ViewHeightSlider.h"

@implementation ViewHeightSlider

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
        [self setThumbImage:[UIImage imageNamed:@"viewHeightSliderThumb"] forState:UIControlStateNormal];

//        [self setMinimumTrackImage:[UIImage alloc] forState:UIControlStateNormal];
//        [self setMaximumTrackImage:[UIImage alloc] forState:UIControlStateNormal];
        
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

@end
