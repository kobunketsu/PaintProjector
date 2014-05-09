//
//  PaintCollectionViewCellFrame.m
//  PaintProjector
//
//  Created by 胡 文杰 on 2/15/14.
//  Copyright (c) 2014 WenjiHu. All rights reserved.
//

#import "PaintCollectionViewCellFrame.h"

@implementation PaintCollectionViewCellFrame

- (id)initWithCoder:(NSCoder *)aDecoder{
    //    DebugLog(@"[initWithCoder]");
    self = [super initWithCoder:aDecoder];
    if (self) {
        [self initApperance];
        
    }
    return self;
}

- (id)initWithFrame:(CGRect)frame
{
    //    DebugLog(@"[initWithFrame]");
    self = [super initWithFrame:frame];
    if (self) {
        [self initApperance];
    }
    return self;
}

-(void)initApperance{
    self.clipsToBounds = NO;
    self.backgroundColor = [UIColor clearColor];
    
    //设置边框阴影
    //clipsToBounds will clip layer.shadow, should set shadow via drawLayer method
    CGPathRef path = [UIBezierPath bezierPathWithRect:self.bounds].CGPath;
    [self.layer setShadowPath:path];
    self.layer.shadowOpacity = 0.5;
    self.layer.shadowRadius = 5;
    self.layer.shadowOffset = CGSizeMake(0, 5);
    self.layer.shadowColor = [UIColor blackColor].CGColor;
    self.layer.cornerRadius = 5;
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
