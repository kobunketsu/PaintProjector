//
//  SetupViewController.m
//  PaintProjector
//
//  Created by 胡 文杰 on 2/16/14.
//  Copyright (c) 2014 WenjiHu. All rights reserved.
//

#import "CylinderProjectSetupViewController.h"
#import "UnitConverter.h"

@interface CylinderProjectSetupViewController ()
@property(nonatomic, retain) NSString *keyPath;
@property (retain, nonatomic) Animation *resetAnimation;
@end

@implementation CylinderProjectSetupViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view.
    self.valueSlider.hidden = true;
    
    if (!self.userInputParams) {
        DebugLog(@"userInputParams not set");
    }
    else{
        USUnit unit = [UnitConverter usUnitFromMeter:self.userInputParams.cylinderDiameter];
        NSString *string = self.cylinderDiameterButton.titleLabel.text;
        self.cylinderDiameterButton.titleLabel.text = [NSString stringWithFormat:@"'%.f ''%.1f", unit.feet, unit.inch];
        
        unit = [UnitConverter usUnitFromMeter:self.userInputParams.cylinderHeight];
        self.cylinderHeightButton.titleLabel.text = [NSString stringWithFormat:@"'%.f ''%.1f", unit.feet, unit.inch];
        
        unit = [UnitConverter usUnitFromMeter:self.userInputParams.imageWidth];
        self.imageWidthButton.titleLabel.text = [NSString stringWithFormat:@"'%.f ''%.1f", unit.feet, unit.inch];
        
        unit = [UnitConverter usUnitFromMeter:self.userInputParams.imageCenterOnSurfHeight];
        self.imageHeightButton.titleLabel.text = [NSString stringWithFormat:@"'%.f ''%.1f", unit.feet, unit.inch];
        
        unit = [UnitConverter usUnitFromMeter:self.userInputParams.eyeHonrizontalDistance];
        self.eyeDistanceButton.titleLabel.text = [NSString stringWithFormat:@"'%.f ''%.1f", unit.feet, unit.inch];
        
        unit = [UnitConverter usUnitFromMeter:self.userInputParams.eyeVerticalHeight];
        self.eyeHeightButton.titleLabel.text = [NSString stringWithFormat:@"'%.f ''%.1f", unit.feet, unit.inch];
        
        unit = [UnitConverter usUnitFromMeter:self.userInputParams.unitZoom];
        self.unitZoomButton.titleLabel.text = [NSString stringWithFormat:@"'%.f ''%.1f", unit.feet, unit.inch];
    }
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)openUserInputParamValueSlider:(NSString*)keyPath minValue:(CGFloat)minValue maxValue:(CGFloat)maxValue{
    self.valueSlider.hidden = false;
    self.valueSlider.minimumValue = minValue;
    self.valueSlider.maximumValue = maxValue;
    NSNumber *num = [self valueForKeyPath:keyPath];
    self.valueSlider.value = num.floatValue;
    self.keyPath = keyPath;
}

- (void)closeUserInputParamValueSlider{
    self.valueSlider.hidden = true;
}

- (IBAction)userInputParamButtonTouchUp:(UIButton *)sender {
    for (UIButton *button in self.allUserInputParamButtons) {
        if (![button isEqual:sender]) {
            button.selected = false;
        }
    }
    sender.selected = !sender.selected;
//    DebugLog(@"sender.selected %i", sender.selected);

    NSString *userInputParamKey = nil;
    CGFloat minValue = 0;
    CGFloat maxValue = 1;
    if ([sender isEqual:self.cylinderDiameterButton]) {
        userInputParamKey = @"userInputParams.cylinderDiameter";
        minValue = 0.038;
        maxValue = 0.38;
    }
    else if ([sender isEqual:self.cylinderHeightButton]) {
        userInputParamKey = @"userInputParams.cylinderHeight";
        minValue = 0.068;
        maxValue = 0.68;
    }
    else if ([sender isEqual:self.imageWidthButton]) {
        userInputParamKey = @"userInputParams.imageWidth";
        minValue = 0.037;
        maxValue = 0.37;
    }
    else if ([sender isEqual:self.imageHeightButton]) {
        userInputParamKey = @"userInputParams.imageCenterOnSurfHeight";
        minValue = 0.035;
        maxValue = 0.35;
    }
    else if ([sender isEqual:self.eyeDistanceButton]) {
        userInputParamKey = @"userInputParams.eyeHonrizontalDistance";
        minValue = 0.35;
        maxValue = 3.5;
    }
    else if ([sender isEqual:self.eyeHeightButton]) {
        userInputParamKey = @"userInputParams.eyeHonrizontalDistance";
        minValue = 0.35;
        maxValue = 3.5;
    }
    else if ([sender isEqual:self.unitZoomButton]) {
        userInputParamKey = @"userInputParams.unitZoom";
        minValue = 0.01;
        maxValue = 1;
    }
    
    if (sender.selected) {
        [self openUserInputParamValueSlider:userInputParamKey minValue:minValue maxValue:maxValue];
    }
    else{
        [self closeUserInputParamValueSlider];
    }

}

- (IBAction)userInputParamSliderValueChanged:(UISlider *)sender {
    [self setValue:[NSNumber numberWithFloat:sender.value] forKeyPath:self.keyPath];
}

-(void)resetInputParams{
    NSMutableDictionary *dic = [[NSMutableDictionary alloc]init];
    [dic setObject:[NSNumber numberWithFloat:0.038] forKey:@"userInputParams.cylinderDiameter"];
    [dic setObject:[NSNumber numberWithFloat:0.068] forKey:@"userInputParams.cylinderHeight"];
    [dic setObject:[NSNumber numberWithFloat:0.037] forKey:@"userInputParams.imageWidth"];
    [dic setObject:[NSNumber numberWithFloat:0.035] forKey:@"userInputParams.imageCenterOnSurfHeight"];
    [dic setObject:[NSNumber numberWithFloat:0.35] forKey:@"userInputParams.eyeHonrizontalDistance"];
    [dic setObject:[NSNumber numberWithFloat:0.4] forKey:@"userInputParams.eyeVerticalHeight"];
    [dic setObject:[NSNumber numberWithFloat:1] forKey:@"userInputParams.unitZoom"];
    
    AnimationClip *animClip = [[AnimationClip alloc]init];
    animClip.name = @"userInputParamsResetAnimClip";
    NSEnumerator *enumeratorKey = [dic keyEnumerator];
    for (NSObject *key in enumeratorKey) {
        NSNumber *num = [dic objectForKey:key];
        
        TPPropertyAnimation *propAnim = [TPPropertyAnimation propertyAnimationWithKeyPath:(NSString*)key];
        propAnim.fromValue = [self valueForKeyPath:(NSString*)key];
        propAnim.toValue = num;
        propAnim.duration = 0.5;
        propAnim.target = self;
        propAnim.timing = TPPropertyAnimationTimingEaseOut;
        [animClip addPropertyAnimation:propAnim];
    }
    
    TPPropertyAnimation* propAnim = animClip.propertyAnimations.firstObject;
    propAnim.delegate = self.parentViewController;
    
    self.resetAnimation = [Animation animationWithAnimClip:animClip];
    self.resetAnimation.target = self;
    [self.resetAnimation play];
}

//- (void)setUserInputParams:(CylinderProjectUserInputParams *)userInputParams{
//    
//}
@end
