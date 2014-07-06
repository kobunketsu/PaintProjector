//
//  RenderSettings.h
//  PaintProjector
//
//  Created by 胡 文杰 on 5/7/14.
//  Copyright (c) 2014 WenjiHu. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <GLKit/GLKit.h>

@class RERenderSettings;
static RERenderSettings *renderSettings;
@interface RERenderSettings : NSObject
@property(assign, nonatomic)GLKVector4 Ambient;
+ (void)destroy;
+ (void)initialize;
@end
