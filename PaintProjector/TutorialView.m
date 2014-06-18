//
//  TutorialView.m
//  PaintProjector
//
//  Created by 胡 文杰 on 6/15/14.
//  Copyright (c) 2014 WenjiHu. All rights reserved.
//

#import "TutorialView.h"

@implementation TutorialView

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
    }
    return self;
}

- (id)initWithCoder:(NSCoder *)aDecoder
{
    self = [super initWithCoder:aDecoder];
    if (self) {
        // Initialization code
    }
    return self;
}

//决定tutorialView下的nextButton是内置的button，还是界面上的某个button,
//如果是界面上的某个button,加上事件后,在dealloc tutorialView后需要移除这个事件
- (void)initWithTutorial:(Tutorial*)tutorial description:(NSString *)desc bgImage:(UIImage*)image{
    self.delegate = tutorial;
    
    if (desc) {
        UILabel *label = [[UILabel alloc]init];
        self.textLabel = label;
        label.text = desc;
        [label setNumberOfLines:10];
        [label setLineBreakMode:NSLineBreakByTruncatingTail];
        
        [self addSubview:label];
    }
    if (image) {
        UIImageView *imageView = [[UIImageView alloc]initWithImage:image];
        self.imageView = imageView;

        [self addSubview:imageView];
        [self sendSubviewToBack:imageView];
    }
}

- (void)layoutSubviews{
    CGRect frame = self.imageView.frame;
    frame.size = self.frame.size;
    self.imageView.frame = frame;
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
