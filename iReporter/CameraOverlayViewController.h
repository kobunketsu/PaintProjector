//
//  CameraOverlayViewController.h
//  iReporter
//
//  Created by 文杰 胡 on 13-2-23.
//  Copyright (c) 2013年 Marin Todorov. All rights reserved.
//

//名称: 照相前景层控制器
//描述: 辅助照相，显示额外信息
//功能:

#import <GLKit/GLKit.h>
#import <UIKit/UIKit.h>
#import <CoreMotion/CoreMotion.h>
#import "CameraOverlayView.h"

//@class PaintScreen;

//@interface CameraOverlayViewController : GLKViewController{
@interface CameraOverlayViewController : UIViewController 
{    
//    EAGLContext *_context;    
    
    CMMotionManager *_motionManager;
    CMAttitude* _attitude;
    float _lastPitch;
    float _lastRoll;        
    float _lastYaw;         
    GLKVector3 _camDirVector;
    float _minViewAngleY;
}
@property (strong, nonatomic) IBOutlet UILabel *lblWarnig;
@property (strong, nonatomic) IBOutlet UILabel *lblYaw;
@property (strong, nonatomic) IBOutlet UILabel *lblRoll;
//@property (nonatomic, strong)EAGLContext *context;
@property (strong, nonatomic) IBOutlet UILabel *lblPitch;
@property (nonatomic, assign) GLKVector3 camDirVector;
@end
