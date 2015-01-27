//
//  BrushView.h
//  PaintProjector
//
//  Created by 文杰 胡 on 12-10-29.
//  Copyright (c) 2012年 Hu Wenjie. All rights reserved.
//

//名称:
//描述:
//功能:

#import <UIKit/UIKit.h>
#import "ADBrush.h"

@interface ADBrushView : UIView
{
}
@property (weak, nonatomic) ADBrush *brush;
@property (retain, nonatomic) UIColor *color;
@end
