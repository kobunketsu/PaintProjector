//
//  ADBrushManager.h
//  PaintProjector
//
//  Created by 胡 文杰 on 7/16/14.
//  Copyright (c) 2014 WenjiHu. All rights reserved.
//

#import <Foundation/Foundation.h>

@class ADBrushManager;
static ADBrushManager* brushManager = nil;

@interface ADBrushManager : NSObject

+(ADBrushManager*)current;
+(void)setCurrent:(ADBrushManager*)current;
+(void)destroy;
@end
