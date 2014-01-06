//
//  AutoRotateButton.h
//  ProjectPaint
//
//  Created by 胡 文杰 on 13-7-6.
//  Copyright (c) 2013年 WenjiHu. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "CustomLayer.h"
@interface AutoRotateButton : UIButton
@property(nonatomic, assign)UIDeviceOrientation orientation;
@property(nonatomic, assign)BOOL isInterfacePortraitUpsideDown;
//@property(nonatomic, assign)CGColorRef baseColor;
@end
