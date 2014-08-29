//
//  ADReversePaint.h
//  PaintProjector
//
//  Created by 胡 文杰 on 8/27/14.
//  Copyright (c) 2014 WenjiHu. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "ADReversePaintInputData.h"

@class ADPaintData;
@class ADPaintView;

@interface ADReversePaint : NSObject
@property(retain, nonatomic)ADReversePaintInputData *reversePaintInputData;
@property (retain, nonatomic)NSMutableArray *layerTextures;//用于存储图层的各个texture(用于替换backgroundTexturebuffer)
- (id)initWithPaintView:(ADPaintView*)paintView srcPaintData:(ADPaintData*)srcPaintData;
- (ADPaintData *)combineReversePaintData;

@end
