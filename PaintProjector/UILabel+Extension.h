//
//  UILabel+Extension.h
//  PaintProjector
//
//  Created by kobunketsu on 9/15/14.
//  Copyright (c) 2014 WenjiHu. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UILabel (Extension)
- (UITextView*)toTextView;
- (id)initFromTextView:(UITextView*)textView;
@end
