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
#pragma mark- 距离Distance
+ (CGFloat)lengthFromPoint:(CGPoint)p0 toPoint:(CGPoint)p1{
    CGPoint vec = CGPointMake(p1.x - p0.x, p1.y - p0.y);
    return sqrtf(vec.x * vec.x + vec.y * vec.y);
}
#pragma mark- 贝塞尔二次曲线Beizer
+ (CGFloat)beizerValueT:(CGFloat)t start:(CGFloat)start control:(CGFloat)control end:(CGFloat)end{
    return pow(1 - t, 2) * start + 2.0 * (1 - t) * t * control + t * t * end;
}

+ (CGPoint)beizerCurveT:(CGFloat)t start:(CGPoint)start control:(CGPoint)control end:(CGPoint)end{
    CGPoint p = CGPointZero;
    p.x = pow(1 - t, 2) * start.x + 2.0 * (1 - t) * t * control.x + t * t * end.x;
    p.y = pow(1 - t, 2) * start.y + 2.0 * (1 - t) * t * control.y + t * t * end.y;
    return p;
}

+ (CGFloat)beizerLengthT:(CGFloat)t start:(CGPoint)start control:(CGPoint)control end:(CGPoint)end{
    CGFloat ax = start.x - 2 * control.x + end.x;
    CGFloat ay = start.y - 2 * control.y + end.y;
    CGFloat bx = 2 * control.x - 2 * start.x;
    CGFloat by = 2 * control.y - 2 * start.y;
    
    CGFloat A = 4*(ax * ax + ay * ay);
    CGFloat B = 4*(ax * bx + ay * by);
    CGFloat C = bx * bx + by * by;
    
#if 1
    //MARK: 需要检验
    CGFloat temp1 = sqrtf(C + t * (B + A * t));
    CGFloat temp2 = (2 * A * t * temp1 + B *(temp1 - sqrtf(C)));
    CGFloat temp3 = logf(B + 2 * sqrtf(A) * sqrtf(C));
    CGFloat temp4 = logf(B + 2 * A * t + 2 * sqrtf(A) * temp1);
    CGFloat temp5 = 2 * sqrtf(A) * temp2;
    CGFloat temp6 = (B * B - 4 * A * C) * (temp3 - temp4);
    CGFloat result = (temp5 + temp6) / (8 * powf(A, 1.5));
#else
    if (A < FLT_EPSILON) {
        DebugLogError(@"A < FLT_EPSILON %.1f", A);
        return 0;
    }
    
    CGFloat b = B / (2 * A);
    CGFloat c = C / A;
    CGFloat u = t + b;
    CGFloat k = c - b * b;
    
    if (b + sqrtf(b * b + k) < FLT_EPSILON) {
        DebugLogError(@"b + sqrtf(b * b + k) < FLT_EPSILON b %.1f k %.1f", b, k);
        return 0;
    }
    
    CGFloat result = u * sqrtf(u * u + k);
    result -= b * sqrtf(b * b + k);
    result += logf(fabsf((u + sqrtf(u * u + k)) / (b + sqrtf(b * b + k))));
    result *= sqrtf(A) * 0.5;
#endif
    return result;
}

+ (CGFloat)beizerLengthSteps:(NSUInteger)numOfStep start:(CGPoint)start control:(CGPoint)control end:(CGPoint)end{
    DebugLog(@"numOfStep %d", numOfStep);
    if (numOfStep == 0) {
        return 0;
    }
    
    //brute force 通过step计算长度
    CGPoint lastPos = start;
    CGFloat length = 0;
    CGFloat step = 1.0 / (CGFloat)numOfStep;
    CGFloat t = step;
    for (int i = 0; i < numOfStep; ++i, t += step) {
        CGPoint pos = [ADMathHelper beizerCurveT:t start:start control:control end:end];
        CGPoint vec = CGPointMake(pos.x - lastPos.x, pos.y - lastPos.y);
        length += sqrtf(vec.x * vec.x + vec.y * vec.y);
        lastPos = pos;
    }
    return length;
}


//  长度函数反函数，使用牛顿切线法求解
//private static function InvertL (t:Number, l:Number):Number
//{
//    CGFloat t1 = t;
//    CGFloat t2;
//    do
//    {
//        t2 = t1 - (L(t1) - l)/s(t1);
//        if (Math.abs(t1-t2) < 0.000001) break;
//        t1 = t2;
//    }while(true);
//    return t2;
//}

//+ (CGFloat)uniformBeizerTFromT:(CGFloat)t lengthAtT:(CGFloat)length{
//    
//}

#pragma mark- 贝塞尔三次曲线Beizer
+ (CGFloat)beizer3ValueT:(CGFloat)t start:(CGFloat)start control1:(CGFloat)control1 control2:(CGFloat)control2 end:(CGFloat)end{
    return pow(1 - t, 3) * start + 3.0 * pow((1 - t), 2) * t * control1 + 3.0 * (1 - t) * pow(t, 2) * control2 + pow(t, 3) * end;
}
+ (CGPoint)beizer3CurveT:(CGFloat)t start:(CGPoint)start control1:(CGPoint)control1 control2:(CGPoint)control2 end:(CGPoint)end{
    CGPoint p = CGPointZero;
    p.x = pow(1 - t, 3) * start.x + 3.0 * pow((1 - t), 2) * t * control1.x + 3.0 * (1 - t) * pow(t, 2) * control2.x + pow(t, 3) * end.x;
    p.y = pow(1 - t, 3) * start.y + 3.0 * pow((1 - t), 2) * t * control1.y + 3.0 * (1 - t) * pow(t, 2) * control2.y + pow(t, 3) * end.y;
    return p;
}
+ (CGFloat)beizer3LengthSteps:(NSUInteger)numOfStep start:(CGPoint)start control1:(CGPoint)control1 control2:(CGPoint)control2 end:(CGPoint)end{
    DebugLog(@"numOfStep %d", numOfStep);
    if (numOfStep == 0) {
        return 0;
    }
    
    //brute force 通过step计算长度
    CGPoint lastPos = start;
    CGFloat length = 0;
    CGFloat step = 1.0 / (CGFloat)numOfStep;
    CGFloat t = step;
    for (int i = 0; i < numOfStep; ++i, t += step) {
        CGPoint pos = [ADMathHelper beizer3CurveT:t start:start control1:control1 control2:control2 end:end];
        CGPoint vec = CGPointMake(pos.x - lastPos.x, pos.y - lastPos.y);
        length += sqrtf(vec.x * vec.x + vec.y * vec.y);
        lastPos = pos;
    }
    return length;
}
@end
