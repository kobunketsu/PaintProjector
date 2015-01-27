//
//  UILabel+Extension.m
//  PaintProjector
//
//  Created by kobunketsu on 9/15/14.
//  Copyright (c) 2014 WenjiHu. All rights reserved.
//

#import "UILabel+Extension.h"

@implementation UILabel (Extension)
- (UITextView*)toTextView{
//    DebugLog(@"self frame %@", NSStringFromCGRect(self.frame));
    UITextView *textView = [[UITextView alloc]initWithFrame:self.frame];
    textView.tag = self.tag;
    textView.text = self.text;
    textView.textAlignment = self.textAlignment;
    textView.textColor = self.textColor;
    textView.tintAdjustmentMode = self.tintAdjustmentMode;
    textView.tintColor = self.tintColor;
    textView.font = [UIFont fontWithDescriptor:self.font.fontDescriptor size:self.font.pointSize];
    textView.backgroundColor = self.backgroundColor;
    textView.opaque = self.opaque;
    textView.alpha = self.alpha;
    
    
    return textView;
}

- (id)initFromTextView:(UITextView*)textView{
    self = [super init];
    if (self) {
        self.tag = textView.tag;
        self.text = textView.text;
        self.textAlignment = textView.textAlignment;
        self.textColor = textView.textColor;
        self.tintAdjustmentMode = textView.tintAdjustmentMode;
        self.tintColor = textView.tintColor;
        self.font = [UIFont fontWithDescriptor:textView.font.fontDescriptor size:textView.font.pointSize];
        
        self.backgroundColor = textView.backgroundColor;
        self.opaque = textView.opaque;
        self.alpha = textView.alpha;
        
//        DebugLog(@"color %@", self.textColor);
    }
    return self;
}
@end
