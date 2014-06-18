//
//  AnaDrawTutorial.h
//  PaintProjector
//
//  Created by 胡 文杰 on 6/17/14.
//  Copyright (c) 2014 WenjiHu. All rights reserved.
//

#import "Tutorial.h"

@interface AnaDrawTutorial : Tutorial

//单个指示器
- (TutorialStep *)addActionStep:(NSString *)name description:(NSString*)desc bounds:(CGRect)bounds arrowDirection:(UIPopoverArrowDirection)arrowDirection;

//单个带下一步按钮的页面
- (TutorialStep *)addPageStep:(NSString *)name description:(NSString*)desc pageBounds:(CGRect)bounds pageImage:(NSString *)imageName withNextButton:(BOOL)withNextButton;

@end
