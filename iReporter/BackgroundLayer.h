//
//  BackgroundLayer.h
//  PaintProjector
//
//  Created by 胡 文杰 on 13-11-22.
//  Copyright (c) 2013年 WenjiHu. All rights reserved.
//

#import "Layer.h"

@interface BackgroundLayer : Layer
@property (nonatomic, assign) bool dirty;
@property (nonatomic, assign) bool visible;
@property(nonatomic, retain)UIColor* clearColor;

@end
