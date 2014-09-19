//
//  ADLaunchView.m
//  PaintProjector
//
//  Created by kobunketsu on 9/18/14.
//  Copyright (c) 2014 WenjiHu. All rights reserved.
//

#import "ADLaunchLogoView.h"

@implementation ADLaunchLogoView

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
        self.layer.delegate = self;
    }
    return self;
}


- (id)initWithCoder:(NSCoder *)aDecoder
{
    self = [super initWithCoder:aDecoder];
    if (self) {
        // Initialization code
        self.layer.delegate = self;
    }
    return self;
}


+ (Class)layerClass
{
	return [ADLaunchLogoViewLayer class];
}

// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect
{
    // Drawing code
//    [self drawCanvas1WithMorph:((ADLaunchLogoViewLayer *)self.layer).morph];
}

-(void)drawLayer:(CALayer *)layer inContext:(CGContextRef)ctx{
    DebugLogWarn(@"morph %.2f", ((ADLaunchLogoViewLayer *)layer).morph);
    [self drawCanvas1WithContext:ctx morph:((ADLaunchLogoViewLayer *)layer).morph];
}

- (void)drawCanvas1WithContext:(CGContextRef)context morph: (CGFloat)morph;
{
    //// General Declarations
//    CGContextRef context = UIGraphicsGetCurrentContext();
    UIGraphicsPushContext(context);
    
    //// Color Declarations
    UIColor* black = [UIColor colorWithRed: 0.11 green: 0.11 blue: 0.11 alpha: 1];
    UIColor* gold = [UIColor colorWithRed: 0.906 green: 0.773 blue: 0.145 alpha: 1];
    UIColor* gray = [UIColor colorWithRed: 0.863 green: 0.863 blue: 0.863 alpha: 1];
    UIColor* pink = [UIColor colorWithRed: 0.925 green: 0.298 blue: 0.463 alpha: 1];
    UIColor* yellow = [UIColor colorWithRed: 0.922 green: 0.91 blue: 0.494 alpha: 1];
    UIColor* white = [UIColor colorWithRed: 1 green: 1 blue: 1 alpha: 1];
    UIColor* darkGray = [UIColor colorWithRed: 0.307 green: 0.307 blue: 0.307 alpha: 1];
    
    //// Shadow Declarations
    UIColor* innerEdge = [white colorWithAlphaComponent: 0.5];
    CGSize innerEdgeOffset = CGSizeMake(0.1, -0.1);
    CGFloat innerEdgeBlurRadius = 2;
    UIColor* innerEdge2 = [darkGray colorWithAlphaComponent: 0.5];
    CGSize innerEdge2Offset = CGSizeMake(0.1, -0.1);
    CGFloat innerEdge2BlurRadius = 2;
    
    //// Variable Declarations
    CGFloat a1_Ana_rotate = 0 * morph + (1 - morph) * 150;
    CGFloat n_Ana_rotate = 0 * morph + (1 - morph) * -30;
    CGFloat a2_Ana_rotate = 0 * morph + (1 - morph) * 150;
    CGFloat d_Draw_rotate = 0 * morph + (1 - morph) * 60;
    CGFloat r_Draw_rotate = 0 * morph + (1 - morph) * -30;
    CGFloat a_Draw_rotate = 0 * morph + (1 - morph) * -30;
    CGFloat w_Draw_rotate = 0 * morph + (1 - morph) * -30;
    CGFloat logoToTitle_n_Ana_scale = 1 * morph + -1 * (1 - morph);
    CGPoint title_A1_Ana_origin = CGPointMake(156, 409);
    CGPoint logo_A1_Ana_origin = CGPointMake(336.9, 577);
    CGPoint logoToTitle_A1_Ana_origin = CGPointMake(title_A1_Ana_origin.x * morph + logo_A1_Ana_origin.x * (1 - morph), title_A1_Ana_origin.y * morph + logo_A1_Ana_origin.y * (1 - morph));
    CGFloat logo_A1_Ana_scale = 0.6;
    CGFloat logoToTitle_A1_Ana_scale = 1 * morph + logo_A1_Ana_scale * (1 - morph);
    CGPoint title_n_Ana_origin = CGPointMake(237.8, 430);
    CGPoint logo_n_Ana_origin = CGPointMake(432.8, 446);
    CGPoint logoToTitle_n_Ana_origin = CGPointMake(title_n_Ana_origin.x * morph + logo_n_Ana_origin.x * (1 - morph), title_n_Ana_origin.y * morph + logo_n_Ana_origin.y * (1 - morph));
    CGPoint title_a2_Ana_origin = CGPointMake(295, 430);
    CGPoint logo_a2_Ana_origin = CGPointMake(400, 429);
    CGPoint logoToTitle_a2_Ana_origin = CGPointMake(title_a2_Ana_origin.x * morph + logo_a2_Ana_origin.x * (1 - morph), title_a2_Ana_origin.y * morph + logo_a2_Ana_origin.y * (1 - morph));
    CGFloat logo_a2_Ana_scale = 0.7;
    CGFloat logoToTitle_a2_Ana_scale = 1 * morph + logo_a2_Ana_scale * (1 - morph);
    CGPoint title_D_Draw_origin = CGPointMake(361.6, 408.4);
    CGPoint logo_D_Draw_origin = CGPointMake(384.6, 373.4);
    CGPoint logoToTitle_D_Draw_origin = CGPointMake(title_D_Draw_origin.x * morph + logo_D_Draw_origin.x * (1 - morph), title_D_Draw_origin.y * morph + logo_D_Draw_origin.y * (1 - morph));
    CGPoint title_r_Draw_origin = CGPointMake(435, 430);
    CGPoint logo_r_Draw_origin = CGPointMake(365, 407.3);
    CGPoint logoToTitle_r_Draw_origin = CGPointMake(title_r_Draw_origin.x * morph + logo_r_Draw_origin.x * (1 - morph), title_r_Draw_origin.y * morph + logo_r_Draw_origin.y * (1 - morph));
    CGPoint title_a_Draw_origin = CGPointMake(465.5, 430);
    CGPoint logo_a_Draw_origin = CGPointMake(417.5, 392);
    CGPoint logoToTitle_a_Draw_origin = CGPointMake(title_a_Draw_origin.x * morph + logo_a_Draw_origin.x * (1 - morph), title_a_Draw_origin.y * morph + logo_a_Draw_origin.y * (1 - morph));
    CGFloat logo_a_Draw_scale = 0.7;
    CGFloat logoToTitle_a_Draw_scale = 1 * morph + logo_a_Draw_scale * (1 - morph);
    CGPoint title_w_Draw_origin = CGPointMake(533.7, 430.3);
    CGPoint logo_w_Draw_origin = CGPointMake(335.7, 456.3);
    CGPoint logoToTitle_w_Draw_origin = CGPointMake(title_w_Draw_origin.x * morph + logo_w_Draw_origin.x * (1 - morph), title_w_Draw_origin.y * morph + logo_w_Draw_origin.y * (1 - morph));
    
    //// blend
    {
        //// n_Ana 3 Drawing
        CGContextSaveGState(context);
        CGContextTranslateCTM(context, logoToTitle_n_Ana_origin.x, logoToTitle_n_Ana_origin.y);
        CGContextRotateCTM(context, -n_Ana_rotate * M_PI / 180);
        CGContextScaleCTM(context, logoToTitle_n_Ana_scale, 1);
        
        UIBezierPath* n_Ana3Path = UIBezierPath.bezierPath;
        [n_Ana3Path moveToPoint: CGPointMake(0, 58)];
        [n_Ana3Path addLineToPoint: CGPointMake(0, 1.28)];
        [n_Ana3Path addLineToPoint: CGPointMake(8.68, 1.28)];
        [n_Ana3Path addLineToPoint: CGPointMake(8.68, 9.35)];
        [n_Ana3Path addCurveToPoint: CGPointMake(26.78, 0) controlPoint1: CGPointMake(12.86, 3.12) controlPoint2: CGPointMake(18.89, 0)];
        [n_Ana3Path addCurveToPoint: CGPointMake(36.24, 1.84) controlPoint1: CGPointMake(30.21, 0) controlPoint2: CGPointMake(33.36, 0.61)];
        [n_Ana3Path addCurveToPoint: CGPointMake(42.69, 6.68) controlPoint1: CGPointMake(39.11, 3.07) controlPoint2: CGPointMake(41.27, 4.68)];
        [n_Ana3Path addCurveToPoint: CGPointMake(45.69, 13.78) controlPoint1: CGPointMake(44.12, 8.67) controlPoint2: CGPointMake(45.12, 11.04)];
        [n_Ana3Path addCurveToPoint: CGPointMake(46.23, 23.13) controlPoint1: CGPointMake(46.05, 15.56) controlPoint2: CGPointMake(46.23, 18.67)];
        [n_Ana3Path addLineToPoint: CGPointMake(46.23, 58)];
        [n_Ana3Path addLineToPoint: CGPointMake(36.59, 58)];
        [n_Ana3Path addLineToPoint: CGPointMake(36.59, 23.5)];
        [n_Ana3Path addCurveToPoint: CGPointMake(35.46, 14.71) controlPoint1: CGPointMake(36.59, 19.58) controlPoint2: CGPointMake(36.21, 16.65)];
        [n_Ana3Path addCurveToPoint: CGPointMake(31.47, 10.07) controlPoint1: CGPointMake(34.71, 12.77) controlPoint2: CGPointMake(33.38, 11.22)];
        [n_Ana3Path addCurveToPoint: CGPointMake(24.75, 8.33) controlPoint1: CGPointMake(29.56, 8.91) controlPoint2: CGPointMake(27.32, 8.33)];
        [n_Ana3Path addCurveToPoint: CGPointMake(14.12, 12.23) controlPoint1: CGPointMake(20.64, 8.33) controlPoint2: CGPointMake(17.1, 9.63)];
        [n_Ana3Path addCurveToPoint: CGPointMake(9.64, 27.02) controlPoint1: CGPointMake(11.13, 14.83) controlPoint2: CGPointMake(9.64, 19.76)];
        [n_Ana3Path addLineToPoint: CGPointMake(9.64, 58)];
        [n_Ana3Path addLineToPoint: CGPointMake(0, 58)];
        [n_Ana3Path closePath];
        [gold setFill];
        [n_Ana3Path fill];
        
        ////// n_Ana 3 Inner Shadow
        CGContextSaveGState(context);
        UIRectClip(n_Ana3Path.bounds);
        CGContextSetShadowWithColor(context, CGSizeZero, 0, NULL);
        
        CGContextSetAlpha(context, CGColorGetAlpha([innerEdge CGColor]));
        CGContextBeginTransparencyLayer(context, NULL);
        {
            UIColor* opaqueShadow = [innerEdge colorWithAlphaComponent: 1];
            CGContextSetShadowWithColor(context, innerEdgeOffset, innerEdgeBlurRadius, [opaqueShadow CGColor]);
            CGContextSetBlendMode(context, kCGBlendModeSourceOut);
            CGContextBeginTransparencyLayer(context, NULL);
            
            [opaqueShadow setFill];
            [n_Ana3Path fill];
            
            CGContextEndTransparencyLayer(context);
        }
        CGContextEndTransparencyLayer(context);
        CGContextRestoreGState(context);
        
        
        CGContextRestoreGState(context);
        
        
        //// a2_Ana 3 Drawing
        CGContextSaveGState(context);
        CGContextTranslateCTM(context, logoToTitle_a2_Ana_origin.x, logoToTitle_a2_Ana_origin.y);
        CGContextRotateCTM(context, -a2_Ana_rotate * M_PI / 180);
        CGContextScaleCTM(context, logoToTitle_a2_Ana_scale, logoToTitle_a2_Ana_scale);
        
        UIBezierPath* a2_Ana3Path = UIBezierPath.bezierPath;
        [a2_Ana3Path moveToPoint: CGPointMake(58, 58.19)];
        [a2_Ana3Path addLineToPoint: CGPointMake(48.86, 58.19)];
        [a2_Ana3Path addLineToPoint: CGPointMake(48.86, 48.15)];
        [a2_Ana3Path addCurveToPoint: CGPointMake(28.25, 58) controlPoint1: CGPointMake(42.89, 54.72) controlPoint2: CGPointMake(36.02, 58)];
        [a2_Ana3Path addCurveToPoint: CGPointMake(8.29, 49.41) controlPoint1: CGPointMake(20.47, 58) controlPoint2: CGPointMake(13.82, 55.14)];
        [a2_Ana3Path addCurveToPoint: CGPointMake(0, 28.9) controlPoint1: CGPointMake(2.76, 43.68) controlPoint2: CGPointMake(0, 36.84)];
        [a2_Ana3Path addCurveToPoint: CGPointMake(8.34, 8.49) controlPoint1: CGPointMake(0, 20.96) controlPoint2: CGPointMake(2.78, 14.16)];
        [a2_Ana3Path addCurveToPoint: CGPointMake(28.7, 0) controlPoint1: CGPointMake(13.91, 2.83) controlPoint2: CGPointMake(20.69, 0)];
        [a2_Ana3Path addCurveToPoint: CGPointMake(48.86, 9.75) controlPoint1: CGPointMake(36.71, 0) controlPoint2: CGPointMake(43.43, 3.25)];
        [a2_Ana3Path addLineToPoint: CGPointMake(48.86, 0.41)];
        [a2_Ana3Path addLineToPoint: CGPointMake(58, 0.41)];
        [a2_Ana3Path addLineToPoint: CGPointMake(58, 58.19)];
        [a2_Ana3Path closePath];
        [a2_Ana3Path moveToPoint: CGPointMake(28.85, 50.26)];
        [a2_Ana3Path addCurveToPoint: CGPointMake(43.23, 44.23) controlPoint1: CGPointMake(34.41, 50.26) controlPoint2: CGPointMake(39.21, 48.25)];
        [a2_Ana3Path addCurveToPoint: CGPointMake(49.26, 29.2) controlPoint1: CGPointMake(47.25, 40.21) controlPoint2: CGPointMake(49.26, 35.2)];
        [a2_Ana3Path addCurveToPoint: CGPointMake(43.33, 14.12) controlPoint1: CGPointMake(49.26, 23.2) controlPoint2: CGPointMake(47.28, 18.18)];
        [a2_Ana3Path addCurveToPoint: CGPointMake(28.8, 8.04) controlPoint1: CGPointMake(39.37, 10.07) controlPoint2: CGPointMake(34.53, 8.04)];
        [a2_Ana3Path addCurveToPoint: CGPointMake(14.28, 14.32) controlPoint1: CGPointMake(23.07, 8.04) controlPoint2: CGPointMake(18.23, 10.14)];
        [a2_Ana3Path addCurveToPoint: CGPointMake(8.34, 29.15) controlPoint1: CGPointMake(10.32, 18.51) controlPoint2: CGPointMake(8.34, 23.45)];
        [a2_Ana3Path addCurveToPoint: CGPointMake(14.38, 43.98) controlPoint1: CGPointMake(8.34, 34.85) controlPoint2: CGPointMake(10.35, 39.79)];
        [a2_Ana3Path addCurveToPoint: CGPointMake(28.85, 50.26) controlPoint1: CGPointMake(18.4, 48.17) controlPoint2: CGPointMake(23.22, 50.26)];
        [a2_Ana3Path closePath];
        [gray setFill];
        [a2_Ana3Path fill];
        
        ////// a2_Ana 3 Inner Shadow
        CGContextSaveGState(context);
        UIRectClip(a2_Ana3Path.bounds);
        CGContextSetShadowWithColor(context, CGSizeZero, 0, NULL);
        
        CGContextSetAlpha(context, CGColorGetAlpha([innerEdge CGColor]));
        CGContextBeginTransparencyLayer(context, NULL);
        {
            UIColor* opaqueShadow = [innerEdge colorWithAlphaComponent: 1];
            CGContextSetShadowWithColor(context, innerEdgeOffset, innerEdgeBlurRadius, [opaqueShadow CGColor]);
            CGContextSetBlendMode(context, kCGBlendModeSourceOut);
            CGContextBeginTransparencyLayer(context, NULL);
            
            [opaqueShadow setFill];
            [a2_Ana3Path fill];
            
            CGContextEndTransparencyLayer(context);
        }
        CGContextEndTransparencyLayer(context);
        CGContextRestoreGState(context);
        
        
        CGContextRestoreGState(context);
        
        
        //// A1_Ana 3 Drawing
        CGContextSaveGState(context);
        CGContextTranslateCTM(context, logoToTitle_A1_Ana_origin.x, logoToTitle_A1_Ana_origin.y);
        CGContextRotateCTM(context, -a1_Ana_rotate * M_PI / 180);
        CGContextScaleCTM(context, logoToTitle_A1_Ana_scale, logoToTitle_A1_Ana_scale);
        
        UIBezierPath* a1_Ana3Path = UIBezierPath.bezierPath;
        [a1_Ana3Path moveToPoint: CGPointMake(0, 78)];
        [a1_Ana3Path addLineToPoint: CGPointMake(29.96, 0)];
        [a1_Ana3Path addLineToPoint: CGPointMake(41.08, 0)];
        [a1_Ana3Path addLineToPoint: CGPointMake(73, 78)];
        [a1_Ana3Path addLineToPoint: CGPointMake(61.24, 78)];
        [a1_Ana3Path addLineToPoint: CGPointMake(52.14, 54.38)];
        [a1_Ana3Path addLineToPoint: CGPointMake(19.53, 54.38)];
        [a1_Ana3Path addLineToPoint: CGPointMake(10.96, 78)];
        [a1_Ana3Path addLineToPoint: CGPointMake(0, 78)];
        [a1_Ana3Path closePath];
        [a1_Ana3Path moveToPoint: CGPointMake(22.51, 45.97)];
        [a1_Ana3Path addLineToPoint: CGPointMake(48.95, 45.97)];
        [a1_Ana3Path addLineToPoint: CGPointMake(40.81, 24.37)];
        [a1_Ana3Path addCurveToPoint: CGPointMake(35.28, 8.19) controlPoint1: CGPointMake(38.33, 17.81) controlPoint2: CGPointMake(36.48, 12.41)];
        [a1_Ana3Path addCurveToPoint: CGPointMake(31.07, 23.09) controlPoint1: CGPointMake(34.28, 13.2) controlPoint2: CGPointMake(32.88, 18.16)];
        [a1_Ana3Path addLineToPoint: CGPointMake(22.51, 45.97)];
        [a1_Ana3Path closePath];
        [black setFill];
        [a1_Ana3Path fill];
        
        ////// A1_Ana 3 Inner Shadow
        CGContextSaveGState(context);
        UIRectClip(a1_Ana3Path.bounds);
        CGContextSetShadowWithColor(context, CGSizeZero, 0, NULL);
        
        CGContextSetAlpha(context, CGColorGetAlpha([innerEdge2 CGColor]));
        CGContextBeginTransparencyLayer(context, NULL);
        {
            UIColor* opaqueShadow = [innerEdge2 colorWithAlphaComponent: 1];
            CGContextSetShadowWithColor(context, innerEdge2Offset, innerEdge2BlurRadius, [opaqueShadow CGColor]);
            CGContextSetBlendMode(context, kCGBlendModeSourceOut);
            CGContextBeginTransparencyLayer(context, NULL);
            
            [opaqueShadow setFill];
            [a1_Ana3Path fill];
            
            CGContextEndTransparencyLayer(context);
        }
        CGContextEndTransparencyLayer(context);
        CGContextRestoreGState(context);
        
        
        CGContextRestoreGState(context);
        
        
        //// D_Draw 3 Drawing
        CGContextSaveGState(context);
        CGContextTranslateCTM(context, logoToTitle_D_Draw_origin.x, logoToTitle_D_Draw_origin.y);
        CGContextRotateCTM(context, -d_Draw_rotate * M_PI / 180);
        
        UIBezierPath* d_Draw3Path = UIBezierPath.bezierPath;
        [d_Draw3Path moveToPoint: CGPointMake(0, 78.63)];
        [d_Draw3Path addLineToPoint: CGPointMake(0, 0)];
        [d_Draw3Path addLineToPoint: CGPointMake(26.82, 0)];
        [d_Draw3Path addCurveToPoint: CGPointMake(40.67, 1.13) controlPoint1: CGPointMake(32.87, 0) controlPoint2: CGPointMake(37.49, 0.38)];
        [d_Draw3Path addCurveToPoint: CGPointMake(52.09, 6.76) controlPoint1: CGPointMake(45.14, 2.16) controlPoint2: CGPointMake(48.94, 4.04)];
        [d_Draw3Path addCurveToPoint: CGPointMake(61.3, 20.19) controlPoint1: CGPointMake(56.2, 10.26) controlPoint2: CGPointMake(59.27, 14.74)];
        [d_Draw3Path addCurveToPoint: CGPointMake(64.36, 38.89) controlPoint1: CGPointMake(63.34, 25.65) controlPoint2: CGPointMake(64.36, 31.88)];
        [d_Draw3Path addCurveToPoint: CGPointMake(62.29, 54.76) controlPoint1: CGPointMake(64.36, 44.86) controlPoint2: CGPointMake(63.67, 50.15)];
        [d_Draw3Path addCurveToPoint: CGPointMake(56.98, 66.22) controlPoint1: CGPointMake(60.91, 59.38) controlPoint2: CGPointMake(59.14, 63.19)];
        [d_Draw3Path addCurveToPoint: CGPointMake(49.89, 73.35) controlPoint1: CGPointMake(54.82, 69.24) controlPoint2: CGPointMake(52.45, 71.62)];
        [d_Draw3Path addCurveToPoint: CGPointMake(40.6, 77.29) controlPoint1: CGPointMake(47.32, 75.08) controlPoint2: CGPointMake(44.22, 76.4)];
        [d_Draw3Path addCurveToPoint: CGPointMake(28.09, 78.63) controlPoint1: CGPointMake(36.97, 78.19) controlPoint2: CGPointMake(32.8, 78.63)];
        [d_Draw3Path addLineToPoint: CGPointMake(0, 78.63)];
        [d_Draw3Path closePath];
        [d_Draw3Path moveToPoint: CGPointMake(10.3, 69.35)];
        [d_Draw3Path addLineToPoint: CGPointMake(26.92, 69.35)];
        [d_Draw3Path addCurveToPoint: CGPointMake(39, 67.91) controlPoint1: CGPointMake(32.05, 69.35) controlPoint2: CGPointMake(36.08, 68.87)];
        [d_Draw3Path addCurveToPoint: CGPointMake(45.98, 63.83) controlPoint1: CGPointMake(41.92, 66.94) controlPoint2: CGPointMake(44.25, 65.58)];
        [d_Draw3Path addCurveToPoint: CGPointMake(51.69, 53.88) controlPoint1: CGPointMake(48.43, 61.36) controlPoint2: CGPointMake(50.33, 58.04)];
        [d_Draw3Path addCurveToPoint: CGPointMake(53.74, 38.73) controlPoint1: CGPointMake(53.06, 49.71) controlPoint2: CGPointMake(53.74, 44.66)];
        [d_Draw3Path addCurveToPoint: CGPointMake(49.73, 19.77) controlPoint1: CGPointMake(53.74, 30.5) controlPoint2: CGPointMake(52.4, 24.18)];
        [d_Draw3Path addCurveToPoint: CGPointMake(39.98, 10.89) controlPoint1: CGPointMake(47.06, 15.35) controlPoint2: CGPointMake(43.81, 12.39)];
        [d_Draw3Path addCurveToPoint: CGPointMake(26.66, 9.28) controlPoint1: CGPointMake(37.22, 9.82) controlPoint2: CGPointMake(32.78, 9.28)];
        [d_Draw3Path addLineToPoint: CGPointMake(10.3, 9.28)];
        [d_Draw3Path addLineToPoint: CGPointMake(10.3, 69.35)];
        [d_Draw3Path closePath];
        [pink setFill];
        [d_Draw3Path fill];
        
        ////// D_Draw 3 Inner Shadow
        CGContextSaveGState(context);
        UIRectClip(d_Draw3Path.bounds);
        CGContextSetShadowWithColor(context, CGSizeZero, 0, NULL);
        
        CGContextSetAlpha(context, CGColorGetAlpha([innerEdge CGColor]));
        CGContextBeginTransparencyLayer(context, NULL);
        {
            UIColor* opaqueShadow = [innerEdge colorWithAlphaComponent: 1];
            CGContextSetShadowWithColor(context, innerEdgeOffset, innerEdgeBlurRadius, [opaqueShadow CGColor]);
            CGContextSetBlendMode(context, kCGBlendModeSourceOut);
            CGContextBeginTransparencyLayer(context, NULL);
            
            [opaqueShadow setFill];
            [d_Draw3Path fill];
            
            CGContextEndTransparencyLayer(context);
        }
        CGContextEndTransparencyLayer(context);
        CGContextRestoreGState(context);
        
        
        CGContextRestoreGState(context);
        
        
        //// r_Draw 3 Drawing
        CGContextSaveGState(context);
        CGContextTranslateCTM(context, logoToTitle_r_Draw_origin.x, logoToTitle_r_Draw_origin.y);
        CGContextRotateCTM(context, -r_Draw_rotate * M_PI / 180);
        
        UIBezierPath* r_Draw3Path = UIBezierPath.bezierPath;
        [r_Draw3Path moveToPoint: CGPointMake(0, 58)];
        [r_Draw3Path addLineToPoint: CGPointMake(0, 1.28)];
        [r_Draw3Path addLineToPoint: CGPointMake(8.7, 1.28)];
        [r_Draw3Path addLineToPoint: CGPointMake(8.7, 9.88)];
        [r_Draw3Path addCurveToPoint: CGPointMake(14.86, 1.92) controlPoint1: CGPointMake(10.92, 5.86) controlPoint2: CGPointMake(12.97, 3.2)];
        [r_Draw3Path addCurveToPoint: CGPointMake(21.06, 0) controlPoint1: CGPointMake(16.74, 0.64) controlPoint2: CGPointMake(18.8, 0)];
        [r_Draw3Path addCurveToPoint: CGPointMake(31, 3.1) controlPoint1: CGPointMake(24.32, 0) controlPoint2: CGPointMake(27.63, 1.03)];
        [r_Draw3Path addLineToPoint: CGPointMake(27.67, 12.02)];
        [r_Draw3Path addCurveToPoint: CGPointMake(20.58, 9.93) controlPoint1: CGPointMake(25.31, 10.63) controlPoint2: CGPointMake(22.94, 9.93)];
        [r_Draw3Path addCurveToPoint: CGPointMake(14.88, 11.83) controlPoint1: CGPointMake(18.46, 9.93) controlPoint2: CGPointMake(16.57, 10.57)];
        [r_Draw3Path addCurveToPoint: CGPointMake(11.28, 17.09) controlPoint1: CGPointMake(13.2, 13.09) controlPoint2: CGPointMake(12, 14.85)];
        [r_Draw3Path addCurveToPoint: CGPointMake(9.67, 28.31) controlPoint1: CGPointMake(10.21, 20.51) controlPoint2: CGPointMake(9.67, 24.25)];
        [r_Draw3Path addLineToPoint: CGPointMake(9.67, 58)];
        [r_Draw3Path addLineToPoint: CGPointMake(0, 58)];
        [r_Draw3Path closePath];
        [gold setFill];
        [r_Draw3Path fill];
        
        ////// r_Draw 3 Inner Shadow
        CGContextSaveGState(context);
        UIRectClip(r_Draw3Path.bounds);
        CGContextSetShadowWithColor(context, CGSizeZero, 0, NULL);
        
        CGContextSetAlpha(context, CGColorGetAlpha([innerEdge CGColor]));
        CGContextBeginTransparencyLayer(context, NULL);
        {
            UIColor* opaqueShadow = [innerEdge colorWithAlphaComponent: 1];
            CGContextSetShadowWithColor(context, innerEdgeOffset, innerEdgeBlurRadius, [opaqueShadow CGColor]);
            CGContextSetBlendMode(context, kCGBlendModeSourceOut);
            CGContextBeginTransparencyLayer(context, NULL);
            
            [opaqueShadow setFill];
            [r_Draw3Path fill];
            
            CGContextEndTransparencyLayer(context);
        }
        CGContextEndTransparencyLayer(context);
        CGContextRestoreGState(context);
        
        
        CGContextRestoreGState(context);
        
        
        //// a_Draw 3 Drawing
        CGContextSaveGState(context);
        CGContextTranslateCTM(context, logoToTitle_a_Draw_origin.x, logoToTitle_a_Draw_origin.y);
        CGContextRotateCTM(context, -a_Draw_rotate * M_PI / 180);
        CGContextScaleCTM(context, logoToTitle_a_Draw_scale, logoToTitle_a_Draw_scale);
        
        UIBezierPath* a_Draw3Path = UIBezierPath.bezierPath;
        [a_Draw3Path moveToPoint: CGPointMake(58, 58.19)];
        [a_Draw3Path addLineToPoint: CGPointMake(48.86, 58.19)];
        [a_Draw3Path addLineToPoint: CGPointMake(48.86, 48.15)];
        [a_Draw3Path addCurveToPoint: CGPointMake(28.25, 58) controlPoint1: CGPointMake(42.89, 54.72) controlPoint2: CGPointMake(36.02, 58)];
        [a_Draw3Path addCurveToPoint: CGPointMake(8.29, 49.41) controlPoint1: CGPointMake(20.47, 58) controlPoint2: CGPointMake(13.82, 55.14)];
        [a_Draw3Path addCurveToPoint: CGPointMake(0, 28.9) controlPoint1: CGPointMake(2.76, 43.68) controlPoint2: CGPointMake(0, 36.84)];
        [a_Draw3Path addCurveToPoint: CGPointMake(8.34, 8.49) controlPoint1: CGPointMake(0, 20.96) controlPoint2: CGPointMake(2.78, 14.16)];
        [a_Draw3Path addCurveToPoint: CGPointMake(28.7, 0) controlPoint1: CGPointMake(13.91, 2.83) controlPoint2: CGPointMake(20.69, 0)];
        [a_Draw3Path addCurveToPoint: CGPointMake(48.86, 9.75) controlPoint1: CGPointMake(36.71, 0) controlPoint2: CGPointMake(43.43, 3.25)];
        [a_Draw3Path addLineToPoint: CGPointMake(48.86, 0.41)];
        [a_Draw3Path addLineToPoint: CGPointMake(58, 0.41)];
        [a_Draw3Path addLineToPoint: CGPointMake(58, 58.19)];
        [a_Draw3Path closePath];
        [a_Draw3Path moveToPoint: CGPointMake(28.85, 50.26)];
        [a_Draw3Path addCurveToPoint: CGPointMake(43.23, 44.23) controlPoint1: CGPointMake(34.41, 50.26) controlPoint2: CGPointMake(39.21, 48.25)];
        [a_Draw3Path addCurveToPoint: CGPointMake(49.26, 29.2) controlPoint1: CGPointMake(47.25, 40.21) controlPoint2: CGPointMake(49.26, 35.2)];
        [a_Draw3Path addCurveToPoint: CGPointMake(43.33, 14.12) controlPoint1: CGPointMake(49.26, 23.2) controlPoint2: CGPointMake(47.28, 18.18)];
        [a_Draw3Path addCurveToPoint: CGPointMake(28.8, 8.04) controlPoint1: CGPointMake(39.37, 10.07) controlPoint2: CGPointMake(34.53, 8.04)];
        [a_Draw3Path addCurveToPoint: CGPointMake(14.28, 14.32) controlPoint1: CGPointMake(23.07, 8.04) controlPoint2: CGPointMake(18.23, 10.14)];
        [a_Draw3Path addCurveToPoint: CGPointMake(8.34, 29.15) controlPoint1: CGPointMake(10.32, 18.51) controlPoint2: CGPointMake(8.34, 23.45)];
        [a_Draw3Path addCurveToPoint: CGPointMake(14.38, 43.98) controlPoint1: CGPointMake(8.34, 34.85) controlPoint2: CGPointMake(10.35, 39.79)];
        [a_Draw3Path addCurveToPoint: CGPointMake(28.85, 50.26) controlPoint1: CGPointMake(18.4, 48.17) controlPoint2: CGPointMake(23.22, 50.26)];
        [a_Draw3Path closePath];
        [gray setFill];
        [a_Draw3Path fill];
        
        ////// a_Draw 3 Inner Shadow
        CGContextSaveGState(context);
        UIRectClip(a_Draw3Path.bounds);
        CGContextSetShadowWithColor(context, CGSizeZero, 0, NULL);
        
        CGContextSetAlpha(context, CGColorGetAlpha([innerEdge CGColor]));
        CGContextBeginTransparencyLayer(context, NULL);
        {
            UIColor* opaqueShadow = [innerEdge colorWithAlphaComponent: 1];
            CGContextSetShadowWithColor(context, innerEdgeOffset, innerEdgeBlurRadius, [opaqueShadow CGColor]);
            CGContextSetBlendMode(context, kCGBlendModeSourceOut);
            CGContextBeginTransparencyLayer(context, NULL);
            
            [opaqueShadow setFill];
            [a_Draw3Path fill];
            
            CGContextEndTransparencyLayer(context);
        }
        CGContextEndTransparencyLayer(context);
        CGContextRestoreGState(context);
        
        
        CGContextRestoreGState(context);
        
        
        //// w_Draw 3 Drawing
        CGContextSaveGState(context);
        CGContextTranslateCTM(context, logoToTitle_w_Draw_origin.x, logoToTitle_w_Draw_origin.y);
        CGContextRotateCTM(context, -w_Draw_rotate * M_PI / 180);
        
        UIBezierPath* w_Draw3Path = UIBezierPath.bezierPath;
        [w_Draw3Path moveToPoint: CGPointMake(17.69, 57.74)];
        [w_Draw3Path addLineToPoint: CGPointMake(0, 0)];
        [w_Draw3Path addLineToPoint: CGPointMake(10.13, 0)];
        [w_Draw3Path addLineToPoint: CGPointMake(19.33, 33.33)];
        [w_Draw3Path addLineToPoint: CGPointMake(22.76, 45.73)];
        [w_Draw3Path addCurveToPoint: CGPointMake(25.75, 33.82) controlPoint1: CGPointMake(22.9, 45.11) controlPoint2: CGPointMake(23.9, 41.14)];
        [w_Draw3Path addLineToPoint: CGPointMake(34.95, 0)];
        [w_Draw3Path addLineToPoint: CGPointMake(45.03, 0)];
        [w_Draw3Path addLineToPoint: CGPointMake(53.68, 33.49)];
        [w_Draw3Path addLineToPoint: CGPointMake(56.57, 44.53)];
        [w_Draw3Path addLineToPoint: CGPointMake(59.89, 33.38)];
        [w_Draw3Path addLineToPoint: CGPointMake(69.8, 0)];
        [w_Draw3Path addLineToPoint: CGPointMake(79.33, 0)];
        [w_Draw3Path addLineToPoint: CGPointMake(61.25, 57.74)];
        [w_Draw3Path addLineToPoint: CGPointMake(51.07, 57.74)];
        [w_Draw3Path addLineToPoint: CGPointMake(41.87, 23.16)];
        [w_Draw3Path addLineToPoint: CGPointMake(39.64, 13.32)];
        [w_Draw3Path addLineToPoint: CGPointMake(27.93, 57.74)];
        [w_Draw3Path addLineToPoint: CGPointMake(17.69, 57.74)];
        [w_Draw3Path closePath];
        [yellow setFill];
        [w_Draw3Path fill];
        
        ////// w_Draw 3 Inner Shadow
        CGContextSaveGState(context);
        UIRectClip(w_Draw3Path.bounds);
        CGContextSetShadowWithColor(context, CGSizeZero, 0, NULL);
        
        CGContextSetAlpha(context, CGColorGetAlpha([innerEdge CGColor]));
        CGContextBeginTransparencyLayer(context, NULL);
        {
            UIColor* opaqueShadow = [innerEdge colorWithAlphaComponent: 1];
            CGContextSetShadowWithColor(context, innerEdgeOffset, innerEdgeBlurRadius, [opaqueShadow CGColor]);
            CGContextSetBlendMode(context, kCGBlendModeSourceOut);
            CGContextBeginTransparencyLayer(context, NULL);
            
            [opaqueShadow setFill];
            [w_Draw3Path fill];
            
            CGContextEndTransparencyLayer(context);
        }
        CGContextEndTransparencyLayer(context);
        CGContextRestoreGState(context);
        
        
        CGContextRestoreGState(context);
    }
    
    UIGraphicsPopContext();
}

@end
