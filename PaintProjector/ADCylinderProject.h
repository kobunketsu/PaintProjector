//
//  CylinderProject.h
//  PaintProjector
//
//  Created by 胡 文杰 on 2/1/14.
//  Copyright (c) 2014 WenjiHu. All rights reserved.
//

#import "REEntity.h"

@interface ADCylinderProject : REEntity
#pragma mark- 圆柱体中Image的输入参数

@property (assign, nonatomic) GLKVector3 eye;
@property (assign, nonatomic) float radius;//圆柱体半径
@property (assign, nonatomic) float imageWidth;//圆柱体中图片的宽 < 圆柱半径*2
@property (assign, nonatomic) float imageCenterOnSurfHeight;//圆柱体中图片中心高度

#pragma mark- 圆柱体中Image的系统参数
@property (assign, nonatomic) float imageRatio;//圆柱体中图片的宽高比率

#pragma mark- 更新
- (void)updateImageInCylinder;
#pragma mark- 投影动画
@property (assign, nonatomic) float morphBlend;
@property (assign, nonatomic) float alphaBlend;
@end
