//
//  ADBarStyleKit.h
//  PaintProjector
//
//  Created by 胡 文杰 on 6/18/14.
//  Copyright (c) 2014 WenjiHu. All rights reserved.
//
//  Generated by PaintCode (www.paintcodeapp.com)
//

#import <Foundation/Foundation.h>


@class ADPCGradient;

@interface ADBarStyleKit : NSObject

// Colors
+ (UIColor*)colorEdge;
+ (UIColor*)colorEdgeHighlighted;
+ (UIColor*)gradientColorStart;
+ (UIColor*)gradientColorEnd;
+ (UIColor*)gradientColorMid;

// Gradients
+ (ADPCGradient*)gradientLightGrayPink;

@end



@interface ADPCGradient : NSObject
@property(nonatomic, readonly) CGGradientRef CGGradient;
- (CGGradientRef)CGGradient NS_RETURNS_INNER_POINTER;

+ (instancetype)gradientWithColors: (NSArray*)colors locations: (const CGFloat*)locations;
+ (instancetype)gradientWithStartingColor: (UIColor*)startingColor endingColor: (UIColor*)endingColor;

@end
