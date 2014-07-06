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
@end
