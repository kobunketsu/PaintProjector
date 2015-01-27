//
//  FuzzyTransparentView.h
//  PaintProjector
//
//  Created by 胡 文杰 on 13-9-25.
//  Copyright (c) 2013年 WenjiHu. All rights reserved.
//

#import <UIKit/UIKit.h>
@protocol ADFuzzyTransparentViewDelegate <NSObject>
-(void)willSnapshotUIImageEnd:(UIImage*)image;
-(void)willRemoveFuzzyTransparentEnd;
@end

@interface ADFuzzyTransparentView : UIView
@property (assign, nonatomic)id delegate;
//底层UIView
@property (weak, nonatomic)UIView*  sourceView;
//反光颜色
//@property (copy, nonatomic)UIColor *reflectColor;

- (void)updateFuzzyTransparentFromView:(UIView*)view;
- (void)setFuzzyTransparentSourceView:(UIView*)view;
- (void)removeFuzzyTransparent;

@end
