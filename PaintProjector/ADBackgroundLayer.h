//
//  BackgroundLayer.h
//  PaintProjector
//
//  Created by 胡 文杰 on 13-11-22.
//  Copyright (c) 2013年 WenjiHu. All rights reserved.
//

#import "ADLayer.h"

@interface ADBackgroundLayer : ADLayer
@property (retain, nonatomic)UIColor* clearColor;
@property (assign, nonatomic) id delegate;
@property (retain, nonatomic) NSData *data;//临时Layer
@end

@protocol ADBackgroundLayerDelegate
- (void)willClearColorChanged:(UIColor*)color;
@end
