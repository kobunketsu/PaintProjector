//
//  ADRootCanvasBackgroundView.h
//  PaintProjector
//
//  Created by 胡 文杰 on 7/7/14.
//  Copyright (c) 2014 WenjiHu. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ADRootCanvasBackgroundViewLayer.h"
#import "ADPaintView.h"
@interface ADRootCanvasBackgroundView : UIView
@property (weak, nonatomic) ADPaintView *paintView;
@end
