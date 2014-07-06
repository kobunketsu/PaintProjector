//
//  TutorialPage2View.m
//  PaintProjector
//
//  Created by 胡 文杰 on 6/15/14.
//  Copyright (c) 2014 WenjiHu. All rights reserved.
//

#import "ADTutorialPageView.h"

@implementation ADTutorialPageView

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
    }
    return self;
}

- (void)initWithTutorial:(ADTutorial*)tutorial description:(NSString *)desc bgImage:(UIImage*)image{
    self.delegate = tutorial;
    
    CGFloat offsetX = 20;
    CGFloat offsetY = 20;
    if (desc) {
        UILabel *label = [[UILabel alloc]initWithFrame:CGRectMake(offsetX, offsetY, self.bounds.size.width - offsetX * 2, self.bounds.size.height - offsetY * 2)];
        self.textLabel = label;
        label.textColor = [UIColor darkGrayColor];
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

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect
{
    // Drawing code
}
*/
@end
