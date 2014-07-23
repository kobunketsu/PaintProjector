//
//  CylinderProjectUserInputParams.h
//  PaintProjector
//
//  Created by 胡 文杰 on 2/16/14.
//  Copyright (c) 2014 WenjiHu. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface ADCylinderProjectUserInputParams : NSObject
@property (assign, nonatomic) CGFloat cylinderHeight;
@property (assign, nonatomic) CGFloat cylinderDiameter;
@property (assign, nonatomic) CGFloat imageWidth;
@property (assign, nonatomic) CGFloat imageCenterOnSurfHeight;
@property (assign, nonatomic) CGFloat eyeHonrizontalDistance;
@property (assign, nonatomic) CGFloat eyeVerticalHeight;
@property (assign, nonatomic) CGFloat unitZoom;
@property (assign, nonatomic) CGFloat eyeZoom;
@property (assign, nonatomic) CGFloat eyeTopZ;
@end
