//
//  BrushPropertyViewController.h
//  PaintProjector
//
//  Created by 胡 文杰 on 13-9-19.
//  Copyright (c) 2013年 WenjiHu. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Brush.h"
#import "BrushPreview.h"

@protocol BrushPropertyViewControllerDelegate
-(void)willDismissBrushPropertyViewController;
-(void)willBrushPropertyValueChanged:(BrushState*)brushState;
-(void)willBrushShaderChanged:(BrushState*)brushState;
@end


@interface BrushPropertyViewController : UIViewController <
UIScrollViewDelegate,
UICollectionViewDataSource,
UICollectionViewDelegate,
UICollectionViewDelegateFlowLayout>

@property(nonatomic, assign) id delegate;
@property(nonatomic, assign) id brushPreviewDelegate;
@property(nonatomic, weak) EAGLContext *context;
@property(nonatomic, weak) Brush *brush;
@property(nonatomic, retain) BrushState *brushStateBeforeChange;
//@property (retain, nonatomic) NSMutableArray *patterImages;
@property (retain, nonatomic) NSArray *patternImageArray;

@property (strong, nonatomic) IBOutlet UIView *rootView;
@property (weak, nonatomic) IBOutlet UISlider *radiusSlider;
@property (weak, nonatomic) IBOutlet UISlider *radiusJitterSlider;
@property (weak, nonatomic) IBOutlet UISlider *radiusFadeSlider;

@property (weak, nonatomic) IBOutlet UISlider *opacitySlider;
@property (weak, nonatomic) IBOutlet UISlider *flowSlider;
@property (weak, nonatomic) IBOutlet UISlider *flowJitterSlider;
@property (weak, nonatomic) IBOutlet UISlider *flowFadeSlider;
@property (weak, nonatomic) IBOutlet UISlider *roundSlider;
@property (weak, nonatomic) IBOutlet UISlider *roundJitterSlider;
@property (weak, nonatomic) IBOutlet UISlider *angleSlider;
@property (weak, nonatomic) IBOutlet UISlider *angleJitterSlider;
@property (weak, nonatomic) IBOutlet UISlider *angleFadeSlider;
@property (weak, nonatomic) IBOutlet UISlider *hardnessSlider;
@property (weak, nonatomic) IBOutlet UISlider *spacingSlider;
@property (weak, nonatomic) IBOutlet UISlider *scatteringSlider;
@property (weak, nonatomic) IBOutlet UISlider *wetSlider;
@property (weak, nonatomic) IBOutlet UISwitch *dissolveSwitch;
@property (weak, nonatomic) IBOutlet UISwitch *airbrushModeSwitch;
@property (weak, nonatomic) IBOutlet UISwitch *velocitySensorSwitch;
@property (weak, nonatomic) IBOutlet BrushPreview *brushPreview;
@property (weak, nonatomic) IBOutlet UIPageControl *pageControl;
@property (weak, nonatomic) IBOutlet UIScrollView *propertyRootScrollView;
@property (weak, nonatomic) IBOutlet UIScrollView *basicPropertyView;
@property (weak, nonatomic) IBOutlet UIView *patternTextureView;

@end
