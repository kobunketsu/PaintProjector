//
//  ADHintView.m
//  PaintProjector
//
//  Created by 文杰 胡 on 1/29/15.
//  Copyright (c) 2015 WenjiHu. All rights reserved.
//

#import "ADHintView.h"

#define HintViewPopDuration  0.2
#define HintViewFadeDuration 0.5
#define HintViewPopDamping 0.3
#define HintViewPopVelcotiy 0.5
#define HintViewWidth 200
#define HintViewHeight 66
@implementation ADHintView

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
    }
    return self;
}

- (id)initWithTitle:(NSString*)title parentView:(UIView*)parentView{
    CGRect frame = CGRectMake(0, 0, HintViewWidth, HintViewHeight);
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
        UILabel *label = [[UILabel alloc]initWithFrame:frame];
        label.textAlignment = NSTextAlignmentCenter;
        label.text = title;
        [self addSubview:label];
        
        if(parentView){
            self.center = parentView.center;
            [parentView addSubview:self];
        }

    }
    return self;
}

- (void)show{
    [self.layer setValue:[NSNumber numberWithFloat:0.1] forKeyPath:@"transform.scale"];
    [UIView animateWithDuration:HintViewPopDuration animations:^{
        [self.layer setValue:[NSNumber numberWithFloat:1] forKeyPath:@"transform.scale"];
    } completion:^(BOOL finished) {
        [UIView animateWithDuration:HintViewFadeDuration delay:0.5 options:UIViewAnimationOptionCurveEaseInOut animations:^{
            self.alpha = 0;
        } completion:^(BOOL finished) {
            [self removeFromSuperview];
        }];
    }];
}

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect
{
    // Drawing code
}
*/

@end
