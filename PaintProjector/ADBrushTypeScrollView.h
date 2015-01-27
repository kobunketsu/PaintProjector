//
//  BrushTypeView.h
//  PaintProjector
//
//  Created by 文杰 胡 on 13-1-1.
//  Copyright (c) 2013年 Hu Wenjie. All rights reserved.
//

//名称:
//描述:
//功能:

#import <UIKit/UIKit.h>
#import "ADBrush.h"
#import "ADBrushTypeButton.h"
@protocol ADBrushTypeScrollViewDelegate <NSObject>
-(void)willSelectBrush:(id)sender;
-(void)willSelectBrushDone:(id)sender;
-(void)willSelectBrushCanceled:(id)sender;
-(void)willBrushTypeScrollViewDidScroll:(UIScrollView *)scrollView;
@end
@interface ADBrushTypeScrollView : UIScrollView <UIScrollViewDelegate>
{
}
@property (assign, nonatomic) id delegate;
@property (retain, nonatomic)NSMutableArray *brushTypes;
@property (weak, nonatomic) UIPageControl *brushTypePageControl;

-(void)initSubviewsWithNumOfBrushPerPage:(NSInteger)numOfBrush;
-(void)addBrushType:(ADBrush*)brush;
-(void)destroy;
-(void)autoShowBrushesTimerFired:(id)sender;
@end
