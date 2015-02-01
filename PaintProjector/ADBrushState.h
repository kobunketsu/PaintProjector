//
//  ADBrushState.h
//  PaintProjector
//
//  Created by kobunketsu on 9/23/14.
//  Copyright (c) 2014 WenjiHu. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface ADBrushState : NSData
{
}
@property (copy, nonatomic)NSString *version;
@property (assign, nonatomic)int classId;
@property (assign, nonatomic)int seed;
@property (retain, nonatomic)UIColor* color; //TODO:changed to CGColor
@property (assign, nonatomic)float radius;
@property (assign, nonatomic)float radiusJitter;
@property (assign, nonatomic)float radiusFade;
@property (assign, nonatomic)float hardness;
@property (assign, nonatomic)float roundness;
@property (assign, nonatomic)float angle;
@property (assign, nonatomic)float angleJitter;
@property (assign, nonatomic)float angleFade;
@property (assign, nonatomic)float opacity;
@property (assign, nonatomic)float flow;
@property (assign, nonatomic)float flowJitter;
@property (assign, nonatomic)float flowFade;
@property (assign, nonatomic)float spacing;
@property (assign, nonatomic)float scattering;
@property (assign, nonatomic)float wet;
@property (assign, nonatomic)float waterColorBlend;
@property (assign, nonatomic)bool isShapeTexture;
@property (assign, nonatomic)bool isPatternTexture;
@property (assign, nonatomic)bool isAirbrush;
@property (assign, nonatomic)bool isVelocitySensor;
@property (assign, nonatomic)bool isRadiusMagnifySensor;
@property (assign, nonatomic)bool isOpacityLocked;
@end
