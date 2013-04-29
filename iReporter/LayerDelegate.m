//
//  LayerDelegate.m
//  iReporter
//
//  Created by 文杰 胡 on 12-12-5.
//  Copyright (c) 2012年 Marin Todorov. All rights reserved.
//

#import "LayerDelegate.h"

@implementation LayerDelegate

-(id) initWithView: (UIView*) view {
    self = [super init];
    if (self != nil) {
        _view = view;
    }
    return self;
}

-(void) drawLayer: (CALayer*) layer inContext: (CGContextRef) context {
    NSString* methodName = [NSString stringWithFormat: @"draw%@Layer:inContext:", layer.name];
    SEL selector = NSSelectorFromString(methodName);
    if ([_view respondsToSelector: selector] == NO)
        selector = @selector(drawLayer:inContext:);
    [_view performSelector: selector withObject: layer withObject: (__bridge id)context];
}

- (CALayer*)addLayerWithName:(NSString*)name Contents:(id)contents InRect:(CGRect)rect{
    CALayer *rootLayer = [_view layer];    
    CALayer *subLayer = [CALayer layer];    
    subLayer.name = name;
    subLayer.delegate = self;
    subLayer.bounds = rect;
    subLayer.position = CGPointMake(rect.size.width*0.5 + rect.origin.x, rect.size.height*0.5 + rect.origin.y);
    subLayer.contents = contents; 
    [rootLayer addSublayer:subLayer];    
    
    return subLayer;
}

-(void)copyLayerInfo:(CALayer*)srcLayer ToLayer:(CALayer*)targetLayer{
    targetLayer.name = srcLayer.name;
    targetLayer.bounds = srcLayer.bounds;
    targetLayer.position = srcLayer.position;
    
//    UIGraphicsBeginImageContext(_view.bounds.size);
//    [srcLayer renderInContext:UIGraphicsGetCurrentContext()];
//    UIImage *viewImage = UIGraphicsGetImageFromCurrentImageContext();
//    UIGraphicsEndImageContext();    
//    targetLayer.contents = (id)viewImage.CGImage;    
    //other info
}
@end