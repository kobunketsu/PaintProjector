//
//  ADSharedUIStyleKit.m
//  AnaDraw
//
//  Created by Wenjie Hu on 2/5/15.
//  Copyright (c) 2015 Dreapp. All rights reserved.
//
//  Generated by PaintCode (www.paintcodeapp.com)
//

#import "ADSharedUIStyleKit.h"


@implementation ADSharedUIStyleKit

#pragma mark Cache

static UIColor* _cSelected = nil;
static UIColor* _cNormal = nil;
static UIColor* _cToolBarBackground = nil;
static UIColor* _cHidden = nil;
static UIColor* _cToolViewBackground = nil;
static UIColor* _cText = nil;
static UIColor* _cDisable = nil;

#pragma mark Initialization

+ (void)initialize
{
    // Colors Initialization
    _cSelected = [UIColor colorWithRed: 1 green: 0.991 blue: 0.995 alpha: 1];
    _cNormal = [UIColor colorWithRed: 0 green: 0.502 blue: 1 alpha: 1];
    _cToolBarBackground = [UIColor colorWithRed: 0.196 green: 0.196 blue: 0.196 alpha: 1];
    _cHidden = [UIColor colorWithRed: 0 green: 0 blue: 0 alpha: 1];
    _cToolViewBackground = [UIColor colorWithRed: 0.129 green: 0.129 blue: 0.129 alpha: 1];
    _cText = [UIColor colorWithRed: 1 green: 0.485 blue: 0.485 alpha: 1];
    _cDisable = [UIColor colorWithRed: 0.395 green: 0.395 blue: 0.395 alpha: 1];

}

#pragma mark Colors

+ (UIColor*)cSelected { return _cSelected; }
+ (UIColor*)cNormal { return _cNormal; }
+ (UIColor*)cToolBarBackground { return _cToolBarBackground; }
+ (UIColor*)cHidden { return _cHidden; }
+ (UIColor*)cToolViewBackground { return _cToolViewBackground; }
+ (UIColor*)cText { return _cText; }
+ (UIColor*)cDisable { return _cDisable; }

#pragma mark Drawing Methods

+ (void)drawTopDownBarWithFrame: (CGRect)frame
{


    //// Subframes
    CGRect background = CGRectMake(CGRectGetMinX(frame), CGRectGetMinY(frame), CGRectGetWidth(frame), CGRectGetHeight(frame));


    //// Background
    {
        //// Rectangle Drawing
        UIBezierPath* rectanglePath = [UIBezierPath bezierPathWithRect: CGRectMake(CGRectGetMinX(background) + floor(CGRectGetWidth(background) * 0.00000 + 0.5), CGRectGetMinY(background) + floor(CGRectGetHeight(background) * 0.00000 + 0.5), floor(CGRectGetWidth(background) * 1.00000 + 0.5) - floor(CGRectGetWidth(background) * 0.00000 + 0.5), floor(CGRectGetHeight(background) * 1.00000 + 0.5) - floor(CGRectGetHeight(background) * 0.00000 + 0.5))];
        [ADSharedUIStyleKit.cToolBarBackground setFill];
        [rectanglePath fill];
    }
}

+ (void)drawADSharedSubButtonWithIsSelected: (BOOL)isSelected
{

    //// Variable Declarations
    BOOL isNormal = !isSelected;

    //// ADLayerVisibleButton
    {
        if (isNormal)
        {
            //// Normal 7
            {
                //// Bezier 18 Drawing
                UIBezierPath* bezier18Path = UIBezierPath.bezierPath;
                [bezier18Path moveToPoint: CGPointMake(23.27, 16.91)];
                [bezier18Path addCurveToPoint: CGPointMake(21.04, 17.38) controlPoint1: CGPointMake(22.47, 16.91) controlPoint2: CGPointMake(21.72, 17.08)];
                [bezier18Path addCurveToPoint: CGPointMake(17.77, 22.41) controlPoint1: CGPointMake(19.11, 18.24) controlPoint2: CGPointMake(17.77, 20.17)];
                [bezier18Path addCurveToPoint: CGPointMake(23.27, 27.91) controlPoint1: CGPointMake(17.77, 25.45) controlPoint2: CGPointMake(20.23, 27.91)];
                [bezier18Path addCurveToPoint: CGPointMake(28.77, 22.41) controlPoint1: CGPointMake(26.3, 27.91) controlPoint2: CGPointMake(28.77, 25.45)];
                [bezier18Path addCurveToPoint: CGPointMake(23.27, 16.91) controlPoint1: CGPointMake(28.77, 19.37) controlPoint2: CGPointMake(26.3, 16.91)];
                [bezier18Path closePath];
                [bezier18Path moveToPoint: CGPointMake(25.02, 12.18)];
                [bezier18Path addCurveToPoint: CGPointMake(31.01, 13.66) controlPoint1: CGPointMake(26.77, 12.42) controlPoint2: CGPointMake(28.66, 12.93)];
                [bezier18Path addCurveToPoint: CGPointMake(41.54, 22.05) controlPoint1: CGPointMake(37.76, 15.76) controlPoint2: CGPointMake(41.54, 22.05)];
                [bezier18Path addCurveToPoint: CGPointMake(31.01, 31.16) controlPoint1: CGPointMake(41.54, 22.05) controlPoint2: CGPointMake(37.76, 28.89)];
                [bezier18Path addCurveToPoint: CGPointMake(14.52, 31.16) controlPoint1: CGPointMake(24.26, 33.44) controlPoint2: CGPointMake(21.27, 33.23)];
                [bezier18Path addCurveToPoint: CGPointMake(4, 22.92) controlPoint1: CGPointMake(7.77, 29.1) controlPoint2: CGPointMake(4, 22.92)];
                [bezier18Path addCurveToPoint: CGPointMake(14.52, 13.66) controlPoint1: CGPointMake(4, 22.92) controlPoint2: CGPointMake(7.77, 15.97)];
                [bezier18Path addCurveToPoint: CGPointMake(25.02, 12.18) controlPoint1: CGPointMake(18.92, 12.15) controlPoint2: CGPointMake(21.73, 11.71)];
                [bezier18Path closePath];
                [ADSharedUIStyleKit.cNormal setFill];
                [bezier18Path fill];
            }
        }


        if (isSelected)
        {
            //// Selected 7
            {
                //// Bezier 13 Drawing
                UIBezierPath* bezier13Path = UIBezierPath.bezierPath;
                [bezier13Path moveToPoint: CGPointMake(23.27, 16.91)];
                [bezier13Path addCurveToPoint: CGPointMake(21.04, 17.38) controlPoint1: CGPointMake(22.47, 16.91) controlPoint2: CGPointMake(21.72, 17.08)];
                [bezier13Path addCurveToPoint: CGPointMake(17.77, 22.41) controlPoint1: CGPointMake(19.11, 18.24) controlPoint2: CGPointMake(17.77, 20.17)];
                [bezier13Path addCurveToPoint: CGPointMake(23.27, 27.91) controlPoint1: CGPointMake(17.77, 25.45) controlPoint2: CGPointMake(20.23, 27.91)];
                [bezier13Path addCurveToPoint: CGPointMake(28.77, 22.41) controlPoint1: CGPointMake(26.3, 27.91) controlPoint2: CGPointMake(28.77, 25.45)];
                [bezier13Path addCurveToPoint: CGPointMake(23.27, 16.91) controlPoint1: CGPointMake(28.77, 19.37) controlPoint2: CGPointMake(26.3, 16.91)];
                [bezier13Path closePath];
                [bezier13Path moveToPoint: CGPointMake(25.02, 12.18)];
                [bezier13Path addCurveToPoint: CGPointMake(31.01, 13.66) controlPoint1: CGPointMake(26.77, 12.42) controlPoint2: CGPointMake(28.66, 12.93)];
                [bezier13Path addCurveToPoint: CGPointMake(41.54, 22.05) controlPoint1: CGPointMake(37.76, 15.76) controlPoint2: CGPointMake(41.54, 22.05)];
                [bezier13Path addCurveToPoint: CGPointMake(31.01, 31.16) controlPoint1: CGPointMake(41.54, 22.05) controlPoint2: CGPointMake(37.76, 28.89)];
                [bezier13Path addCurveToPoint: CGPointMake(14.52, 31.16) controlPoint1: CGPointMake(24.26, 33.44) controlPoint2: CGPointMake(21.27, 33.23)];
                [bezier13Path addCurveToPoint: CGPointMake(4, 22.92) controlPoint1: CGPointMake(7.77, 29.1) controlPoint2: CGPointMake(4, 22.92)];
                [bezier13Path addCurveToPoint: CGPointMake(14.52, 13.66) controlPoint1: CGPointMake(4, 22.92) controlPoint2: CGPointMake(7.77, 15.97)];
                [bezier13Path addCurveToPoint: CGPointMake(25.02, 12.18) controlPoint1: CGPointMake(18.92, 12.15) controlPoint2: CGPointMake(21.73, 11.71)];
                [bezier13Path closePath];
                [ADSharedUIStyleKit.cHidden setFill];
                [bezier13Path fill];
            }
        }
    }
}

+ (void)drawPanelBackgourndWithFrame: (CGRect)frame
{


    //// Subframes
    CGRect background = CGRectMake(CGRectGetMinX(frame), CGRectGetMinY(frame), CGRectGetWidth(frame), CGRectGetHeight(frame));


    //// Background
    {
        //// Rectangle Drawing
        UIBezierPath* rectanglePath = [UIBezierPath bezierPathWithRect: CGRectMake(CGRectGetMinX(background) + floor(CGRectGetWidth(background) * 0.00000 + 0.5), CGRectGetMinY(background) + floor(CGRectGetHeight(background) * 0.00000 + 0.5), floor(CGRectGetWidth(background) * 1.00000 + 0.5) - floor(CGRectGetWidth(background) * 0.00000 + 0.5), floor(CGRectGetHeight(background) * 1.00000 + 0.5) - floor(CGRectGetHeight(background) * 0.00000 + 0.5))];
        [ADSharedUIStyleKit.cToolViewBackground setFill];
        [rectanglePath fill];
    }
}

+ (void)drawADPaintColorButtonWithFrame: (CGRect)frame
{
    //// Color Declarations
    UIColor* cPaintColor = [UIColor colorWithRed: 0.316 green: 0.316 blue: 0.316 alpha: 1];

    //// Oval 2 Drawing
    UIBezierPath* oval2Path = [UIBezierPath bezierPathWithOvalInRect: CGRectMake(CGRectGetMinX(frame) + 3, CGRectGetMinY(frame) + 3, CGRectGetWidth(frame) - 6, CGRectGetHeight(frame) - 6)];
    [cPaintColor setFill];
    [oval2Path fill];
}

+ (void)drawADRadiusSliderWithFrame: (CGRect)frame
{
    //// Color Declarations
    UIColor* cRadiusSliderBg = [UIColor colorWithRed: 0.129 green: 0.129 blue: 0.129 alpha: 1];
    UIColor* cRadiusSliderFg = [UIColor colorWithRed: 0.613 green: 0.613 blue: 0.613 alpha: 1];

    //// Group
    {
        //// Rounded Rectangle Drawing
        UIBezierPath* roundedRectanglePath = [UIBezierPath bezierPathWithRoundedRect: CGRectMake(CGRectGetMinX(frame) + 1, CGRectGetMinY(frame) + 5, 248, 20) cornerRadius: 10];
        [cRadiusSliderBg setFill];
        [roundedRectanglePath fill];


        //// Bezier 2 Drawing
        UIBezierPath* bezier2Path = UIBezierPath.bezierPath;
        [bezier2Path moveToPoint: CGPointMake(CGRectGetMinX(frame) + 242.59, CGRectGetMinY(frame) + 5.68)];
        [bezier2Path addCurveToPoint: CGPointMake(CGRectGetMinX(frame) + 242.87, CGRectGetMinY(frame) + 5.75) controlPoint1: CGPointMake(CGRectGetMinX(frame) + 242.68, CGRectGetMinY(frame) + 5.7) controlPoint2: CGPointMake(CGRectGetMinX(frame) + 242.87, CGRectGetMinY(frame) + 5.75)];
        [bezier2Path addCurveToPoint: CGPointMake(CGRectGetMinX(frame) + 249, CGRectGetMinY(frame) + 14.5) controlPoint1: CGPointMake(CGRectGetMinX(frame) + 246.55, CGRectGetMinY(frame) + 7.09) controlPoint2: CGPointMake(CGRectGetMinX(frame) + 249, CGRectGetMinY(frame) + 10.59)];
        [bezier2Path addCurveToPoint: CGPointMake(CGRectGetMinX(frame) + 249, CGRectGetMinY(frame) + 15) controlPoint1: CGPointMake(CGRectGetMinX(frame) + 249, CGRectGetMinY(frame) + 15) controlPoint2: CGPointMake(CGRectGetMinX(frame) + 249, CGRectGetMinY(frame) + 15)];
        [bezier2Path addLineToPoint: CGPointMake(CGRectGetMinX(frame) + 249, CGRectGetMinY(frame) + 15.5)];
        [bezier2Path addCurveToPoint: CGPointMake(CGRectGetMinX(frame) + 242.87, CGRectGetMinY(frame) + 24.25) controlPoint1: CGPointMake(CGRectGetMinX(frame) + 249, CGRectGetMinY(frame) + 19.41) controlPoint2: CGPointMake(CGRectGetMinX(frame) + 246.55, CGRectGetMinY(frame) + 22.91)];
        [bezier2Path addCurveToPoint: CGPointMake(CGRectGetMinX(frame) + 233.9, CGRectGetMinY(frame) + 25) controlPoint1: CGPointMake(CGRectGetMinX(frame) + 240.5, CGRectGetMinY(frame) + 25) controlPoint2: CGPointMake(CGRectGetMinX(frame) + 238.3, CGRectGetMinY(frame) + 25)];
        [bezier2Path addLineToPoint: CGPointMake(CGRectGetMinX(frame) + 17.82, CGRectGetMinY(frame) + 25)];
        [bezier2Path addCurveToPoint: CGPointMake(CGRectGetMinX(frame) + 7.86, CGRectGetMinY(frame) + 24.45) controlPoint1: CGPointMake(CGRectGetMinX(frame) + 12.05, CGRectGetMinY(frame) + 25) controlPoint2: CGPointMake(CGRectGetMinX(frame) + 9.76, CGRectGetMinY(frame) + 25)];
        [bezier2Path addCurveToPoint: CGPointMake(CGRectGetMinX(frame) + 242.57, CGRectGetMinY(frame) + 5.67) controlPoint1: CGPointMake(CGRectGetMinX(frame) + 43.11, CGRectGetMinY(frame) + 21.63) controlPoint2: CGPointMake(CGRectGetMinX(frame) + 203.81, CGRectGetMinY(frame) + 8.78)];
        [bezier2Path addLineToPoint: CGPointMake(CGRectGetMinX(frame) + 242.59, CGRectGetMinY(frame) + 5.68)];
        [bezier2Path closePath];
        [cRadiusSliderFg setFill];
        [bezier2Path fill];
    }
}

+ (void)drawADOpacitySliderWithFrame: (CGRect)frame
{
    //// General Declarations
    CGColorSpaceRef colorSpace = CGColorSpaceCreateDeviceRGB();
    CGContextRef context = UIGraphicsGetCurrentContext();

    //// Color Declarations
    UIColor* cOpacity = [UIColor colorWithRed: 1 green: 0 blue: 0 alpha: 1];
    UIColor* cOpacityZero = [UIColor colorWithRed: 0 green: 0 blue: 0 alpha: 0];

    //// Gradient Declarations
    CGFloat gradientLocations[] = {0, 1};
    CGGradientRef gradient = CGGradientCreateWithColors(colorSpace, (__bridge CFArrayRef)@[(id)cOpacityZero.CGColor, (id)cOpacity.CGColor], gradientLocations);

    //// Rounded Rectangle Drawing
    CGRect roundedRectangleRect = CGRectMake(CGRectGetMinX(frame) + 1, CGRectGetMinY(frame) + 5, 248, 20);
    UIBezierPath* roundedRectanglePath = [UIBezierPath bezierPathWithRoundedRect: roundedRectangleRect cornerRadius: 10];
    CGContextSaveGState(context);
    [roundedRectanglePath addClip];
    CGContextDrawLinearGradient(context, gradient,
        CGPointMake(CGRectGetMinX(roundedRectangleRect), CGRectGetMidY(roundedRectangleRect)),
        CGPointMake(CGRectGetMaxX(roundedRectangleRect), CGRectGetMidY(roundedRectangleRect)),
        0);
    CGContextRestoreGState(context);


    //// Cleanup
    CGGradientRelease(gradient);
    CGColorSpaceRelease(colorSpace);
}

+ (void)drawADSharedRoundButtonWithFrame: (CGRect)frame isSelected: (BOOL)isSelected
{

    //// Variable Declarations
    BOOL isNormal = !isSelected;

    //// ADBrushSwapButton
    {
        if (isNormal)
        {
            //// Normal 3
            {
                //// Bezier 4 Drawing
                UIBezierPath* bezier4Path = UIBezierPath.bezierPath;
                [bezier4Path moveToPoint: CGPointMake(CGRectGetMinX(frame) + 26.03, CGRectGetMinY(frame) + 13)];
                [bezier4Path addLineToPoint: CGPointMake(CGRectGetMinX(frame) + 16, CGRectGetMinY(frame) + 13)];
                [bezier4Path addLineToPoint: CGPointMake(CGRectGetMinX(frame) + 16, CGRectGetMinY(frame) + 19)];
                [bezier4Path addLineToPoint: CGPointMake(CGRectGetMinX(frame) + 26.03, CGRectGetMinY(frame) + 19)];
                [bezier4Path addLineToPoint: CGPointMake(CGRectGetMinX(frame) + 26.03, CGRectGetMinY(frame) + 18.42)];
                [bezier4Path addCurveToPoint: CGPointMake(CGRectGetMinX(frame) + 31, CGRectGetMinY(frame) + 16) controlPoint1: CGPointMake(CGRectGetMinX(frame) + 27.43, CGRectGetMinY(frame) + 17.84) controlPoint2: CGPointMake(CGRectGetMinX(frame) + 31, CGRectGetMinY(frame) + 16)];
                [bezier4Path addCurveToPoint: CGPointMake(CGRectGetMinX(frame) + 26.03, CGRectGetMinY(frame) + 13.58) controlPoint1: CGPointMake(CGRectGetMinX(frame) + 31, CGRectGetMinY(frame) + 16) controlPoint2: CGPointMake(CGRectGetMinX(frame) + 27.43, CGRectGetMinY(frame) + 14.16)];
                [bezier4Path addLineToPoint: CGPointMake(CGRectGetMinX(frame) + 26.03, CGRectGetMinY(frame) + 13)];
                [bezier4Path closePath];
                [bezier4Path moveToPoint: CGPointMake(CGRectGetMinX(frame) + 15.97, CGRectGetMinY(frame) + 21)];
                [bezier4Path addLineToPoint: CGPointMake(CGRectGetMinX(frame) + 15.97, CGRectGetMinY(frame) + 21.58)];
                [bezier4Path addCurveToPoint: CGPointMake(CGRectGetMinX(frame) + 11.01, CGRectGetMinY(frame) + 24) controlPoint1: CGPointMake(CGRectGetMinX(frame) + 14.61, CGRectGetMinY(frame) + 22.14) controlPoint2: CGPointMake(CGRectGetMinX(frame) + 11.2, CGRectGetMinY(frame) + 23.9)];
                [bezier4Path addCurveToPoint: CGPointMake(CGRectGetMinX(frame) + 15.97, CGRectGetMinY(frame) + 26.42) controlPoint1: CGPointMake(CGRectGetMinX(frame) + 11, CGRectGetMinY(frame) + 24) controlPoint2: CGPointMake(CGRectGetMinX(frame) + 14.57, CGRectGetMinY(frame) + 25.84)];
                [bezier4Path addLineToPoint: CGPointMake(CGRectGetMinX(frame) + 15.97, CGRectGetMinY(frame) + 27)];
                [bezier4Path addLineToPoint: CGPointMake(CGRectGetMinX(frame) + 26, CGRectGetMinY(frame) + 27)];
                [bezier4Path addLineToPoint: CGPointMake(CGRectGetMinX(frame) + 26, CGRectGetMinY(frame) + 21)];
                [bezier4Path addLineToPoint: CGPointMake(CGRectGetMinX(frame) + 15.97, CGRectGetMinY(frame) + 21)];
                [bezier4Path addLineToPoint: CGPointMake(CGRectGetMinX(frame) + 15.97, CGRectGetMinY(frame) + 21)];
                [bezier4Path closePath];
                [bezier4Path moveToPoint: CGPointMake(CGRectGetMinX(frame) + 34, CGRectGetMinY(frame) + 19.5)];
                [bezier4Path addCurveToPoint: CGPointMake(CGRectGetMinX(frame) + 20.5, CGRectGetMinY(frame) + 33) controlPoint1: CGPointMake(CGRectGetMinX(frame) + 34, CGRectGetMinY(frame) + 26.96) controlPoint2: CGPointMake(CGRectGetMinX(frame) + 27.96, CGRectGetMinY(frame) + 33)];
                [bezier4Path addCurveToPoint: CGPointMake(CGRectGetMinX(frame) + 7, CGRectGetMinY(frame) + 19.5) controlPoint1: CGPointMake(CGRectGetMinX(frame) + 13.04, CGRectGetMinY(frame) + 33) controlPoint2: CGPointMake(CGRectGetMinX(frame) + 7, CGRectGetMinY(frame) + 26.96)];
                [bezier4Path addCurveToPoint: CGPointMake(CGRectGetMinX(frame) + 11.19, CGRectGetMinY(frame) + 9.72) controlPoint1: CGPointMake(CGRectGetMinX(frame) + 7, CGRectGetMinY(frame) + 15.65) controlPoint2: CGPointMake(CGRectGetMinX(frame) + 8.61, CGRectGetMinY(frame) + 12.18)];
                [bezier4Path addCurveToPoint: CGPointMake(CGRectGetMinX(frame) + 12.46, CGRectGetMinY(frame) + 8.66) controlPoint1: CGPointMake(CGRectGetMinX(frame) + 11.59, CGRectGetMinY(frame) + 9.34) controlPoint2: CGPointMake(CGRectGetMinX(frame) + 12.01, CGRectGetMinY(frame) + 8.99)];
                [bezier4Path addCurveToPoint: CGPointMake(CGRectGetMinX(frame) + 20.5, CGRectGetMinY(frame) + 6) controlPoint1: CGPointMake(CGRectGetMinX(frame) + 14.7, CGRectGetMinY(frame) + 6.99) controlPoint2: CGPointMake(CGRectGetMinX(frame) + 17.49, CGRectGetMinY(frame) + 6)];
                [bezier4Path addCurveToPoint: CGPointMake(CGRectGetMinX(frame) + 34, CGRectGetMinY(frame) + 19.5) controlPoint1: CGPointMake(CGRectGetMinX(frame) + 27.96, CGRectGetMinY(frame) + 6) controlPoint2: CGPointMake(CGRectGetMinX(frame) + 34, CGRectGetMinY(frame) + 12.04)];
                [bezier4Path closePath];
                [ADSharedUIStyleKit.cNormal setFill];
                [bezier4Path fill];
            }
        }


        if (isSelected)
        {
            //// Selected 3
            {
                //// Bezier 7 Drawing
                UIBezierPath* bezier7Path = UIBezierPath.bezierPath;
                [bezier7Path moveToPoint: CGPointMake(CGRectGetMinX(frame) + 26.03, CGRectGetMinY(frame) + 13)];
                [bezier7Path addLineToPoint: CGPointMake(CGRectGetMinX(frame) + 16, CGRectGetMinY(frame) + 13)];
                [bezier7Path addLineToPoint: CGPointMake(CGRectGetMinX(frame) + 16, CGRectGetMinY(frame) + 19)];
                [bezier7Path addLineToPoint: CGPointMake(CGRectGetMinX(frame) + 26.03, CGRectGetMinY(frame) + 19)];
                [bezier7Path addLineToPoint: CGPointMake(CGRectGetMinX(frame) + 26.03, CGRectGetMinY(frame) + 18.42)];
                [bezier7Path addCurveToPoint: CGPointMake(CGRectGetMinX(frame) + 31, CGRectGetMinY(frame) + 16) controlPoint1: CGPointMake(CGRectGetMinX(frame) + 27.43, CGRectGetMinY(frame) + 17.84) controlPoint2: CGPointMake(CGRectGetMinX(frame) + 31, CGRectGetMinY(frame) + 16)];
                [bezier7Path addCurveToPoint: CGPointMake(CGRectGetMinX(frame) + 26.03, CGRectGetMinY(frame) + 13.58) controlPoint1: CGPointMake(CGRectGetMinX(frame) + 31, CGRectGetMinY(frame) + 16) controlPoint2: CGPointMake(CGRectGetMinX(frame) + 27.43, CGRectGetMinY(frame) + 14.16)];
                [bezier7Path addLineToPoint: CGPointMake(CGRectGetMinX(frame) + 26.03, CGRectGetMinY(frame) + 13)];
                [bezier7Path closePath];
                [bezier7Path moveToPoint: CGPointMake(CGRectGetMinX(frame) + 15.97, CGRectGetMinY(frame) + 21)];
                [bezier7Path addLineToPoint: CGPointMake(CGRectGetMinX(frame) + 15.97, CGRectGetMinY(frame) + 21.58)];
                [bezier7Path addCurveToPoint: CGPointMake(CGRectGetMinX(frame) + 11.01, CGRectGetMinY(frame) + 24) controlPoint1: CGPointMake(CGRectGetMinX(frame) + 14.61, CGRectGetMinY(frame) + 22.14) controlPoint2: CGPointMake(CGRectGetMinX(frame) + 11.2, CGRectGetMinY(frame) + 23.9)];
                [bezier7Path addCurveToPoint: CGPointMake(CGRectGetMinX(frame) + 15.97, CGRectGetMinY(frame) + 26.42) controlPoint1: CGPointMake(CGRectGetMinX(frame) + 11, CGRectGetMinY(frame) + 24) controlPoint2: CGPointMake(CGRectGetMinX(frame) + 14.57, CGRectGetMinY(frame) + 25.84)];
                [bezier7Path addLineToPoint: CGPointMake(CGRectGetMinX(frame) + 15.97, CGRectGetMinY(frame) + 27)];
                [bezier7Path addLineToPoint: CGPointMake(CGRectGetMinX(frame) + 26, CGRectGetMinY(frame) + 27)];
                [bezier7Path addLineToPoint: CGPointMake(CGRectGetMinX(frame) + 26, CGRectGetMinY(frame) + 21)];
                [bezier7Path addLineToPoint: CGPointMake(CGRectGetMinX(frame) + 15.97, CGRectGetMinY(frame) + 21)];
                [bezier7Path addLineToPoint: CGPointMake(CGRectGetMinX(frame) + 15.97, CGRectGetMinY(frame) + 21)];
                [bezier7Path closePath];
                [bezier7Path moveToPoint: CGPointMake(CGRectGetMinX(frame) + 34, CGRectGetMinY(frame) + 19.5)];
                [bezier7Path addCurveToPoint: CGPointMake(CGRectGetMinX(frame) + 20.5, CGRectGetMinY(frame) + 33) controlPoint1: CGPointMake(CGRectGetMinX(frame) + 34, CGRectGetMinY(frame) + 26.96) controlPoint2: CGPointMake(CGRectGetMinX(frame) + 27.96, CGRectGetMinY(frame) + 33)];
                [bezier7Path addCurveToPoint: CGPointMake(CGRectGetMinX(frame) + 7, CGRectGetMinY(frame) + 19.5) controlPoint1: CGPointMake(CGRectGetMinX(frame) + 13.04, CGRectGetMinY(frame) + 33) controlPoint2: CGPointMake(CGRectGetMinX(frame) + 7, CGRectGetMinY(frame) + 26.96)];
                [bezier7Path addCurveToPoint: CGPointMake(CGRectGetMinX(frame) + 11.19, CGRectGetMinY(frame) + 9.72) controlPoint1: CGPointMake(CGRectGetMinX(frame) + 7, CGRectGetMinY(frame) + 15.65) controlPoint2: CGPointMake(CGRectGetMinX(frame) + 8.61, CGRectGetMinY(frame) + 12.18)];
                [bezier7Path addCurveToPoint: CGPointMake(CGRectGetMinX(frame) + 12.46, CGRectGetMinY(frame) + 8.66) controlPoint1: CGPointMake(CGRectGetMinX(frame) + 11.59, CGRectGetMinY(frame) + 9.34) controlPoint2: CGPointMake(CGRectGetMinX(frame) + 12.01, CGRectGetMinY(frame) + 8.99)];
                [bezier7Path addCurveToPoint: CGPointMake(CGRectGetMinX(frame) + 20.5, CGRectGetMinY(frame) + 6) controlPoint1: CGPointMake(CGRectGetMinX(frame) + 14.7, CGRectGetMinY(frame) + 6.99) controlPoint2: CGPointMake(CGRectGetMinX(frame) + 17.49, CGRectGetMinY(frame) + 6)];
                [bezier7Path addCurveToPoint: CGPointMake(CGRectGetMinX(frame) + 34, CGRectGetMinY(frame) + 19.5) controlPoint1: CGPointMake(CGRectGetMinX(frame) + 27.96, CGRectGetMinY(frame) + 6) controlPoint2: CGPointMake(CGRectGetMinX(frame) + 34, CGRectGetMinY(frame) + 12.04)];
                [bezier7Path closePath];
                [ADSharedUIStyleKit.cSelected setFill];
                [bezier7Path fill];
            }
        }
    }
}

@end