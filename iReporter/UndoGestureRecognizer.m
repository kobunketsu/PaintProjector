//
//  UndoGestureRecognizer.m
//  iReporter
//
//  Created by 文杰 胡 on 12-11-5.
//  Copyright (c) 2012年 Marin Todorov. All rights reserved.
//

#import "UndoGestureRecognizer.h"
#define UndoTouchRadius 10//根据手指大小调整
#define UndoTouchVelocityLength 500
@implementation UndoGestureRecognizer
//- (BOOL)isUndo:(UITouch*)touch{
//    //判断手指接触面积 速度x方向
//    float radius = [[touch valueForKey:@"pathMajorRadius"]floatValue];
//    CGPoint velocity = [self velocityInView:self.view];
//    if (radius > UndoTouchRadius && velocity.x < 0) {
////        _isUndoPredicted = true;
//        return true;
//    }
//    else {
////        _isUndoPredicted = false;
//        return false;
//        
//    }
//}
- (BOOL)isUndo:(UITouch*)touch{
    //判断手指接触面积 放手的速度大小 速度x方向 角度容差
    float radius = [[touch valueForKey:@"pathMajorRadius"]floatValue];
    CGPoint velocity = [self velocityInView:self.view];
    float velLength = sqrtf(velocity.x * velocity.x + velocity.y * velocity.y);
    if (velLength > UndoTouchVelocityLength && velocity.x < 0 && fabsf(velocity.x) > fabsf(velocity.y) ) {
        NSLog(@"Undo: radius:%.0f velLength:%.0f vel_X:%.0f vel_Y:%.0f", radius, velLength, velocity.x, velocity.y);
        return true;
    }
    else {
        NSLog(@"notUndo: radius:%.0f velLength:%.0f vel_X:%.0f vel_Y:%.0f", radius, velLength, velocity.x, velocity.y);        
        return false;
    }
}

@end
