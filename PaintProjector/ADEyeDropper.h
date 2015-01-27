//
//  EyeDropper.h
//  PaintProjector
//
//  Created by 文杰 胡 on 12-11-4.
//  Copyright (c) 2012年 Hu Wenjie. All rights reserved.
//

//名称:
//描述:
//功能:

#import <Foundation/Foundation.h>

@interface ADEyeDropper : NSObject
{
}
@property (weak, nonatomic) UIView *targetView;
@property (assign, nonatomic) CGColorRef resultColor;
@property (assign, nonatomic) BOOL isDrawing;
@property (assign, nonatomic) CGPoint position;//touch position
- (void) draw;
- (id) initWithView:(UIView*)view;
- (UIColor *) colorOfPoint:(CGPoint)point;
@end
