//
//  PaintColorButton.m
//  ProjectPaint
//
//  Created by 胡 文杰 on 13-5-2.
//  Copyright (c) 2013年 WenjiHu. All rights reserved.
//

#import "PaintColorButton.h"

@implementation PaintColorButton

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
    }
    return self;
}

- (id)initWithCoder:(NSCoder *)aDecoder{
    self = [super initWithCoder:aDecoder];
    if (self) {
        // Initialization code
        self.layer.cornerRadius = 33;
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
