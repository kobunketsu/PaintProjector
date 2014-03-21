//
//  HandleGestureRecognizer.h
//  PaintProjector
//
//  Created by 文杰 胡 on 13-2-3.
//  Copyright (c) 2013年 Marin Todorov. All rights reserved.
//

//名称:
//描述:
//功能:

#import <Foundation/Foundation.h>
#import <QuartzCore/QuartzCore.h>
@interface HandleGestureRecognizer : NSObject
{
}
+ (float)newScale;
+ (CGPoint)newTranslate;
+ (void)handleMove:(UIPanGestureRecognizer *)sender;
+ (void)handleScale:(UIPinchGestureRecognizer *)sender;
@end
