//
//  ADReversePaintInputData.h
//  PaintProjector
//
//  Created by 胡 文杰 on 7/12/14.
//  Copyright (c) 2014 WenjiHu. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "RETexture.h"

@interface ADReversePaintInputData : NSData
@property(assign, nonatomic)CGFloat radius;
@property(assign, nonatomic)GLKVector3 eye;
@property(assign, nonatomic)CGFloat imageWidth;
@property(assign, nonatomic)CGFloat imageCenterOnSurfHeight;
@property(assign, nonatomic)CGFloat imageRatio;
@property(assign, nonatomic)RETexture *refelctionTex;
@property(assign, nonatomic)GLKVector4 reflectionTexUVSpace;

@end
