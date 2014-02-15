//
//  PaintHelpView.m
//  iReporter
//
//  Created by 文杰 胡 on 12-10-28.
//  Copyright (c) 2012年 Marin Todorov. All rights reserved.
//

#import "PaintHelpView.h"

@implementation PaintHelpView

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
- (void)awakeFromNib
{
    paintView = [[self superview].subviews objectAtIndex:0];
}
@end
