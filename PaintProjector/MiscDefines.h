//
//  MiscDefines.h
//  PaintProjector
//
//  Created by kobunketsu on 9/19/14.
//  Copyright (c) 2014 WenjiHu. All rights reserved.
//

#ifndef PaintProjector_MiscDefines_h
#define PaintProjector_MiscDefines_h

#define UndoMaxCount 10
#define BUFFER_OFFSET(i) ((char *)NULL + (i))
#define HumanEyeFOV 68.0f
#define FuzzyTransparentAlpha 0.7
#define PaintPixelOffsetThresold 0.1 //确定触摸时多大的距离会记录成一个绘制点
#define UISliderDefaultHeight 31

//全局设置
static bool useQuickTool = true;//所有快捷手势的总开关

#define DefaultScreenWidth [UIScreen mainScreen].bounds.size.width
#define DefaultScreenHeight [UIScreen mainScreen].bounds.size.height
#define PopoverTableViewWidth 320
#define PopoverTableViewCellHeight 66

//#define ToSeeCylinderTopPixelOffset 70
//#define ToSeeCylinderTopViewportPixelOffsetY -160
//#define TransitionToPaintPixelOffsetY -31
//#define ToSeeCylinderTopPosOffset 0

//#define ToSeeCylinderTopPixelOffset 0
//#define ToSeeCylinderTopViewportPixelOffsetY -90
//#define TransitionToPaintPixelOffsetY -34

//#define ToSeeCylinderTopPosOffset -0.05
#define ToSeeCylinderTopPixelOffset 0
#define ToSeeCylinderTopViewportPixelOffsetY 0
#define TransitionToPaintPixelOffsetY -15
#define TransitionToPaintPixelOffsetY_Mini -16.6
#define ToSeeCylinderTopPosOffset 0

#endif
