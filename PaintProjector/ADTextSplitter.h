//
//  ADLabelAnimator.h
//  PaintProjector
//
//  Created by kobunketsu on 9/14/14.
//  Copyright (c) 2014 WenjiHu. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface ADTextSplitter : NSObject
@property(retain, nonatomic) NSMutableArray* characters;
@property(assign, nonatomic) id delegate;
@property(assign, nonatomic) BOOL perWord;
- (id)initFromTextView:(UITextView*)textView perWord:(BOOL)perWord delegate:(id)delegate;
- (id)initFromUILabel:(UILabel*)label perWord:(BOOL)perWord delegate:(id)delegate;
- (void)setHidden:(BOOL)hidden;
@end

@protocol ADTextSplitterDelegate
//MARK:临时调整UILabel转换到UITextView后字体位置的调整
- (void)willAdjustTextView:(UITextView*)textView;
@end
