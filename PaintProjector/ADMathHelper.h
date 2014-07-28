//
//  MathHelper.h
//  PaintProjector
//
//  Created by 胡 文杰 on 6/24/14.
//  Copyright (c) 2014 WenjiHu. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <GLKit/GLKit.h>

@interface ADMathHelper : NSObject
+ (GLKQuaternion) quatFromEulerAngles:(GLKVector3)v;
+ (GLKQuaternion)quatFromYaw:(float)yaw pitch:(float)pitch roll:(float)roll;
+ (GLKVector3) eulerAnglesFromQuat:(GLKQuaternion) q1;
+ (CGPoint)beizerCurveT:(CGFloat)t start:(CGPoint)start control:(CGPoint)control end:(CGPoint)end;
+ (CGFloat)beizerValueT:(CGFloat)t start:(CGFloat)start control:(CGFloat)control end:(CGFloat)end;
+ (CGFloat)beizerLengthT:(CGFloat)t start:(CGPoint)start control:(CGPoint)control end:(CGPoint)end;
@end
