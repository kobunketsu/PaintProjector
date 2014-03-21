//
//  ShowPaintOnPlaneViewController.m
//  PaintProjector
//
//  Created by 文杰 胡 on 12-12-16.
//  Copyright (c) 2012年 Marin Todorov. All rights reserved.
//

#import "ShowPaintOnPlaneViewController.h"

@interface ShowPaintOnPlaneViewController ()

@end

@implementation ShowPaintOnPlaneViewController

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
    self.btnScene.backgroundColor = [UIColor colorWithPatternImage:[UIImage imageNamed:@"viewButton.jpg"]];
    if(self.paintImage!=nil){
        [self.showPaintOnPlane layer].contents = (__bridge id)self.paintImage.CGImage;
    }
}

- (void)viewDidUnload
{
    [self setBtnScene:nil];
    [self setLbLength:nil];
    [self setLbWidth:nil];
    [self setShowPaintOnPlane:nil];
    [super viewDidUnload];
    // Release any retained subviews of the main view.
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}


- (IBAction)hanlePanGRShowPaintOnPlane:(UIPanGestureRecognizer *)sender {
    CALayer* layer = [self.showPaintOnPlane layer];    
    currentTranslateX = [[layer valueForKeyPath: @"transform.translation.x"] floatValue];
    currentTranslateY = [[layer valueForKeyPath: @"transform.translation.y"] floatValue];            
    currentScale = [[layer valueForKeyPath: @"transform.scale"] floatValue];        
    CGPoint translation = [sender translationInView:sender.view];
    CGFloat newTranslateX = currentTranslateX + translation.x * currentScale * 0.1;
    CGFloat newTranslateY = currentTranslateY + translation.y * currentScale * 0.1;

    float translateXLimit = (currentScale - 1) * layer.bounds.size.width * 0.5;
    float translateYLimit = (currentScale - 1) * layer.bounds.size.height * 0.5;
    
    if(newTranslateX < -translateXLimit && currentTranslateX >= -translateXLimit){
        newTranslateX = -translateXLimit; 
    }
    if(newTranslateX > translateXLimit && currentTranslateX <= translateXLimit){
        newTranslateX = translateXLimit; 
    } 
    if(newTranslateY < -translateYLimit && currentTranslateY >= -translateYLimit){
        newTranslateY = -translateYLimit; 
    }
    if(newTranslateY > translateYLimit && currentTranslateY <= translateYLimit){
        newTranslateY = translateYLimit;
    }
    
    [layer setValue:[NSNumber numberWithFloat:newTranslateX] forKeyPath:@"transform.translation.x"];
    [layer setValue:[NSNumber numberWithFloat:newTranslateY] forKeyPath:@"transform.translation.y"];    
}

- (IBAction)handlePinchGRShowPaintOnPlane:(UIPinchGestureRecognizer *)sender {
    CALayer* layer = [self.showPaintOnPlane layer];    
    if (sender.state == UIGestureRecognizerStateBegan) {
        currentTranslateX = [[layer valueForKeyPath: @"transform.translation.x"] floatValue];
        currentTranslateY = [[layer valueForKeyPath: @"transform.translation.y"] floatValue];
        currentScale = [[layer valueForKeyPath: @"transform.scale"] floatValue];        
    }
    CGFloat scale = [sender scale];

    CGFloat newScale = currentScale * scale;
    if (newScale < 1.0) {
        newScale = 1.0;
    }
    [layer setValue:[NSNumber numberWithFloat:newScale] forKeyPath:@"transform.scale"];
    
    float k =0;
    if (currentScale>1) {
        k = (newScale-1) / (currentScale-1);
    }

    CGFloat newTranslateX = currentTranslateX * k;
    CGFloat newTranslateY = currentTranslateY * k;
    [layer setValue:[NSNumber numberWithFloat:newTranslateX] forKeyPath:@"transform.translation.x"];
    [layer setValue:[NSNumber numberWithFloat:newTranslateY] forKeyPath:@"transform.translation.y"];    
}

- (IBAction)handleSceneButtonTapped:(UIButton *)sender {
    [self dismissViewControllerAnimated:true completion:^{
        self.paintImage = nil;
    }];
}
@end
