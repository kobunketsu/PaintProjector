//
//  UIView+GLCoord.m
//  PaintProjector
//
//  Created by 胡 文杰 on 6/12/14.
//  Copyright (c) 2014 WenjiHu. All rights reserved.
//

#import "UIView+GLCoord.h"

@implementation UIView (GLCoord)
- (CGPoint)convertPointToGL:(CGPoint) point{
    return CGPointMake(point.x, self.bounds.size.height - point.y);
}
@end
