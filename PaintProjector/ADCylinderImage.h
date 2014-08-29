//
//  CylinderImage.h
//  PaintProjector
//
//  Created by 胡 文杰 on 2/1/14.
//  Copyright (c) 2014 WenjiHu. All rights reserved.
//

//用于逆向描画时使用到cylinderImage
#import "REEntity.h"

@interface ADCylinderImage : REEntity
#pragma mark- 圆柱体中Image的输入参数

@property (assign, nonatomic) GLKVector3 eye;
@property (assign, nonatomic) float radius;//圆柱体半径
@property (assign, nonatomic) float imageWidth;//圆柱体中图片的宽 < 圆柱半径*2
@property (assign, nonatomic) float imageCenterOnSurfHeight;//圆柱体中图片中心高度

#pragma mark- 圆柱体中Image的系统参数
@property (assign, nonatomic) float imageRatio;//圆柱体中图片的宽高比率

@property(retain, nonatomic)RETexture *reflectionTex;
@property(assign, nonatomic)GLKVector4 reflectionTexUVSpace;
#pragma mark- 更新
- (void)updateImageInCylinder;
@end
