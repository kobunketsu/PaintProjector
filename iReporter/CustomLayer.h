//
//  CustomLayer.h
//  PaintProjector
//
//  Created by 胡 文杰 on 13-10-8.
//  Copyright (c) 2013年 WenjiHu. All rights reserved.
//

#import <QuartzCore/QuartzCore.h>

@interface CustomLayer : CALayer
//CGColor baseColor的方式会导致Bad Access,暂时改成R,G,B分量
@property(nonatomic, assign)CGFloat baseColorR;
@property(nonatomic, assign)CGFloat baseColorG;
@property(nonatomic, assign)CGFloat baseColorB;
@end
