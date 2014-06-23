//
//  TutorialPaintScreenGestureCollectionViewCell.m
//  PaintProjector
//
//  Created by 胡 文杰 on 6/22/14.
//  Copyright (c) 2014 WenjiHu. All rights reserved.
//

#import "TutorialPaintScreenGestureCollectionViewCell.h"

@implementation TutorialPaintScreenGestureCollectionViewCell

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
        
        _label = [[UILabel alloc]initWithFrame:CGRectMake(10, frame.size.height - 60, frame.size.width - 10 * 2, 50)];
//        self.label.text = @"TestTestTestTestTest";
        self.label.textColor = [UIColor whiteColor];
        [self.label setFont:[UIFont fontWithName: @"HelveticaNeue" size: 15]];
        [self.label setNumberOfLines:2];
        [self addSubview:self.label];
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
