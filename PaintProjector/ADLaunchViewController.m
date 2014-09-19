//
//  ADLaunchViewController.m
//  PaintProjector
//
//  Created by 胡 文杰 on 9/9/14.
//  Copyright (c) 2014 WenjiHu. All rights reserved.
//

#import "ADLaunchViewController.h"
#import "ADSimpleTutorialViewController.h"
#import "ADPaintCollectionViewController.h"
#import "ADSimpleTutorialManager.h"
#import "AppDelegate.h"

#define AnaDrawLogoToTitleAnimDuration 0.6

@interface ADLaunchViewController ()
@property(retain, nonatomic) ADRootCanvasBackgroundView *backgroundView;

@property(retain, nonatomic) NSMutableArray *titleTransforms;
@property(retain, nonatomic) NSMutableArray *midTransforms;
@property(retain, nonatomic) NSMutableArray *logoTransforms;

@end

@implementation ADLaunchViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (CATransform3D)transformT:(CATransform3D)t withTranslationX:(CGFloat)tx y:(CGFloat)ty z:(CGFloat)tz rotationX:(CGFloat)rx y:(CGFloat)ry z:(CGFloat)rz scaleX:(CGFloat)sx y:(CGFloat)sy z:(CGFloat)sz{
    CATransform3D result = CATransform3DTranslate(t, tx, ty, tz);
    result = CATransform3DRotate(result, DEGREES_TO_RADIANS(rz), 0, 0, 1);
    result = CATransform3DRotate(result, DEGREES_TO_RADIANS(ry), 0, 1, 0);
    result = CATransform3DRotate(result, DEGREES_TO_RADIANS(rx), 1, 0, 0);
    result = CATransform3DScale(result, sx, sy, sz);
    return result;
}


- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.transitionManager = [[ADLaunchToPaintCollectionTransitionManager alloc]init];
    
    self.titleTransforms = [[NSMutableArray alloc]init];
    self.midTransforms = [[NSMutableArray alloc]init];
    self.logoTransforms = [[NSMutableArray alloc]init];
    
    //title
    [self.titleTransforms addObject:[NSValue valueWithCATransform3D:[self transformT:self.title_A1_Ana.layer.transform
                                                                  withTranslationX:192.5 - self.title_A1_Ana.center.x
                                                                                 y:449 - self.title_A1_Ana.center.y
                                                                                 z:0
                                                                         rotationX:0
                                                                                 y:360
                                                                                 z:0
                                                                            scaleX:1
                                                                                 y:1
                                                                                 z:1]]];
    
    [self.titleTransforms addObject:[NSValue valueWithCATransform3D:[self transformT:self.title_n_Ana.layer.transform
                                                                  withTranslationX:261 - self.title_n_Ana.center.x
                                                                                 y:459 - self.title_n_Ana.center.y
                                                                                 z:0
                                                                         rotationX:0
                                                                                 y:0
                                                                                 z:0
                                                                            scaleX:1
                                                                                 y:1
                                                                                 z:1]]];
    
    [self.titleTransforms addObject:[NSValue valueWithCATransform3D:[self transformT:self.title_a2_Ana.layer.transform
                                                                  withTranslationX:324 - self.title_a2_Ana.center.x
                                                                                 y:459 - self.title_a2_Ana.center.y
                                                                                 z:0
                                                                         rotationX:0
                                                                                 y:0
                                                                                 z:0
                                                                            scaleX:1
                                                                                 y:1
                                                                                 z:1]]];
    
    [self.titleTransforms addObject:[NSValue valueWithCATransform3D:[self transformT:self.title_D_Draw.layer.transform
                                                                  withTranslationX:394 - self.title_D_Draw.center.x
                                                                                 y:448 - self.title_D_Draw.center.y
                                                                                 z:0
                                                                         rotationX:0
                                                                                 y:0
                                                                                 z:0
                                                                            scaleX:1
                                                                                 y:1
                                                                                 z:1]]];
    
    [self.titleTransforms addObject:[NSValue valueWithCATransform3D:[self transformT:self.title_r_Draw.layer.transform
                                                                  withTranslationX:450 - self.title_r_Draw.center.x
                                                                                 y:459 - self.title_r_Draw.center.y
                                                                                 z:0
                                                                         rotationX:0
                                                                                 y:0
                                                                                 z:0
                                                                            scaleX:1
                                                                                 y:1
                                                                                 z:1]]];
    
    [self.titleTransforms addObject:[NSValue valueWithCATransform3D:[self transformT:self.title_a_Draw.layer.transform
                                                                  withTranslationX:495 - self.title_a_Draw.center.x
                                                                                 y:459 - self.title_a_Draw.center.y
                                                                                 z:0
                                                                         rotationX:0
                                                                                 y:0
                                                                                 z:360
                                                                            scaleX:1
                                                                                 y:1
                                                                                 z:1]]];
    
    [self.titleTransforms addObject:[NSValue valueWithCATransform3D:[self transformT:self.title_w_Draw.layer.transform
                                                                  withTranslationX:574 - self.title_w_Draw.center.x
                                                                                 y:459 - self.title_w_Draw.center.y
                                                                                 z:0
                                                                         rotationX:0
                                                                                 y:-180
                                                                                 z:0
                                                                            scaleX:1
                                                                                 y:1
                                                                                 z:1]]];
    
    //mid
    [self.midTransforms addObject:[NSValue valueWithCATransform3D:[self transformT:self.title_A1_Ana.layer.transform
                                                                   withTranslationX:265 - self.title_A1_Ana.center.x
                                                                                  y:500 - self.title_A1_Ana.center.y
                                                                                  z:0
                                                                          rotationX:0
                                                                                  y:168
                                                                                  z:80
                                                                             scaleX:0.78
                                                                                  y:0.78
                                                                                  z:1]]];
    
    [self.midTransforms addObject:[NSValue valueWithCATransform3D:[self transformT:self.title_n_Ana.layer.transform
                                                                   withTranslationX:334 - self.title_n_Ana.center.x
                                                                                  y:460 - self.title_n_Ana.center.y
                                                                                  z:0
                                                                          rotationX:0
                                                                                  y:0
                                                                                  z:80
                                                                             scaleX:1
                                                                                  y:0
                                                                                  z:1]]];
    
    [self.midTransforms addObject:[NSValue valueWithCATransform3D:[self transformT:self.title_a2_Ana.layer.transform
                                                                   withTranslationX:360 - self.title_a2_Ana.center.x
                                                                                  y:429 - self.title_a2_Ana.center.y
                                                                                  z:0
                                                                          rotationX:0
                                                                                  y:0
                                                                                  z:80
                                                                             scaleX:0.84
                                                                                  y:0.84
                                                                                  z:1]]];
    
    [self.midTransforms addObject:[NSValue valueWithCATransform3D:[self transformT:self.title_D_Draw.layer.transform
                                                                   withTranslationX:412 - self.title_D_Draw.center.x
                                                                                  y:410 - self.title_D_Draw.center.y
                                                                                  z:0
                                                                          rotationX:-84
                                                                                  y:0
                                                                                  z:32
                                                                             scaleX:1.9
                                                                                  y:1.9
                                                                                  z:1.9]]];
    
    [self.midTransforms addObject:[NSValue valueWithCATransform3D:[self transformT:self.title_r_Draw.layer.transform
                                                                   withTranslationX:404 - self.title_r_Draw.center.x
                                                                                  y:449 - self.title_r_Draw.center.y
                                                                                  z:0
                                                                          rotationX:0
                                                                                  y:0
                                                                                  z:-16
                                                                             scaleX:-1
                                                                                  y:1
                                                                                  z:1]]];
    
    [self.midTransforms addObject:[NSValue valueWithCATransform3D:[self transformT:self.title_a_Draw.layer.transform
                                                                   withTranslationX:457 - self.title_a_Draw.center.x
                                                                                  y:439 - self.title_a_Draw.center.y
                                                                                  z:0
                                                                          rotationX:0
                                                                                  y:0
                                                                                  z:200
                                                                             scaleX:0.84
                                                                                  y:0.84
                                                                                  z:1]]];
    
    [self.midTransforms addObject:[NSValue valueWithCATransform3D:[self transformT:self.title_w_Draw.layer.transform
                                                                   withTranslationX:457 - self.title_w_Draw.center.x
                                                                                  y:482 - self.title_w_Draw.center.y
                                                                                  z:0
                                                                          rotationX:0
                                                                                  y:-84
                                                                                  z:-16
                                                                             scaleX:0.5
                                                                                  y:0.5
                                                                                  z:1]]];

    //logo
    [self.logoTransforms addObject:[NSValue valueWithCATransform3D:[self transformT:self.title_A1_Ana.layer.transform
                                                                   withTranslationX:330 - self.title_A1_Ana.center.x
                                                                                  y:546 - self.title_A1_Ana.center.y
                                                                                  z:0
                                                                          rotationX:0
                                                                                  y:0
                                                                                  z:-150
                                                                             scaleX:0.6
                                                                                  y:0.6
                                                                                  z:1]]];
    
    [self.logoTransforms addObject:[NSValue valueWithCATransform3D:[self transformT:self.title_n_Ana.layer.transform
                                                                   withTranslationX:399 - self.title_n_Ana.center.x
                                                                                  y:460 - self.title_n_Ana.center.y
                                                                                  z:0
                                                                          rotationX:0
                                                                                  y:0
                                                                                  z:30
                                                                             scaleX:-1
                                                                                  y:1
                                                                                  z:1]]];
    
    [self.logoTransforms addObject:[NSValue valueWithCATransform3D:[self transformT:self.title_a2_Ana.layer.transform
                                                                   withTranslationX:392 - self.title_a2_Ana.center.x
                                                                                  y:401 - self.title_a2_Ana.center.y
                                                                                  z:0
                                                                          rotationX:0
                                                                                  y:0
                                                                                  z:-150
                                                                             scaleX:0.7
                                                                                  y:0.7
                                                                                  z:1]]];
    
    [self.logoTransforms addObject:[NSValue valueWithCATransform3D:[self transformT:self.title_D_Draw.layer.transform
                                                                   withTranslationX:434 - self.title_D_Draw.center.x
                                                                                  y:366 - self.title_D_Draw.center.y
                                                                                  z:0
                                                                          rotationX:-180
                                                                                  y:0
                                                                                  z:-60
                                                                             scaleX:1
                                                                                  y:1
                                                                                  z:1]]];
    
    [self.logoTransforms addObject:[NSValue valueWithCATransform3D:[self transformT:self.title_r_Draw.layer.transform
                                                                   withTranslationX:364 - self.title_r_Draw.center.x
                                                                                  y:440 - self.title_r_Draw.center.y
                                                                                  z:0
                                                                          rotationX:0
                                                                                  y:0
                                                                                  z:30
                                                                             scaleX:1
                                                                                  y:1
                                                                                  z:1]]];
    
    [self.logoTransforms addObject:[NSValue valueWithCATransform3D:[self transformT:self.title_a_Draw.layer.transform
                                                                   withTranslationX:424 - self.title_a_Draw.center.x
                                                                                  y:420 - self.title_a_Draw.center.y
                                                                                  z:0
                                                                          rotationX:0
                                                                                  y:0
                                                                                  z:30
                                                                             scaleX:0.7
                                                                                  y:0.7
                                                                                  z:1]]];
    
    [self.logoTransforms addObject:[NSValue valueWithCATransform3D:[self transformT:self.title_w_Draw.layer.transform
                                                                   withTranslationX:356 - self.title_w_Draw.center.x
                                                                                  y:501 - self.title_w_Draw.center.y
                                                                                  z:0
                                                                          rotationX:0
                                                                                  y:0
                                                                                  z:30
                                                                             scaleX:1
                                                                                  y:1
                                                                                  z:1]]];
    
    //logo
    for (UIView *view in self.title_characters) {
        view.layer.transform = ((NSValue*)self.logoTransforms[view.tag]).CATransform3DValue;
        view.layer.zPosition = (view.tag + 1) * 1000;
    }

}
- (void)viewWillAppear:(BOOL)animated{
    [self addBackgroundView];
}
- (void)viewDidAppear:(BOOL)animated{
    [self animateLogoToTitle];
}

- (void)transitionToViewController{
    if([ADSimpleTutorialManager current].isActive){
        ADSimpleTutorialViewController *vc =  [self.storyboard instantiateViewControllerWithIdentifier:@"SimpleTutorialViewController"];
        vc.modalTransitionStyle = UIModalTransitionStyleCrossDissolve;
        vc.delegate = self;
        [self presentViewController:vc animated:true completion:^{
            
        }];
    }
    else{
        ADPaintCollectionViewController *vc =  [self.storyboard instantiateViewControllerWithIdentifier:@"PaintCollectionViewController"];
        //        vc.transitioningDelegate = self;
        vc.modalTransitionStyle = UIModalTransitionStyleCrossDissolve;
        vc.delegate = self;
        [self presentViewController:vc animated:true completion:^{
            
        }];
    }
 
}

- (void)viewDidDisappear:(BOOL)animated{
    [self destroyBackgroundView];
}
- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/
//运行中加载占用内存的大背景图片(如果放在nib中，presentViewController后还留在内存里)
- (void)addBackgroundView{
    ADRootCanvasBackgroundView *backgroundView = [[ADRootCanvasBackgroundView alloc]initWithFrame:self.view.frame];
    self.backgroundView = backgroundView;
    [self.view addSubview:backgroundView];
    [self.view sendSubviewToBack:backgroundView];
}
//运行中卸载占用内存的大背景图片
- (void)destroyBackgroundView{
    [self.backgroundView removeFromSuperview];
    self.backgroundView = nil;
}
- (void)animateLogoToTitle{
    CGFloat targetShadowOpacity = 0.5;
    [UIView animateWithDuration:AnaDrawLogoToTitleAnimDuration animations:^{
        self.title_pencil.alpha = 0;
    }];
    
    [CATransaction begin];
    [CATransaction setAnimationDuration:AnaDrawLogoToTitleAnimDuration];
    [CATransaction setAnimationTimingFunction:[CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseIn]];
    [CATransaction setCompletionBlock:^{
        for (UIView *view in self.title_characters) {
            view.layer.transform = ((NSValue*)self.midTransforms[view.tag]).CATransform3DValue;
        }
        
        [CATransaction begin];
        [CATransaction setAnimationDuration:AnaDrawLogoToTitleAnimDuration];
        [CATransaction setAnimationTimingFunction:[CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseOut]];
        [CATransaction setCompletionBlock:^{
            for (UIView *view in self.title_characters) {
                view.layer.transform = ((NSValue*)self.titleTransforms[view.tag]).CATransform3DValue;
                view.layer.shadowOpacity = targetShadowOpacity;
            }
            
            [UIView animateWithDuration:AnaDrawLogoToTitleAnimDuration delay:AnaDrawLogoToTitleAnimDuration options:UIViewAnimationOptionCurveEaseInOut animations:^{
                for (UIView *view in self.title_characters) {
                    view.alpha = 0;
                }
                
            } completion:^(BOOL finished) {
                [self transitionToViewController];
            }];
        }];
        for (UIView *view in self.title_characters) {
            CABasicAnimation *transformAnim = [CABasicAnimation animationWithKeyPath:@"transform"];
            transformAnim.toValue = self.titleTransforms[view.tag];
            transformAnim.removedOnCompletion = NO;
            transformAnim.fillMode = kCAFillModeForwards;
            [view.layer addAnimation:transformAnim forKey:@"transform"];
            
            CABasicAnimation *opacityAnim = [CABasicAnimation animationWithKeyPath:@"shadowOpacity"];
            opacityAnim.toValue = [NSNumber numberWithFloat:targetShadowOpacity];
            opacityAnim.removedOnCompletion = NO;
            opacityAnim.fillMode = kCAFillModeForwards;
            [view.layer addAnimation:opacityAnim forKey:@"shadowOpacity"];
        }
        
        [CATransaction commit];
 
    }];
    for (UIView *view in self.title_characters) {
        CABasicAnimation *transformAnim = [CABasicAnimation animationWithKeyPath:@"transform"];
        transformAnim.toValue = self.midTransforms[view.tag];
        transformAnim.removedOnCompletion = NO;
        transformAnim.fillMode = kCAFillModeForwards;
        [view.layer addAnimation:transformAnim forKey:@"transform"];
    }
    
    CABasicAnimation *transformAnim = [CABasicAnimation animationWithKeyPath:@"transform.scale"];
    transformAnim.toValue = [NSNumber numberWithFloat:0.9];
    transformAnim.removedOnCompletion = NO;
    transformAnim.fillMode = kCAFillModeForwards;
    [self.title_pencil.layer addAnimation:transformAnim forKey:@"transform.scale"];

    [CATransaction commit];
    

}

#pragma mark- ADSimpleTutorialViewControllerDelegate
- (void)willTutorialViewControllerDissmiss{
    AppDelegate *appDelegate = (AppDelegate *)([UIApplication sharedApplication].delegate);
    [appDelegate destoryTutorialManager];
    
    [self dismissViewControllerAnimated:true completion:^{
        //结束教程自动进入paint collection
    }];
}

//- (void)willTutorialStart{
//    [self dismissViewControllerAnimated:true completion:^{
        //结束教程进入paint collection
//    }];
//}
#pragma mark- ADPaintCollectionViewControllerDelegate
- (void)willTransitionToTutorialVC{
    [self dismissViewControllerAnimated:false completion:^{
        //default to tutorial
        ADSimpleTutorialViewController *vc =  [self.storyboard instantiateViewControllerWithIdentifier:@"SimpleTutorialViewController"];
        vc.modalTransitionStyle = UIModalTransitionStyleCrossDissolve;
        vc.delegate = self;
        [self presentViewController:vc animated:true completion:^{
            
        }];
    }];
}

#pragma mark- UIViewControllerTransitioningDelegate
- (id <UIViewControllerAnimatedTransitioning>)animationControllerForPresentedController:(UIViewController *)presented presentingController:(UIViewController *)presenting sourceController:(UIViewController *)source{
    self.transitionManager.isPresenting = YES;
    return self.transitionManager;
}

- (id <UIViewControllerAnimatedTransitioning>)animationControllerForDismissedController:(UIViewController *)dismissed{
    self.transitionManager.isPresenting = NO;
    return self.transitionManager;
}
#pragma mark-

@end
