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
@property (assign, nonatomic)UIDeviceOrientation orientation;
@property (assign, nonatomic)BOOL isInterfacePortraitUpsideDown;
//@property (assign, nonatomic)CGColorRef baseColor;
@end
