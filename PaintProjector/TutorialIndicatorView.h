//
//  TutorialIndicatorView.h
//  PaintProjector
//
//  Created by 胡 文杰 on 6/15/14.
//  Copyright (c) 2014 WenjiHu. All rights reserved.
//

#import "TutorialView.h"

@interface TutorialIndicatorView : TutorialView
@property(retain, nonatomic)UILabel *textLabel;
//@property(assign, nonatomic)CGRect labelRect;
@property(assign, nonatomic)UIPopoverArrowDirection arrowDirection;
@end
