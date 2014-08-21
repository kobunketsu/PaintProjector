//
//  UIView+VerticalAlign.m
//  PaintProjector
//
//  Created by 胡 文杰 on 6/13/14.
//  Copyright (c) 2014 WenjiHu. All rights reserved.
//

#import "UILabel+Align.h"
#import <objc/runtime.h>

@implementation UILabel (VerticalAlign)

- (void)alignTop {
    NSDictionary *attribute = @{NSFontAttributeName:self.font};
    CGSize fontSize = [self.text sizeWithAttributes:attribute];
    
    double finalHeight = fontSize.height * self.numberOfLines;
    double finalWidth = self.frame.size.width;    //expected width of label
    
    CGSize theStringSize = [self.text boundingRectWithSize:CGSizeMake(finalWidth, finalHeight) options: NSStringDrawingTruncatesLastVisibleLine | NSStringDrawingUsesLineFragmentOrigin | NSStringDrawingUsesFontLeading attributes:attribute context:nil].size;
    
    int newLinesToPad = (finalHeight  - theStringSize.height) / fontSize.height;
    for(int i=0; i<newLinesToPad; i++){
        self.text = [self.text stringByAppendingString:@"\n "];
    }
}

- (void)alignBottom {
    NSDictionary *attribute = @{NSFontAttributeName:self.font};
    CGSize fontSize = [self.text sizeWithAttributes:attribute];
    double finalHeight = fontSize.height * self.numberOfLines;
    double finalWidth = self.frame.size.width;    //expected width of label
    CGSize theStringSize = [self.text boundingRectWithSize:CGSizeMake(finalWidth, finalHeight) options: NSStringDrawingTruncatesLastVisibleLine | NSStringDrawingUsesLineFragmentOrigin | NSStringDrawingUsesFontLeading attributes:attribute context:nil].size;
    
    int newLinesToPad = (finalHeight  - theStringSize.height) / fontSize.height;
    for(int i=0; i<newLinesToPad; i++)
        self.text = [NSString stringWithFormat:@" \n%@",self.text];
}

- (void)alignTextHorizonCenterWithFontSize:(CGFloat)size{
    NSNumber *numFrameOriginX = (NSNumber *)objc_getAssociatedObject(self, &FrameOriginXKey);
    if (!numFrameOriginX) {
        numFrameOriginX = [NSNumber numberWithFloat:self.frame.origin.x];
        objc_setAssociatedObject(self, &FrameOriginXKey, numFrameOriginX, OBJC_ASSOCIATION_RETAIN);
    }
    NSDictionary *attribute = @{NSFontAttributeName: [UIFont systemFontOfSize:size]};
    CGSize titleSize = [self.text boundingRectWithSize:self.frame.size options: NSStringDrawingTruncatesLastVisibleLine | NSStringDrawingUsesLineFragmentOrigin | NSStringDrawingUsesFontLeading attributes:attribute context:nil].size;
    CGRect labelFrame = self.frame;
    labelFrame.origin.x = numFrameOriginX.floatValue + (self.frame.size.width - titleSize.width) * 0.5;
    self.frame = labelFrame;
}
@end