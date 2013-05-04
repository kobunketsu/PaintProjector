//
//  RadiusButton.h
//  ProjectPaint
//
//  Created by 胡 文杰 on 13-5-4.
//  Copyright (c) 2013年 WenjiHu. All rights reserved.
//

//名称:选择半径
//描述:
//功能:

#import <UIKit/UIKit.h>
#import "QuartzCore/QuartzCore.h"
@interface RadiusButton : UIButton
{
    float _radius;
    UILabel* _label;
}
@property(nonatomic, retain)UILabel* label;
- (float)radius;

- (void)setRadius:(float)newValue;

@end
