//
//  MathHelper.m
//  PaintProjector
//
//  Created by 胡 文杰 on 6/24/14.
//  Copyright (c) 2014 WenjiHu. All rights reserved.
//

#import "ADMathHelper.h"

@implementation ADMathHelper
+ (GLKQuaternion) quatFromEulerAngles:(GLKVector3)v
{
    return [self quatFromYaw:v.y pitch:v.x roll:v.z];
}

+ (GLKQuaternion)quatFromYaw:(float)yaw pitch:(float)pitch roll:(float)roll
{
    
    yaw = DEGREES_TO_RADIANS(yaw);
    pitch = DEGREES_TO_RADIANS(pitch);
    roll = DEGREES_TO_RADIANS(roll);
    float rollOver2 = roll * 0.5f;
    float sinRollOver2 = (float)sin((double)rollOver2);
    float cosRollOver2 = (float)cos((double)rollOver2);
    float pitchOver2 = pitch * 0.5f;
    float sinPitchOver2 = (float)sin((double)pitchOver2);
    float cosPitchOver2 = (float)cos((double)pitchOver2);
    float yawOver2 = yaw * 0.5f;
    float sinYawOver2 = (float)sin((double)yawOver2);
    float cosYawOver2 = (float)cos((double)yawOver2);
    GLKQuaternion result;
    result.w = cosYawOver2 * cosPitchOver2 * cosRollOver2 + sinYawOver2 * sinPitchOver2 * sinRollOver2;
    result.x = cosYawOver2 * sinPitchOver2 * cosRollOver2 + sinYawOver2 * cosPitchOver2 * sinRollOver2;
    result.y = sinYawOver2 * cosPitchOver2 * cosRollOver2 - cosYawOver2 * sinPitchOver2 * sinRollOver2;
    result.z = cosYawOver2 * cosPitchOver2 * sinRollOver2 - sinYawOver2 * sinPitchOver2 * cosRollOver2;
    
    return result;
}

+(GLKVector3) eulerAnglesFromQuat:(GLKQuaternion) q1
{
    float sqw = q1.w * q1.w;
    float sqx = q1.x * q1.x;
    float sqy = q1.y * q1.y;
    float sqz = q1.z * q1.z;
    float unit = sqx + sqy + sqz + sqw; // if normalised is one, otherwise is correction factor
    float test = q1.x * q1.w - q1.y * q1.z;
    GLKVector3 v;
    
    if (test>0.4995f*unit) { // singularity at north pole
        v.y = 2.0 * atan2(q1.y, q1.x);
        v.x = M_PI / 2;
        v.z = 0;
        
        v.x = RADIANS_TO_DEGREES(v.x);
        v.y = RADIANS_TO_DEGREES(v.y);
        v.z = RADIANS_TO_DEGREES(v.z);
        return NormalizeAngles(v);
    }
    if (test<-0.4995f*unit) { // singularity at south pole
        v.y = -2.0 * atan2(q1.y, q1.x);
        v.x = -M_PI / 2;
        v.z = 0;

        v.x = RADIANS_TO_DEGREES(v.x);
        v.y = RADIANS_TO_DEGREES(v.y);
        v.z = RADIANS_TO_DEGREES(v.z);
        return NormalizeAngles(v);
    }
    GLKQuaternion q = GLKQuaternionMake(q1.w, q1.z, q1.x, q1.y);
    v.y = (float)atan2(2.0 * q.x * q.w + 2.0 * q.y * q.z, 1 - 2.0 * (q.z * q.z + q.w * q.w));     // Yaw
    v.x = (float)asin(2.0 * (q.x * q.z - q.w * q.y));                             // Pitch
    v.z = (float)atan2(2.0 * q.x * q.y + 2.0 * q.z * q.w, 1 - 2.0 * (q.y * q.y + q.z * q.z));      // Roll
    
    v.x = RADIANS_TO_DEGREES(v.x);
    v.y = RADIANS_TO_DEGREES(v.y);
    v.z = RADIANS_TO_DEGREES(v.z);
    return NormalizeAngles (v);
}

static GLKVector3 NormalizeAngles (GLKVector3 angles)
{
    angles.x = NormalizeAngle (angles.x);
    angles.y = NormalizeAngle (angles.y);
    angles.z = NormalizeAngle (angles.z);
    return angles;
}

static float NormalizeAngle (float angle)
{
    while (angle>360)
        angle -= 360;
    while (angle<0)
        angle += 360;
    return angle;
}
@end
