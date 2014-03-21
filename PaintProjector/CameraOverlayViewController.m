//
//  CameraOverlayViewController.m
//  PaintProjector
//
//  Created by 文杰 胡 on 13-2-23.
//  Copyright (c) 2013年 Marin Todorov. All rights reserved.
//

#import "CameraOverlayViewController.h"

@interface CameraOverlayViewController ()

@end

@implementation CameraOverlayViewController

//- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
//{
//    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
//    if (self) {
//        // Custom initialization
//        self.context = [[EAGLContext alloc] initWithAPI:kEAGLRenderingAPIOpenGLES2];
//        if (!self.context) {
//            DebugLog(@"Failed to create ES context");
//        }
//        //初始化绘图环境
//        //        [self setupGL];          
//       
//    }
//    return self;
//}

- (id)initWithCoder:(NSCoder *)aDecoder{
    self = [super initWithCoder:aDecoder];
    if (self) {
//        self.context = [[EAGLContext alloc] initWithAPI:kEAGLRenderingAPIOpenGLES2];
//        if (!self.context) {
//            DebugLog(@"Failed to create ES context");
//        }
        //初始化绘图环境
//        [self setupGL];          
        
        
       
    }
    return self;    
}
- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view.
//    GLKView *view = (GLKView *)self.view;
//    view.context = self.context;
//    view.drawableDepthFormat = GLKViewDrawableDepthFormat24;    
//    view.delegate = self;        
    
//    [EAGLContext setCurrentContext:_context];            
    
    
    _minViewAngleY = M_PI_2 - DEGREES_TO_RADIANS(HumanEyeFOV * 0.5 * 1.1);
    
    _motionManager = [[CMMotionManager alloc]init];
    NSOperationQueue *aQueue=[[NSOperationQueue alloc]init];
    if (!_motionManager.deviceMotionAvailable) {
        //pop message box
        DebugLog(@"motion manager not available!");
    }
    

    _motionManager.deviceMotionUpdateInterval = 0.01;
    if (![_motionManager isDeviceMotionActive]) {
//        [_motionManager setShowsDeviceMovementDisplay:true];
        [_motionManager startDeviceMotionUpdatesToQueue:aQueue withHandler:
         ^(CMDeviceMotion *motion, NSError *error){
             if (motion) {
                 _attitude = motion.attitude;
                 _lastYaw = _attitude.yaw;                 
                 _lastPitch = _attitude.pitch;
                 _lastRoll = _attitude.roll;
                 
//                 DebugLog(@"attitude yaw: %.1f  pitch: %.1f  roll: %.1f", _attitude.yaw, _attitude.pitch, _attitude.roll);                
                 CameraOverlayView* camOverlayView = (CameraOverlayView*)self.view;
                 camOverlayView.shotPitch = _attitude.pitch;

                 dispatch_async(dispatch_get_main_queue(), ^{
                     _lblYaw.text = [NSString stringWithFormat:@"Yaw : %.1f", (float)(RADIANS_TO_DEGREES(_attitude.yaw))] ;                     
                     _lblPitch.text = [NSString stringWithFormat:@"Pitch : %.1f", (float)(RADIANS_TO_DEGREES(_attitude.pitch))] ;
                     _lblRoll.text = [NSString stringWithFormat:@"Roll : %.1f", (float)(RADIANS_TO_DEGREES(_attitude.roll))] ;
                     
                     if (_attitude.pitch > _minViewAngleY) {
                         _lblWarnig.text = @"Please Head Down Camera";
                     }
                     else {
                         _lblWarnig.text =@"";
                     }
//                     if (fabsf(RADIANS_TO_DEGREES(_attitude.yaw))>10.0f) {
//                        _lblWarnig.text = [NSString stringWithFormat:@"Keep Horizonal!"] ;
//                     }
//                     else {
//                         _lblWarnig.text =@"";
//                     }
                 });                    
             }  
         }];
    }     
}

- (void)viewDidUnload
{
    [self setLblPitch:nil];
    [self setLblRoll:nil];
    [self setLblYaw:nil];
    [self setLblWarnig:nil];
    [super viewDidUnload];
    // Release any retained subviews of the main view.
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
	return YES;
}

//- (void)
//- (void)glkView:(GLKView *)view drawInRect:(CGRect)rect{
//    
//    [EAGLContext setCurrentContext:_context]; 
//    glClearColor(1.0f, 0.0f, 0.0f, 1.0f);
//    glClear(GL_COLOR_BUFFER_BIT | GL_DEPTH_BUFFER_BIT); 
//}
@end
