//
//  SelectColorButton.h
//  iReporter
//
//  Created by 文杰 胡 on 12-11-3.
//  Copyright (c) 2012年 Marin Todorov. All rights reserved.
//

//名称:
//描述:
//功能:

#import <UIKit/UIKit.h>
#import "Brush.h"

@interface ColorButton : UIButton
{
    UIColor* _color;
}
@property(nonatomic, assign)bool isEmpty;
- (UIColor *)color;

- (void)setColor:(UIColor *)newValue;

-(void)enableHighlighted:(BOOL)highlighted;
@end
