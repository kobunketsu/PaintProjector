//
//  LayerVisibleButton.h
//  ProjectPaint
//
//  Created by 胡 文杰 on 13-5-20.
//  Copyright (c) 2013年 WenjiHu. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "AutoRotateButton.h"
@interface LayerVisibleButton : AutoRotateButton
@property(nonatomic, setter = setIsVisible:,  assign)BOOL isVisible;
@end
