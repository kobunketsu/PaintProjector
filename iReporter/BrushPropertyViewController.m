//
//  BrushPropertyViewController.m
//  PaintProjector
//
//  Created by 胡 文杰 on 13-9-19.
//  Copyright (c) 2013年 WenjiHu. All rights reserved.
//

#import "BrushPropertyViewController.h"

@interface BrushPropertyViewController ()

@end

@implementation BrushPropertyViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidDisappear:(BOOL)animated{
    DebugLog(@"viewDidDisappear");
    [self.brushPreview tearDownGL];
}

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view.
    
    //手动将patternTextureView移动到scrollView Page2
    CGRect frame = self.patternTextureView.frame;
    frame.origin.x = self.propertyRootScrollView.frame.size.width;
    self.patternTextureView.frame = frame;
    
    //pageControl
    self.propertyRootScrollView.delegate = self;
    self.propertyRootScrollView.contentSize = CGSizeMake(512, 640);
    self.basicPropertyView.contentSize = CGSizeMake(256, 720);
    //load pattern textures
    self.patternImageArray = [[NSBundle mainBundle] pathsForResourcesOfType:@"png" inDirectory:@"BrushPatternTexture"];
    
    //brushPreview
    self.brushPreview.delegate = self.brushPreviewDelegate;

    [self.brushPreview setupGL];
    
    [self.brushPreview createStroke:self.brush];
    
    [self flushUI];
    
    self.brushStateBeforeChange = [self.brush.brushState copy];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void)flushUI{
    self.radiusSlider.value = self.brush.brushState.radius;
    self.radiusJitterSlider.value = self.brush.brushState.radiusJitter;
    self.radiusFadeSlider.value = self.brush.brushState.radiusFade;
    self.opacitySlider.value = self.brush.brushState.opacity;
    self.flowSlider.value = self.brush.brushState.flow;
    self.flowJitterSlider.value = self.brush.brushState.flowJitter;
    self.flowFadeSlider.value = self.brush.brushState.flowFade;
    self.roundSlider.value = self.brush.brushState.roundness;
    //    self.roundJitterSlider.value = self.brush.brushState.roundnessJitter;
    self.angleSlider.value = self.brush.brushState.angle;
    self.angleJitterSlider.value = self.brush.brushState.angleJitter;
    self.angleFadeSlider.value = self.brush.brushState.angleFade;
    self.hardnessSlider.value = self.brush.brushState.hardness;
    self.spacingSlider.value = self.brush.brushState.spacing;
    self.scatteringSlider.value = self.brush.brushState.scattering;
    self.wetSlider.value = self.brush.brushState.wet;
    self.dissolveSwitch.on = self.brush.brushState.isDissolve;
    self.airbrushModeSwitch.on = self.brush.brushState.isAirbrush;
    self.velocitySensorSwitch.on = self.brush.brushState.isVelocitySensor;
    [self.brushPreview refresh];
    [self.view setNeedsDisplay];
}

-(void)cancelBrushStateChange{
    self.brush.brushState = self.brushStateBeforeChange;
}

- (IBAction)onRadiusSliderValueChanged:(UISlider *)sender {
    self.brush.brushState.radius = sender.value;
    [self.brushPreview refresh];
    [self.delegate willBrushPropertyValueChanged:self.brush.brushState];
}
- (IBAction)onRadiusJitterSliderValueChanged:(UISlider *)sender {
    self.brush.brushState.radiusJitter = sender.value;
    [self.brushPreview refresh];
    [self.delegate willBrushPropertyValueChanged:self.brush.brushState];
}
- (IBAction)onRadiusFadeSliderValueChanged:(UISlider *)sender {
    self.brush.brushState.radiusFade = sender.value;
    [self.brushPreview refresh];
    [self.delegate willBrushPropertyValueChanged:self.brush.brushState];
}
- (IBAction)onOpacitySliderValueChanged:(UISlider *)sender {
    self.brush.brushState.opacity = sender.value;
    [self.brushPreview refresh];
    [self.delegate willBrushPropertyValueChanged:self.brush.brushState];
}

- (IBAction)onFlowSliderValueChanged:(UISlider *)sender {
    self.brush.brushState.flow = sender.value;
    [self.brushPreview refresh];
    [self.delegate willBrushPropertyValueChanged:self.brush.brushState];
}
- (IBAction)onFlowJitterSliderValueChanged:(UISlider *)sender {
    self.brush.brushState.flowJitter = sender.value;
    [self.brushPreview refresh];
    [self.delegate willBrushPropertyValueChanged:self.brush.brushState];
}
- (IBAction)onFlowFadeSliderValueChanged:(UISlider *)sender {
    self.brush.brushState.flowFade = sender.value;
    [self.brushPreview refresh];
    [self.delegate willBrushPropertyValueChanged:self.brush.brushState];
}
- (IBAction)onRoundSliderValueChanged:(UISlider *)sender {
    self.brush.brushState.roundness = sender.value;
    [self.brushPreview refresh];
    [self.delegate willBrushPropertyValueChanged:self.brush.brushState];
}
- (IBAction)onRoundJitterSliderValueChanged:(UISlider *)sender {
//    self.brush.brushState.radius = sender.value;
    [self.brushPreview refresh];
    [self.delegate willBrushPropertyValueChanged:self.brush.brushState];
}
- (IBAction)onAngleSliderValueChanged:(UISlider *)sender {
    self.brush.brushState.angle = sender.value;
    [self.brushPreview refresh];
    [self.delegate willBrushPropertyValueChanged:self.brush.brushState];
}
- (IBAction)onAngleJitterSliderValueChanged:(UISlider *)sender {
    self.brush.brushState.angleJitter = sender.value;
    [self.brushPreview refresh];
    [self.delegate willBrushPropertyValueChanged:self.brush.brushState];
}
- (IBAction)onAngleFadeSliderValueChanged:(UISlider *)sender {
    self.brush.brushState.angleFade = sender.value;
    [self.brushPreview refresh];
    [self.delegate willBrushPropertyValueChanged:self.brush.brushState];
}
- (IBAction)onHardnessSliderValueChanged:(UISlider *)sender {
    self.brush.brushState.hardness = sender.value;
    [self.brushPreview refresh];
    [self.delegate willBrushPropertyValueChanged:self.brush.brushState];
}
- (IBAction)onSpacingSliderValueChanged:(UISlider *)sender {
    self.brush.brushState.spacing = sender.value;
    [self.brushPreview refresh];
    [self.delegate willBrushPropertyValueChanged:self.brush.brushState];
}
- (IBAction)onScatteringSliderValueChanged:(UISlider *)sender {
    self.brush.brushState.scattering = sender.value;
    [self.brushPreview refresh];
    [self.delegate willBrushPropertyValueChanged:self.brush.brushState];
}
- (IBAction)onDissolveSwitchValueChanged:(UISwitch *)sender {
    self.brush.brushState.isDissolve = sender.isOn;
    [self.brushPreview refresh];
    [self.delegate willBrushPropertyValueChanged:self.brush.brushState];
    [self.delegate willBrushShaderChanged:self.brush.brushState];
}
- (IBAction)onWetSwitchValueChanged:(UISlider *)sender {
    if ((sender.value == 0 && self.brush.brushState.wet > 0) ||
        (sender.value > 0 && self.brush.brushState.wet == 0)) {
        [self.delegate willBrushShaderChanged:self.brush.brushState];
    }
    self.brush.brushState.wet = sender.value;
    [self.brushPreview refresh];
    [self.delegate willBrushPropertyValueChanged:self.brush.brushState];

}
- (IBAction)onAirBrushModeSwitchValueChanged:(UISwitch *)sender {
    self.brush.brushState.isAirbrush = sender.isOn;
    [self.brushPreview refresh];
    [self.delegate willBrushPropertyValueChanged:self.brush.brushState];
}
- (IBAction)onVelocitySensorSwitchValueChanged:(UISwitch *)sender {
    self.brush.brushState.isVelocitySensor = sender.isOn;
    [self.brushPreview refresh];
    [self.delegate willBrushPropertyValueChanged:self.brush.brushState];
}
- (IBAction)onCancelButtonTouchUpInside:(UIButton *)sender {
    [self cancelBrushStateChange];
    
    [self.delegate willDismissBrushPropertyViewController];
}
- (IBAction)onResetButtonTouchUpInside:(UIButton *)sender {
    [self.brush resetDefaultBrushState];
    
    [self flushUI];
    [self.delegate willBrushPropertyValueChanged:self.brush.brushState];
}
- (IBAction)onOKButtonTouchUpInside:(UIButton *)sender {
    [self.delegate willDismissBrushPropertyViewController];
}

#pragma mark- ScrollView Delegate
-(void)scrollViewDidScroll:(UIScrollView *)scrollView{
//    DebugLog(@"[scrollViewDidScroll] contentOffset %@", NSStringFromCGPoint(scrollView.contentOffset));
    self.pageControl.currentPage = floorf(scrollView.contentOffset.x / scrollView.frame.size.width);

}
- (IBAction)pageControlValueChanged:(UIPageControl *)sender {
//    DebugLog(@"[pageControlPaged]");
    [UIView animateWithDuration:0.3 delay:0 options:UIViewAnimationOptionCurveEaseInOut|UIViewAnimationOptionBeginFromCurrentState animations:^{
        self.propertyRootScrollView.contentOffset = CGPointMake(sender.currentPage * self.propertyRootScrollView.frame.size.width, 0);
    } completion:nil];
}


#pragma mark- PatternTextureCollectionView DataSource
- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    
    return self.patternImageArray.count;
}

- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView {
    
    return 1;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    
    UICollectionViewCell *cell = (UICollectionViewCell*) [collectionView dequeueReusableCellWithReuseIdentifier:@"PatterTextureCell"
                                                                                 forIndexPath:indexPath];
//    if (cell == nil) {
//        cell = [[UICollectionViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellIdentifier];
//    }
    
    NSString *imageName = [self.patternImageArray objectAtIndex:indexPath.row];
    NSString *path = @"BrushPatternTexture";
    path = [path stringByAppendingPathComponent:imageName.lastPathComponent];

    float size = [self brushPatternSizeFromFileName:imageName.lastPathComponent];
    UIImage *image = [UIImage imageNamed:path];
    UIView *contextView = cell.contentView;
    CGPoint center = contextView.center;
    contextView.bounds = CGRectMake(0,0, size, size);
    contextView.center = center;
    contextView.backgroundColor = [UIColor colorWithPatternImage:image];
    cell.backgroundColor = [UIColor grayColor];
    
    return cell;
}
#pragma mark- PatternTextureCollectionView Delegate
- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath{
//    DebugLog(@"[didSelectItemAtIndexPath] row:%d", indexPath.row);
    NSString *imageName = [self.patternImageArray objectAtIndex:indexPath.row];
    NSString *path = @"BrushPatternTexture";
    path = [path stringByAppendingPathComponent:imageName.lastPathComponent];

    [self.brush setBrushShapeTexture:path];
    
    float size = [self brushPatternSizeFromFileName:imageName.lastPathComponent];
    self.brush.brushState.radius = size * 0.5;
    
    [self flushUI];
    [self.brushPreview refresh];
}

-(float)brushPatternSizeFromFileName:(NSString*)name{
    NSString *strSize = [[[name stringByDeletingPathExtension] componentsSeparatedByString:@"_"]lastObject];
    return [strSize floatValue];
}
@end
