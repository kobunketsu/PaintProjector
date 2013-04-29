//
//  SelectColorButton.m
//  iReporter
//
//  Created by 文杰 胡 on 12-11-3.
//  Copyright (c) 2012年 Marin Todorov. All rights reserved.
//

#import "SelectColorButton.h"

@implementation SelectColorButton
@synthesize brush;
- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
    }
    return self;
}
- (void)awakeFromNib{
//    self.backgroundColor = [brush.colorSlots objectAtIndex:self.tag];
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
