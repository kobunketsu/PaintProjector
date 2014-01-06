//
//  HandleGestureRecognizer.m
//  iReporter
//
//  Created by 文杰 胡 on 13-2-3.
//  Copyright (c) 2013年 Marin Todorov. All rights reserved.
//

#import "HandleGestureRecognizer.h"

@implementation HandleGestureRecognizer

static int startTranslateX = 0;
static int startTranslateY = 0;
static int newTranslateX = 0;
static int newTranslateY = 0;
+ (CGPoint)newTranslate{
    return CGPointMake(newTranslateX, newTranslateY);
}

static int startScale = 0;
static float newScale = 0;
+ (float)newScale{
    return newScale;
}

static CGPoint _scaleAnchorPoint;
//处理UIView下Layer的平移
+ (void)handleMove:(UIPanGestureRecognizer *)sender {
    CALayer* layer = [sender.view layer];    
    startTranslateX = [[layer valueForKeyPath: @"transform.translation.x"] floatValue];
    startTranslateY = [[layer valueForKeyPath: @"transform.translation.y"] floatValue];            
    startScale = [[layer valueForKeyPath: @"transform.scale"] floatValue];        
    CGPoint translation = [sender translationInView:sender.view];
    newTranslateX = startTranslateX + translation.x * startScale * 0.1;
    newTranslateY = startTranslateY + translation.y * startScale * 0.1;
    
    float translateXLimit = (startScale - 1) * layer.bounds.size.width * 0.5;
    float translateYLimit = (startScale - 1) * layer.bounds.size.height * 0.5;
    
    if(newTranslateX < -translateXLimit && startTranslateX >= -translateXLimit){
        newTranslateX = -translateXLimit; 
    }
    if(newTranslateX > translateXLimit && startTranslateX <= translateXLimit){
        newTranslateX = translateXLimit; 
    } 
    if(newTranslateY < -translateYLimit && startTranslateY >= -translateYLimit){
        newTranslateY = -translateYLimit; 
    }
    if(newTranslateY > translateYLimit && startTranslateY <= translateYLimit){
        newTranslateY = translateYLimit;
    }
    
    [layer setValue:[NSNumber numberWithFloat:newTranslateX] forKeyPath:@"transform.translation.x"];
    [layer setValue:[NSNumber numberWithFloat:newTranslateY] forKeyPath:@"transform.translation.y"];    
}

//处理UIView下Layer的放缩
+ (void)handleScale:(UIPinchGestureRecognizer *)sender{
    CALayer* layer = [sender.view layer];  
    CGFloat scale = [sender scale];
    if (sender.state == UIGestureRecognizerStateBegan) {
        startTranslateX = [[layer valueForKeyPath: @"transform.translation.x"] floatValue];
        startTranslateY = [[layer valueForKeyPath: @"transform.translation.y"] floatValue];
        startScale = [[layer valueForKeyPath: @"transform.scale"] floatValue];        
        
        if ([sender numberOfTouches]==2) {
            CGPoint touch0 = [sender locationOfTouch:0 inView:sender.view];
            CGPoint touch1 = [sender locationOfTouch:1 inView:sender.view];
            _scaleAnchorPoint = CGPointMake((touch0.x+touch1.x)*0.5, (touch0.y+touch1.y)*0.5);
            
//            DebugLog(@"touch0 %@", NSStringFromCGPoint(touch0));
            
            //            _scaleAnchorPoint = CGPointMake(touchCenter.x / (sender.view.frame.size.width *scale), touchCenter.y / (sender.view.frame.size.height*scale));
            //            DebugLog(@"layer new anchor point %@", NSStringFromCGPoint(_scaleAnchorPoint));
            //            CGPoint ap = [layer anchorPoint];
            //            DebugLog(@"layer old anchor point %@", NSStringFromCGPoint(ap));
            //                        [layer setAnchorPoint:_scaleAnchorPoint];               
        }        
    }
    
    newScale = startScale * scale;
    if (newScale < 1.0) {
        newScale = 1.0;
    }
    [layer setValue:[NSNumber numberWithFloat:newScale] forKeyPath:@"transform.scale"];
    
    float k =0;
    if (startScale>1) {
        k = (newScale-1) / (startScale-1);
    }
    
    //设置anchor
//    CGPoint orignalAnchorPoint = CGPointMake(sender.view.bounds.size.width*0.5, sender.view.bounds.size.height*0.5);
//    CGPoint anchorVector = CGPointMake(orignalAnchorPoint.x - _scaleAnchorPoint.x, orignalAnchorPoint.y - _scaleAnchorPoint.y);
//    DebugLog(@"orignalAnchorPoint %@", NSStringFromCGPoint(orignalAnchorPoint));
//    DebugLog(@"_scaleAnchorPoint %@", NSStringFromCGPoint(_scaleAnchorPoint));
//    DebugLog(@"anchorVector %@", NSStringFromCGPoint(anchorVector));
    
    newTranslateX = startTranslateX * k;
    newTranslateY = startTranslateY * k;
    [layer setValue:[NSNumber numberWithFloat:newTranslateX] forKeyPath:@"transform.translation.x"];
    [layer setValue:[NSNumber numberWithFloat:newTranslateY] forKeyPath:@"transform.translation.y"];    
}
@end
