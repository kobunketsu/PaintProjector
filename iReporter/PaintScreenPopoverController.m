//
//  PaintScreenPopoverController.m
//  ProjectPaint
//
//  Created by 胡 文杰 on 13-5-11.
//  Copyright (c) 2013年 WenjiHu. All rights reserved.
//

#import "PaintScreenPopoverController.h"
#import "PaintScreenPopoverBackgroundView.h"
@implementation PaintScreenPopoverController
-(id)initWithContentViewController:(UIViewController *)viewController{
    self = [super initWithContentViewController:viewController];
    if (self) {
        // Initialization code
        self.popoverBackgroundViewClass = [PaintScreenPopoverBackgroundView class];
    }
    return self;
}
@end
