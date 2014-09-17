//
//  ADTextPopAnimator.m
//  PaintProjector
//
//  Created by kobunketsu on 9/14/14.
//  Copyright (c) 2014 WenjiHu. All rights reserved.
//

#import "ADTextPopAnimator.h"


@implementation ADTextPopAnimator
//text的载体在外部创建？还是内部创建
- (id)initWithTextView:(NSArray *)textViews{
    self = [super init];
    if (self) {
        _textSplitters = [[NSMutableArray alloc]init];
        //use text splitter to create multiple text labels for one text
        for (UITextView *textView in textViews) {
            DebugLog(@"textView rect%@", NSStringFromCGRect(textView.frame));
            ADTextSplitter *splitter = [[ADTextSplitter alloc] initFromTextView:textView perWord:false delegate:nil];

            [_textSplitters addObject:splitter];
            
            if (![textViews.firstObject isEqual:textView]) {
                [splitter setHidden:true];
            }
        }
    }
    return self;
}

- (void)popTextByPercentage:(CGFloat)percentage{
    //visiblity
    for (ADTextSplitter *splitter in self.textSplitters) {
        [splitter setHidden:true];
    }
    
    NSInteger curIndex = floorf(percentage);
    NSInteger nextIndex = ceilf(percentage);
    
    if (curIndex >= self.textSplitters.count || nextIndex >= self.textSplitters.count) {
        return;
    }
    
    if (curIndex == nextIndex) {
        ADTextSplitter *curSplitter = self.textSplitters[curIndex];
        [curSplitter setHidden:false];
        for (UILabel *label in curSplitter.characters) {
            [label.layer setValue:[NSNumber numberWithFloat:1] forKeyPath:@"transform.scale.x"];
        }
    }
    else{
        ADTextSplitter *curSplitter = self.textSplitters[curIndex];
        [curSplitter setHidden:false];
        ADTextSplitter *nextSplitter = self.textSplitters[nextIndex];
        [nextSplitter setHidden:false];
        
        CGFloat delta = percentage - curIndex; //0-0.5 curIndex fadeout animation 0.5-1 nextIndex fadein animation
        
        CGFloat lerp = MAX(0, 1.0 - delta * 2);
        for (UILabel *label in curSplitter.characters) {
            [label.layer setValue:[NSNumber numberWithFloat:lerp] forKeyPath:@"transform.scale.x"];
        }
        
        CGFloat nextLerp =  MAX(0, (delta - 0.5) * 2);
        for (UILabel *label in nextSplitter.characters) {
            [label.layer setValue:[NSNumber numberWithFloat:nextLerp] forKeyPath:@"transform.scale.x"];
        }
    }



}
@end
