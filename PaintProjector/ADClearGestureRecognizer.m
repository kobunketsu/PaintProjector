//
//  ClearGestureRecognizer.m
//  PaintProjector
//
//  Created by 胡 文杰 on 13-9-30.
//  Copyright (c) 2013年 WenjiHu. All rights reserved.
//

#import "ADClearGestureRecognizer.h"

@implementation ADClearGestureRecognizer

-(id)initWithTarget:(id)target action:(SEL)action{
    self = [super initWithTarget:target action:action];
    if (self) {
        // Initialization code
        [self reset];
    }
    return self;
}

- (void)reset{
    DebugLog(@"ClearGestureRecognizer reset");
    [super reset];
    self.touch = nil;
    self.reverseCount = 0;
    self.prevDirection = CGPointZero;
    self.toucheCount = 0;
    self.firstCheck = true;
    self.timeInterval = 0.2;
    self.prevTimeStamp = 0;
    self.prevPoint = CGPointZero;
}

- (void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event{
//    DebugLog(@"ClearGestureRecognizer touchesBegan count %d", touches.count);
    [super touchesBegan:touches withEvent:event];

    self.toucheCount += touches.count;
    
    if (self.touch != nil) {
        return;
    }
    
    self.touch = [touches anyObject];
    self.prevPoint = [self.touch locationInView:self.view];
    self.prevTimeStamp = self.touch.timestamp;
}

- (void)touchesMoved:(NSSet *)touches withEvent:(UIEvent *)event{
//    DebugLog(@"[ClearGestureRecognizer touchesMoved count:%d]", touches.count);
    [super touchesMoved:touches withEvent:event];
    
    //没有主触摸，不进行判断
    if (self.touch == nil) {
        return;
    }
    
    //保证开始touchesMoved时，已经同时有三个手指在,才处理手势,否则判断为失败
    if (self.toucheCount != 3) {
        DebugLog(@"ClearGestureRecognizerStateFailed toucheCount %d notEqual 3", self.toucheCount);
        self.state = UIGestureRecognizerStateFailed;
        return;
    }
    
    //如果已经识别失败，无需继续判断
    if (self.state == UIGestureRecognizerStateFailed) return;
    
    //经过间隔时间才记录点, 方向
    if (self.touch.timestamp - self.prevTimeStamp <= self.timeInterval) {
        return;
    }

    self.prevTimeStamp = self.touch.timestamp;
    
    //计算发生移动的手指的运动平均值，(可能会出现某个手指移动单位和整体趋势不相符情况)
    CGPoint nowPoint = [self.touch locationInView:self.view];
    CGPoint curDirection = CGPointMake(nowPoint.x - self.prevPoint.x, nowPoint.y - self.prevPoint.y);
//    DebugLog(@"ClearGestureRecognizerState nowPoint %@", NSStringFromCGPoint(nowPoint));
//    DebugLog(@"ClearGestureRecognizerState prePoint %@", NSStringFromCGPoint(self.prevPoint));
//    DebugLog(@"ClearGestureRecognizerState curDirection %@", NSStringFromCGPoint(curDirection));
//    DebugLog(@"ClearGestureRecognizerState preDirection %@", NSStringFromCGPoint(self.prevDirection));
    self.prevPoint = nowPoint;

    float tan = 1.0;
    bool isHorizonMove = curDirection.x >= fabsf(curDirection.y) * tan;
    DebugLog(@"isHorizonMove %i", isHorizonMove);
    
    //在开始转折时需要判断是否时三指转折
    if (self.prevDirection.x > 0 && curDirection.x <= 0 && self.reverseCount == 0){
        DebugLog(@"reverseCount 1");
        self.reverseCount = 1;
    }
    else if(self.prevDirection.x < 0 && curDirection.x >= 0 && self.reverseCount == 1){
        DebugLog(@"reverseCount 2");
        self.reverseCount = 2;
    }
    
    //处于起始手势，不论手指数量
    if (self.firstCheck) {
        self.firstCheck = false;
        if (!isHorizonMove || curDirection.x < 0) {
            self.state = UIGestureRecognizerStateFailed;
            
            DebugLog(@"ClearGestureRecognizerStateFailed isHorizonMove %i curDirection.x: %.1f", isHorizonMove, curDirection.x);
            return;
        }

    }

    if (self.reverseCount > 0 && self.state == UIGestureRecognizerStatePossible) {
        DebugLog(@"ClearGestureRecognizerStateBegan reverseCount %d", self.reverseCount);
        self.state = UIGestureRecognizerStateBegan;
    }
    
    self.prevDirection = curDirection;
}

- (void)touchesEnded:(NSSet *)touches withEvent:(UIEvent *)event{
    DebugLog(@"ClearGestureRecognizer touchesEnded");
    [super touchesEnded:touches withEvent:event];
    self.toucheCount -= touches.count;
    
    //在已经识别情况下，任何手指离开事件，都判定识别成功
    if (self.toucheCount == 0) {
        if (self.state == UIGestureRecognizerStateChanged && self.reverseCount >= 2) {
            DebugLog(@"ClearGestureRecognizerStateRecognized");
            self.state = UIGestureRecognizerStateRecognized;
        }
        else{
            DebugLog(@"ClearGestureRecognizerStateFailed touchesEnded state %d reverCount %d",self.state, self.reverseCount);
            self.state = UIGestureRecognizerStateFailed;
        }
    }

}

- (void)touchesCancelled:(NSSet *)touches withEvent:(UIEvent *)event{
    DebugLog(@"ClearGestureRecognizer touchesCancelled");
    [super touchesCancelled:touches withEvent:event];
    self.toucheCount -= touches.count;
    
    //任何取消情况都判定失败
    DebugLog(@"ClearGestureRecognizerStateFailed touchesCancelled");
    self.state = UIGestureRecognizerStateFailed;
    
}

@end
