//
//  PaintFrameButton.h
//  ProjectPaint
//
//  Created by 胡 文杰 on 13-6-2.
//  Copyright (c) 2013年 WenjiHu. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ADPaintDoc.h"
#import "ADMediaFrameView.h"

@interface ADPaintFrameView : UIButton
@property (weak, nonatomic)ADPaintDoc* paintDoc;
- (id)initWithFrame:(CGRect)frame paintDoc:(ADPaintDoc*)paintDoc;
-(void)loadForDisplay;
-(void)unloadForDisplay;
@end
