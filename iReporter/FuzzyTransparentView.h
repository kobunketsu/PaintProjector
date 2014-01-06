//
//  FuzzyTransparentView.h
//  PaintProjector
//
//  Created by 胡 文杰 on 13-9-25.
//  Copyright (c) 2013年 WenjiHu. All rights reserved.
//

#import <UIKit/UIKit.h>
@protocol FuzzyTransparentViewDelegate <NSObject>
-(void)willSnapshotUIImageEnd:(UIImage*)image;
-(void)willRemoveFuzzyTransparentEnd;
@end

@interface FuzzyTransparentView : UIView
@property(nonatomic, weak)UIView*  sourceView;
@property(nonatomic, assign)id delegate;
- (void)updateFuzzyTransparentFromView:(UIView*)view;
- (void)removeFuzzyTransparent;
- (void)setFuzzyTransparentSourceView:(UIView*)view;
@end
