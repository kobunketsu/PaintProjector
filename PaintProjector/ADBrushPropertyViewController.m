//
//  BrushPropertyViewController.m
//  PaintProjector
//
//  Created by 胡 文杰 on 13-9-19.
//  Copyright (c) 2013年 WenjiHu. All rights reserved.
//

#import "ADBrushPropertyViewController.h"
#import "ADBrushPropertyTableViewCell.h"

@interface ADBrushPropertyViewController ()

@end

@implementation ADBrushPropertyViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidDisappear:(BOOL)animated{
    DebugLogSystem(@"viewDidDisappear");
    [self.brushPreview tearDownGL];
}

- (void)initPatternTexture{
    //手动将patternTextureView移动到scrollView Page2
    CGRect frame = self.patternTextureView.frame;
    frame.origin.x = self.propertyRootScrollView.frame.size.width;
    self.patternTextureView.frame = frame;
    
    //load pattern textures
    self.patternImageArray = [[NSBundle mainBundle] pathsForResourcesOfType:@"png" inDirectory:@"BrushPatternTexture"];
}
- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view.
    
//    [self initPatternTexture];
    self.sectionHeaderTitleLabel.text = NSLocalizedString(NSStringFromClass([self.brush class]), nil);
    
    //pageControl
    self.propertyRootScrollView.delegate = self;
    self.propertyRootScrollView.contentSize = CGSizeMake(256, 640);
    self.basicPropertyView.contentSize = CGSizeMake(256, 720);
    
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
    self.dissolveSwitch.on = self.brush.brushState.isPatternTexture;
    self.airbrushModeSwitch.on = self.brush.brushState.isAirbrush;
    self.velocitySensorSwitch.on = self.brush.brushState.isVelocitySensor;
    
    [self.basicPropertyTableView reloadData];
    [self.brushPreview refreshStroke];
    [self.view setNeedsDisplay];
}

-(void)cancelBrushStateChange{
    self.brush.brushState = self.brushStateBeforeChange;
}

- (IBAction)onRadiusSliderValueChanged:(UISlider *)sender {
    self.brush.brushState.radius = sender.value;
    [self.brushPreview refreshStroke];
    [self.delegate willBrushPropertyValueChanged:self.brush.brushState];
}
- (IBAction)onRadiusJitterSliderValueChanged:(UISlider *)sender {
    self.brush.brushState.radiusJitter = sender.value;
    [self.brushPreview refreshStroke];
    [self.delegate willBrushPropertyValueChanged:self.brush.brushState];
}
- (IBAction)onRadiusFadeSliderValueChanged:(UISlider *)sender {
    self.brush.brushState.radiusFade = sender.value;
    [self.brushPreview refreshStroke];
    [self.delegate willBrushPropertyValueChanged:self.brush.brushState];
}
- (IBAction)onOpacitySliderValueChanged:(UISlider *)sender {
    self.brush.brushState.opacity = sender.value;
    [self.brushPreview refreshStroke];
    [self.delegate willBrushPropertyValueChanged:self.brush.brushState];
}

- (IBAction)onFlowSliderValueChanged:(UISlider *)sender {
    self.brush.brushState.flow = sender.value;
    [self.brushPreview refreshStroke];
    [self.delegate willBrushPropertyValueChanged:self.brush.brushState];
}
- (IBAction)onFlowJitterSliderValueChanged:(UISlider *)sender {
    self.brush.brushState.flowJitter = sender.value;
    [self.brushPreview refreshStroke];
    [self.delegate willBrushPropertyValueChanged:self.brush.brushState];
}
- (IBAction)onFlowFadeSliderValueChanged:(UISlider *)sender {
    self.brush.brushState.flowFade = sender.value;
    [self.brushPreview refreshStroke];
    [self.delegate willBrushPropertyValueChanged:self.brush.brushState];
}
- (IBAction)onRoundSliderValueChanged:(UISlider *)sender {
    self.brush.brushState.roundness = sender.value;
    [self.brushPreview refreshStroke];
    [self.delegate willBrushPropertyValueChanged:self.brush.brushState];
}
- (IBAction)onRoundJitterSliderValueChanged:(UISlider *)sender {
//    self.brush.brushState.radius = sender.value;
    [self.brushPreview refreshStroke];
    [self.delegate willBrushPropertyValueChanged:self.brush.brushState];
}
- (IBAction)onAngleSliderValueChanged:(UISlider *)sender {
    self.brush.brushState.angle = sender.value;
    [self.brushPreview refreshStroke];
    [self.delegate willBrushPropertyValueChanged:self.brush.brushState];
}
- (IBAction)onAngleJitterSliderValueChanged:(UISlider *)sender {
    self.brush.brushState.angleJitter = sender.value;
    [self.brushPreview refreshStroke];
    [self.delegate willBrushPropertyValueChanged:self.brush.brushState];
}
- (IBAction)onAngleFadeSliderValueChanged:(UISlider *)sender {
    self.brush.brushState.angleFade = sender.value;
    [self.brushPreview refreshStroke];
    [self.delegate willBrushPropertyValueChanged:self.brush.brushState];
}
- (IBAction)onHardnessSliderValueChanged:(UISlider *)sender {
    self.brush.brushState.hardness = sender.value;
    [self.brushPreview refreshStroke];
    [self.delegate willBrushPropertyValueChanged:self.brush.brushState];
}
- (IBAction)onSpacingSliderValueChanged:(UISlider *)sender {
    self.brush.brushState.spacing = sender.value;
    [self.brushPreview refreshStroke];
    [self.delegate willBrushPropertyValueChanged:self.brush.brushState];
}
- (IBAction)onScatteringSliderValueChanged:(UISlider *)sender {
    self.brush.brushState.scattering = sender.value;
    [self.brushPreview refreshStroke];
    [self.delegate willBrushPropertyValueChanged:self.brush.brushState];
}
- (IBAction)onPatternSwitchValueChanged:(UISwitch *)sender {
    self.brush.brushState.isPatternTexture = sender.isOn;
    [self.brushPreview refreshStroke];
    [self.delegate willBrushPropertyValueChanged:self.brush.brushState];
    [self.delegate willBrushShaderChanged:self.brush.brushState];
}
- (IBAction)onWetSwitchValueChanged:(UISlider *)sender {
    if ((sender.value == 0 && self.brush.brushState.wet > 0) ||
        (sender.value > 0 && self.brush.brushState.wet == 0)) {
        [self.delegate willBrushShaderChanged:self.brush.brushState];
    }
    self.brush.brushState.wet = sender.value;
    [self.brushPreview refreshStroke];
    [self.delegate willBrushPropertyValueChanged:self.brush.brushState];

}
- (IBAction)onAirBrushModeSwitchValueChanged:(UISwitch *)sender {
    self.brush.brushState.isAirbrush = sender.isOn;
    [self.brushPreview refreshStroke];
    [self.delegate willBrushPropertyValueChanged:self.brush.brushState];
}
- (IBAction)onVelocitySensorSwitchValueChanged:(UISwitch *)sender {
    self.brush.brushState.isVelocitySensor = sender.isOn;
    [self.brushPreview refreshStroke];
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
#pragma mark- UITableViewDataSource
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return 18;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    static NSString *CellIdentifier = @"BrushPropertyTableViewCell";
    
    ADBrushPropertyTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    if (cell == nil) {
        cell = [[ADBrushPropertyTableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellIdentifier];
    }
    
    NSString *label;
    BOOL isSmall = NO;
    CGFloat sliderValue = 0;
    BOOL isSwitch = NO;
    BOOL switchValue = NO;
    CGFloat minValue = 0;
    CGFloat maxValue = 1;
    //configure table view cell
    switch (indexPath.row) {
        case 0:
            label = NSLocalizedString(@"Radius", nil);
            sliderValue = self.brush.brushState.radius;
            minValue = 1;
            maxValue = 100;
            isSwitch = NO;
            break;
        case 1:
            label = NSLocalizedString(@"Noise", nil);
            isSmall = YES;
            sliderValue = self.brush.brushState.radiusJitter;
            minValue = 0;
            maxValue = 1;
            isSwitch = NO;
            break;
        case 2:
            label = NSLocalizedString(@"Fade", nil);
            isSmall = YES;
            sliderValue = self.brush.brushState.radiusFade;
            minValue = 0;
            maxValue = 1000;
            isSwitch = NO;
            break;
        case 3:
            label = NSLocalizedString(@"Opacity", nil);
            sliderValue = self.brush.brushState.opacity;
            minValue = 0;
            maxValue = 1.0;
            isSwitch = NO;
            break;
        case 4:
            label = NSLocalizedString(@"Flow", nil);
            sliderValue = self.brush.brushState.flow;
            minValue = 0;
            maxValue = 1;
            isSwitch = NO;
            break;
        case 5:
            label = NSLocalizedString(@"Noise", nil);
            sliderValue = self.brush.brushState.flowJitter;
            minValue = 0;
            maxValue = 1;
            isSmall = YES;
            isSwitch = NO;
            break;
        case 6:
            label = NSLocalizedString(@"Fade", nil);
            sliderValue = self.brush.brushState.flowFade;
            minValue = 0;
            maxValue = 1000;
            isSmall = YES;
            isSwitch = NO;
            break;
        case 7:
            label = NSLocalizedString(@"Angle", nil);
            sliderValue = self.brush.brushState.angle;
            minValue = 0;
            maxValue = 360;
            isSwitch = NO;
            break;
        case 8:
            label = NSLocalizedString(@"Noise", nil);
            sliderValue = self.brush.brushState.angleJitter;
            minValue = 0;
            maxValue = 1;
            isSmall = YES;
            isSwitch = NO;
            break;
        case 9:
            label = NSLocalizedString(@"Fade", nil);
            sliderValue = self.brush.brushState.radiusFade;
            minValue = 0;
            maxValue = 1000;
            isSmall = YES;
            isSwitch = NO;
            break;
        case 10:
            label = NSLocalizedString(@"Round", nil);
            sliderValue = self.brush.brushState.roundness;
            minValue = 0;
            maxValue = 1;
            isSwitch = NO;
            break;
        case 11:
            label = NSLocalizedString(@"Hard", nil);
            sliderValue = self.brush.brushState.hardness;
            minValue = 0;
            maxValue  =1;
            isSwitch = NO;
            break;
        case 12:
            label = NSLocalizedString(@"Spacing", nil);
            sliderValue = self.brush.brushState.spacing;
            minValue = 0.05;
            maxValue = 5;
            isSwitch = NO;
            break;
        case 13:
            label = NSLocalizedString(@"Scatter", nil);
            sliderValue = self.brush.brushState.scattering;
            minValue = 0;
            maxValue = 10;
            isSwitch = NO;
            break;
        case 14:
            label = NSLocalizedString(@"Wet", nil);
            sliderValue = self.brush.brushState.wet;
            minValue = 0;
            maxValue = 1;
            isSwitch = NO;
            break;
        case 15:
            label = NSLocalizedString(@"Dither", nil);
            switchValue = self.brush.brushState.isPatternTexture;
            isSwitch = YES;
            break;
        case 16:
            label = NSLocalizedString(@"AirBrush", nil);
            switchValue = self.brush.brushState.isAirbrush;
            isSwitch = YES;
            break;
        case 17:
            label = NSLocalizedString(@"VelSensor", nil);
            switchValue = self.brush.brushState.isVelocitySensor;
            isSwitch = YES;
            break;
        default:
            break;
    }
    
    cell.propertyNameLabel.text = label;
    cell.propertyNameLabel.textColor = [UIColor darkGrayColor];
    if (isSmall) {
        cell.propertyNameLabel.textAlignment = NSTextAlignmentRight;
        [cell.propertyNameLabel setFont:[UIFont systemFontOfSize:14]];
    }
    else{
        cell.propertyNameLabel.textAlignment = NSTextAlignmentLeft;
        [cell.propertyNameLabel setFont:[UIFont systemFontOfSize:19]];
    }
    
    if (isSwitch) {
        cell.propertyValueSwitch.hidden = false;
        cell.propertyValueSlider.hidden = true;
        cell.propertyValueSwitch.on = switchValue;
        cell.propertyValueSwitch.tag = indexPath.row;
    }
    else{
        cell.propertyValueSwitch.hidden = true;
        cell.propertyValueSlider.hidden = false;
        cell.propertyValueSlider.value = sliderValue;
        cell.propertyValueSlider.minimumValue = minValue;
        cell.propertyValueSlider.maximumValue = maxValue;
        cell.propertyValueSlider.tag = indexPath.row;
    }
   
    return cell;
}
#pragma mark- UITableViewDelegate
//- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section{
//    self.sectionHeaderTitleLabel.text = NSLocalizedString(@"Property", nil);
//    return self.sectionHeaderView;
//}
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
    [self.brushPreview refreshStroke];
}

-(float)brushPatternSizeFromFileName:(NSString*)name{
    NSString *strSize = [[[name stringByDeletingPathExtension] componentsSeparatedByString:@"_"]lastObject];
    return [strSize floatValue];
}
- (IBAction)propertyValueSliderValueChanged:(UISlider *)sender {
    switch (sender.tag) {
        case 0:
            [self onRadiusSliderValueChanged:sender];
            break;
        case 1:
            [self onRadiusJitterSliderValueChanged:sender];
            break;
        case 2:
            [self onRadiusFadeSliderValueChanged:sender];
            break;
        case 3:
            [self onOpacitySliderValueChanged:sender];
            break;
        case 4:
            [self onFlowSliderValueChanged:sender];
            break;
        case 5:
            [self onFlowJitterSliderValueChanged:sender];
            break;
        case 6:
            [self onFlowFadeSliderValueChanged:sender];
            break;
        case 7:
            [self onAngleSliderValueChanged:sender];
            break;
        case 8:
            [self onAngleJitterSliderValueChanged:sender];
            break;
        case 9:
            [self onAngleFadeSliderValueChanged:sender];
            break;
        case 10:
            [self onRoundSliderValueChanged:sender];
            break;
        case 11:
            [self onHardnessSliderValueChanged:sender];
            break;
        case 12:
            [self onSpacingSliderValueChanged:sender];
            break;
        case 13:
            [self onScatteringSliderValueChanged:sender];
            break;
        case 14:
            [self onWetSwitchValueChanged:sender];
            break;
        default:
            break;
    }
}

- (IBAction)propertyValueSwitchValueChanged:(UISwitch *)sender {
    switch (sender.tag) {
        case 15:
            [self onPatternSwitchValueChanged:sender];
            break;
        case 16:
            [self onAirBrushModeSwitchValueChanged:sender];
            break;
        case 17:
            [self onVelocitySensorSwitchValueChanged:sender];
            break;
        default:
            break;
    }
}
@end
