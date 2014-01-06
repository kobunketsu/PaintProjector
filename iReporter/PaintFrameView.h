//
//  PaintFrameButton.h
//  ProjectPaint
//
//  Created by 胡 文杰 on 13-6-2.
//  Copyright (c) 2013年 WenjiHu. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "PaintDoc.h"
#import "MediaFrameView.h"

@interface PaintFrameView : UIButton
@property(nonatomic, weak)PaintDoc* paintDoc;
- (id)initWithFrame:(CGRect)frame paintDoc:(PaintDoc*)paintDoc;
-(void)loadForDisplay;
@end
