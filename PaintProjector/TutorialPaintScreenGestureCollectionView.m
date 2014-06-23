//
//  TutorialPaintScreenGestureCollectionView.m
//  PaintProjector
//
//  Created by 胡 文杰 on 6/22/14.
//  Copyright (c) 2014 WenjiHu. All rights reserved.
//

#import "TutorialPaintScreenGestureCollectionView.h"

@implementation TutorialPaintScreenGestureCollectionView

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
        [self initCustom];
    }
    return self;
}

- (id)initWithFrame:(CGRect)frame collectionViewLayout:(UICollectionViewLayout *)layout{
    self = [super initWithFrame:frame collectionViewLayout:layout];
    if (self) {
        // Initialization code
        [self initCustom];
    }
    return self;
}

- (void)initCustom{
    self.layer.shadowColor = [UIColor blackColor].CGColor;
    self.layer.shadowOffset = CGSizeMake(0, 5);
    self.layer.shadowOpacity = 0.1;
    self.layer.shadowRadius = 4.0;
}
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
//- (void)drawRect:(CGRect)rect
//{
//    // Drawing code
//}


@end
