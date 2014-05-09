//
//  RenderSettings.h
//  PaintProjector
//
//  Created by 胡 文杰 on 5/7/14.
//  Copyright (c) 2014 WenjiHu. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <GLKit/GLKit.h>

@class RenderSettings;
static RenderSettings *renderSettings;
@interface RenderSettings : NSObject
@property(assign, nonatomic)GLKVector4 Ambient;
+ (void)destroy;
+ (void)initialize;
@end
