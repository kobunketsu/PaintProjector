//
//  EyeDropperButton.h
//  ProjectPaint
//
//  Created by 胡 文杰 on 13-5-5.
//  Copyright (c) 2013年 WenjiHu. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface EyeDropperButton : UIButton
{
    UIColor* _color;
}
- (UIColor *)color;

- (void)setColor:(UIColor *)newValue;

@end
