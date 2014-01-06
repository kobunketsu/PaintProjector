//
//  BrushView.h
//  iReporter
//
//  Created by 文杰 胡 on 12-10-29.
//  Copyright (c) 2012年 Marin Todorov. All rights reserved.
//

//名称:
//描述:
//功能:

#import <UIKit/UIKit.h>
#import "Brush.h"

@interface BrushView : UIView
{
}
@property (nonatomic, weak) Brush *brush;
@property (nonatomic, retain) UIColor *color;
@end
