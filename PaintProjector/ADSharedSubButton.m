//
//  ADSharedSubButton.m
//  PaintProjector
//
//  Created by 文杰 胡 on 2/5/15.
//  Copyright (c) 2015 WenjiHu. All rights reserved.
//

#import "ADSharedSubButton.h"

@implementation ADSharedSubButton

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
    }
    return self;
}


// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect
{
    // Drawing code
    [self drawADSharedSubButtonWithIsSelected:self.isSelected || self.isHighlighted];
}

- (void)drawADSharedSubButtonWithIsSelected: (BOOL)isSelected
{
}
@end
