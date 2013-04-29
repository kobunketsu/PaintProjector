//
//  UndoButton.m
//  iReporter
//
//  Created by 文杰 胡 on 12-11-6.
//  Copyright (c) 2012年 Marin Todorov. All rights reserved.
//

#import "UndoButton.h"

@implementation UndoButton
@synthesize touchPoint;
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
//override touchesBegan will ignore touch up inside function
//- (void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event{
//    UITouch* touch = [touches anyObject];
//    touchPoint = [touch locationInView:self];
//}
- (void)touchesMoved:(NSSet *)touches withEvent:(UIEvent *)event{
    UITouch* touch = [touches anyObject];
    touchPoint = [touch locationInView:self];    
}
//- (void)touchesEnded:(NSSet *)touches withEvent:(UIEvent *)event{
//    touchPoint = CGPointMake(0, 0);
//}

@end
