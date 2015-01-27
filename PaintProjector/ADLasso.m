//
//  Lasso.m
//  PaintProjector
//
//  Created by kobunketsu on 10/3/14.
//  Copyright (c) 2014 WenjiHu. All rights reserved.
//

/*
原理
使用strip mesh绘制选择的多边形带
遍历每个像素，从像素点到(－1，－1)点(在屏幕外的点)连接一条线段，与strip mesh的每一个线段求交点，相交的点数为奇数则该像素在区域内，偶数为在区域外
 
 */

#import "ADLasso.h"

@implementation ADLasso

@end
