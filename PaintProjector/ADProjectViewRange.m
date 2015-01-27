//
//  ProjectViewRange.m
//  ProjectPaint
//
//  Created by 胡 文杰 on 13-7-13.
//  Copyright (c) 2013年 WenjiHu. All rights reserved.
//

#import "ADProjectViewRange.h"

@implementation ADProjectViewRange

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
    }
    return self;
}

- (CGPoint)virtualTopPoint{
    float viewHeight = self.projectNearPoint.y - self.viewHeightPoint.y;
    float projNear = self.projectNearPoint.x - self.viewHeightPoint.x;
    float projFar = self.projectFarPoint.x - self.viewHeightPoint.x;
    float angleNear = atan2f(viewHeight, projNear);
    float angleFar = atan2f(viewHeight, projFar);
    float fovY = angleNear - angleFar;
    float angleA = M_PI_2 - fovY * 0.5;
    float eyeToProjNearDist = sqrtf(projNear * projNear + viewHeight * viewHeight);
    float projNearToVirtualTopDist = cosf(angleA) * eyeToProjNearDist * 2;
    float k = tanf(M_PI - angleNear - angleA);
    float x = sqrtf((projNearToVirtualTopDist * projNearToVirtualTopDist) / (1 + k*k));
    float y = x * k;
    return CGPointMake(self.projectNearPoint.x + x, self.projectNearPoint.y - y);
}

// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect
{
    // Drawing code
    //// Bezier Drawing
    UIBezierPath* bezierPath = [UIBezierPath bezierPath];
    [bezierPath moveToPoint: self.viewHeightPoint];
    [bezierPath addLineToPoint: self.projectFarPoint];
    [bezierPath addLineToPoint: self.projectNearPoint];
    [bezierPath addLineToPoint: self.viewHeightPoint];
    [bezierPath closePath];
    [[UIColor colorWithRed:0.5 green:0.5 blue:0.5 alpha:0.5] setFill];
    [bezierPath fill];
    [[UIColor darkGrayColor] setStroke];
    bezierPath.lineWidth = 1;
    [bezierPath stroke];
    
    //// Bezier 2 Drawing
    UIBezierPath* bezier2Path = [UIBezierPath bezierPath];
    [bezier2Path moveToPoint: self.projectNearPoint];
    [bezier2Path addLineToPoint: self.virtualTopPoint];
    [[UIColor blueColor] setFill];
    [bezier2Path fill];
    [[UIColor blueColor] setStroke];
    bezier2Path.lineWidth = 5;
    [bezier2Path stroke];
}


@end
