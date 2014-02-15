//
//  BackgroundLayer.h
//  PaintProjector
//
//  Created by 胡 文杰 on 13-11-22.
//  Copyright (c) 2013年 WenjiHu. All rights reserved.
//

#import "Layer.h"

@interface BackgroundLayer : Layer
@property (assign, nonatomic) bool dirty;
@property (assign, nonatomic) bool visible;
@property (retain, nonatomic)UIColor* clearColor;

@end
