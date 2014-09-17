//
//  ADLabelAnimator.m
//  PaintProjector
//
//  Created by kobunketsu on 9/14/14.
//  Copyright (c) 2014 WenjiHu. All rights reserved.
//

#import "ADTextSplitter.h"

@interface ADTextSplitter()

@end

@implementation ADTextSplitter
- (id)initFromUILabel:(UILabel*)label perWord:(BOOL)perWord delegate:(id)delegate{
    self = [super init];
    if (self) {
        _perWord = perWord;
        _delegate = delegate;
        UITextView *textView =  [label toTextView];
        //MARK: textView的位置需要进行偏移来对准UILabel字体的位置
        if (self.delegate) {
            [self.delegate willAdjustTextView:textView];
        }
        [label.superview addSubview:textView];
        
        [self _initFromTextView:textView];
        
        [label removeFromSuperview];
    }
    return self;
}

- (id)initFromTextView:(UITextView*)textView perWord:(BOOL)perWord delegate:(id)delegate{
    self = [super init];
    if (self) {
        _perWord = perWord;
        _delegate = delegate;
        if (self.delegate) {
            [self.delegate willAdjustTextView:textView];
        }
        
        [self _initFromTextView:textView];
    }
    return  self;
}

- (void)_initFromTextView:(UITextView*)textView{
    NSMutableArray *characters = [[NSMutableArray alloc]init];
    NSInteger length = textView.text.length;
    
    for (NSInteger i = 0; i < length; ++i) {
        NSRange range = NSMakeRange(i, 1);
        CGRect bounds = [self frameOfTextRange:range inTextView:textView];
        CGRect finalBounds = [textView convertRect:bounds toView:textView.superview];
        DebugLog(@"finalBounds %@", NSStringFromCGRect(finalBounds));
        //MARK:调整
        finalBounds.size.height *= 3;
        
        UILabel *label = [[UILabel alloc]initFromTextView:textView];
        label.frame = finalBounds;
        label.text = [textView.text substringWithRange:range];
        
//        label.shadowColor = [UIColor colorWithRed:0 green:0 blue:0 alpha:0.3];
//        label.shadowOffset = CGSizeMake(0, 2);
        
        [textView.superview addSubview:label];
        [characters addObject:label];
    }
    [textView removeFromSuperview];
    self.characters = characters;
}
-(CGRect)frameOfTextRange:(NSRange)range inTextView:(UITextView *)textView
{
    UITextPosition *beginning = textView.beginningOfDocument;
    UITextPosition *start = [textView positionFromPosition:beginning offset:range.location];
    UITextPosition *end = [textView positionFromPosition:start offset:range.length];
    UITextRange *textRange = [textView textRangeFromPosition:start toPosition:end];
    CGRect rect = [textView firstRectForRange:textRange];
    return [textView convertRect:rect fromView:textView.textInputView];
}

- (void)setHidden:(BOOL)hidden{
    for (UILabel *label in self.characters) {
        label.hidden = hidden;
    }
}
@end
