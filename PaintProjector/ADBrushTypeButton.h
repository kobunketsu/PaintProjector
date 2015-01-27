//
//  BrushTypeButton.h
//  PaintProjector
//
//  Created by 文杰 胡 on 13-1-1.
//  Copyright (c) 2013年 Hu Wenjie. All rights reserved.
//

//名称:
//描述:
//功能:

#import <UIKit/UIKit.h>
#import "ADBrush.h"
@class ADBrush;

@interface ADBrushTypeButton : UIButton

@property (retain, nonatomic)ADBrush* brush;
@end
