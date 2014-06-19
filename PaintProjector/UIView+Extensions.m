//
//  UIView+Extensions.m
//  PaintProjector
//
//  Created by 胡 文杰 on 6/18/14.
//  Copyright (c) 2014 WenjiHu. All rights reserved.
//

#import "UIView+Extensions.h"

@implementation UIView (Extensions)
//如果超出显示边界, 自动调整到边界内
- (void)adjustInRect:(CGRect)rect{
    //首先检查是否宽度高度大于外框
    CGRect frame = self.frame;
    frame.size.width = MIN(frame.size.width, rect.size.width);
    frame.size.height = MIN(frame.size.height, rect.size.height);
    
    //检查是否超出边界,按照左上右下的顺序
    frame.origin.x = MAX(frame.origin.x, rect.origin.x);
    frame.origin.y = MAX(frame.origin.y, rect.origin.y);
    frame.origin.x = MIN(frame.origin.x + frame.size.width, rect.origin.x + rect.size.width) - frame.size.width;
    frame.origin.y = MIN(frame.origin.y + frame.size.height, rect.origin.y + rect.size.height) - frame.size.height;
    self.frame = frame;
}
@end
