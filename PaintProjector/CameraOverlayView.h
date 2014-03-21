//
//  CameraOverlayView.h
//  PaintProjector
//
//  Created by 文杰 胡 on 13-2-23.
//  Copyright (c) 2013年 Marin Todorov. All rights reserved.
//

//名称: 照相前景层视图
//描述: 辅助照相，显示额外信息
//功能:

//#import <UIKit/UIKit.h>
#import <GLKit/GLKit.h>
//@interface CameraOverlayView : GLKView
@interface CameraOverlayView : UIView{
    float _shotPitch;
}
@property (assign, nonatomic) float shotPitch;
@end

