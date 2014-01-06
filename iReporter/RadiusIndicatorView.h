//
//  RadiusIndicatorButton.h
//  ProjectPaint
//
//  Created by 胡 文杰 on 13-5-4.
//  Copyright (c) 2013年 WenjiHu. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "QuartzCore/QuartzCore.h"

@interface RadiusIndicatorView : UIView
{
    float _radius;
}
@property(nonatomic, retain)UILabel* label;
- (float)radius;

- (void)setRadius:(float)newValue;

@end
