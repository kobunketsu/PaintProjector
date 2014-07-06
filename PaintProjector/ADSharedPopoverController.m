//
//  PaintScreenPopoverController.m
//  ProjectPaint
//
//  Created by 胡 文杰 on 13-5-11.
//  Copyright (c) 2013年 WenjiHu. All rights reserved.
//

#import "ADSharedPopoverController.h"
#import "ADPaintScreenPopoverBackgroundView.h"
@implementation ADSharedPopoverController
-(id)initWithContentViewController:(UIViewController *)viewController{
    self = [super initWithContentViewController:viewController];
    if (self) {
        // Initialization code
//        self.popoverBackgroundViewClass = [PaintScreenPopoverBackgroundView class];
    }
    return self;
}

- (void)presentPopoverFromRect:(CGRect)rect inView:(UIView *)view permittedArrowDirections:(UIPopoverArrowDirection)arrowDirections animated:(BOOL)animated{
    CGRect fromRect = rect;
    if (arrowDirections == UIPopoverArrowDirectionUp) {
        fromRect.size.height -= 4;
    }
    else if (arrowDirections == UIPopoverArrowDirectionDown) {
        fromRect.origin.y += 4;
        fromRect.size.height -= 4;
    }

    [super presentPopoverFromRect:fromRect inView:view permittedArrowDirections:arrowDirections animated:animated];
}
@end
