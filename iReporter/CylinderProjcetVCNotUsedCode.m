//
//  CylinderProjcetVCNotUsedCode.m
//  PaintProjector
//
//  Created by 胡 文杰 on 2/6/14.
//  Copyright (c) 2014 WenjiHu. All rights reserved.
//

#import "CylinderProjcetVCNotUsedCode.h"

@implementation CylinderProjcetVCNotUsedCode

 - (void)updateRenderViewParams1{
 //    DebugLog(@"[   setupTopViewParams  ]");
 
 //计算视图顶部观察点
 //    float fovY = DEGREES_TO_RADIANS(45);
 //    float heightFovY = self.projHeight * 0.5 / tanf(fovY * 0.5);
 //    float heightFovX = self.projWidth * 0.5 / (tanf(fovY * 0.5) * self.projSrcAspect);
 
 //TODO: bias 解决采样到边上后clamp的问题
 
 self.eyeTop = GLKVector3Make(0.0, -Camera.mainCamera.position.z, -0.065);
 //    self.eyeTop = GLKVector3Make(self.projCenter.x, MAX(heightFovX, heightFovY), self.projCenter.z);
 
 self.eyeBottom = Camera.mainCamera.position;
 
 GLKVector3 up;
 if (self.eyeBottomTopBlend >= 1.0) {
 //        up = GLKVector3Normalize(GLKVector3Subtract(self.projFar, self.projNear));
 //设备在宽屏模式下效果更佳
 up = GLKVector3Make(0, 0, 1);
 
 }
 else{
 up = GLKVector3Make(0, 0, 1);
 }
 
 //    DebugLog(@"up x:%.1f y:%.1f z:%.1f", up.x, up.y, up.z);
 
 GLKVector3 eye, focus;
 float orthoWidth, orthoHeight;
 
 //    float orthoWidth = self.projWidth;
 //    float orthoHeight = self.projHeight;
 //    if(_state == ZoomIn)
 //    {
 //        //        DebugLog(@"Magnifying _magnifyT %.2f", _magnifyT);
 //        eye = GLKVector3Lerp(_eyeTop, _eyeZoomInTop, _zoomInT);
 //        center = GLKVector3Lerp(_projCenter, _zoomInCenter, _zoomInT);
 //        orthoWidth = _projWidth * (1 - _zoomInT) + self.gridRealSize * _zoomInT;
 //        orthoHeight = _projHeight * (1 - _zoomInT) + self.gridRealSize * _zoomInT;
 //    }
 //    else if (_state == Zoomed)
 //    {
 //        //        DebugLog(@"Zoomed _magnifyT %.2f", _magnifyT);
 //        eye = _eyeZoomInTop;
 //        center = _zoomInCenter;
 //        orthoWidth = self.gridRealSize;
 //        orthoHeight = self.gridRealSize;
 //
 //    }
 //    else if(_state == ZoomOut)
 //    {
 //        //        DebugLog(@"ZoomOut _unMagnifyT %.2f", _unMagnifyT);
 //        eye = GLKVector3Lerp(_eyeZoomInTop, _eyeTop, _zoomOutT);
 //        center = GLKVector3Lerp(_zoomInCenter, _projCenter, _zoomOutT);
 //        orthoWidth =  self.gridRealSize * (1 - _zoomOutT) + _projWidth * _zoomOutT;
 //        orthoHeight =  self.gridRealSize * (1 - _zoomOutT) + _projHeight * _zoomOutT;
 //    }
 //    else if(_state == Projecting || _state == UnProjecting)
 //    {
 //        //当前观察点(在最佳观察点与顶部观察点之间lerp)
 //        eye = GLKVector3Lerp(_eye, _eyeTop, _eyeT);
 //        center = GLKVector3Lerp(_projFocus, _projCenter, _eyeT);
 //    }
 //    if(_state == CP_Projected)
 //    {
 //        eye = self.eyeTop;
 //        center = self.projCenter;
 //        orthoWidth = self.projWidth;
 //        orthoHeight = self.projHeight;
 //
 //    }
 
 
 
 //计算绘制图片的矩阵
 //    GLKMatrix4 scaleMatrix = GLKMatrix4MakeScale(self.projWidth, 1, self.projHeight);
 //    GLKMatrix4 translateMatrix = GLKMatrix4MakeTranslation(self.projCenter.x, self.projCenter.y, self.projCenter.z);
 //    GLKMatrix4 worldMatrix = GLKMatrix4Multiply(translateMatrix, scaleMatrix);
 
 //test
 eye = GLKVector3Lerp(self.eyeBottom, self.eyeTop, self.eyeBottomTopBlend);
 focus = GLKVector3Make(0.0, 0, self.eyeTop.z);
 
 //如果中心点反向，则up向量反向
 if (focus.z >= 0) {
 up.z *= -1;
 }
 //    DebugLog(@"eye x:%.1f y:%.1f z:%.1f", eye.x, eye.y, eye.z);
 //    DebugLog(@"center x:%.1f y:%.1f z:%.1f", center.x, center.y, center.z);
 
 GLKMatrix4 viewMatrix  = GLKMatrix4MakeLookAt(eye.x, eye.y, eye.z, focus.x, focus.y, focus.z, up.x, up.y, up.z);
 GLKMatrix4 projectionMatrix = GLKMatrix4MakePerspective(GLKMathDegreesToRadians(29), self.eyeTopAspect, NearClipDistance, FarClipDistance);
 
 orthoWidth = DeviceWidth;
 orthoHeight = orthoWidth / self.eyeTopAspect;
 
 //改为正交矩阵
 GLKMatrix4 projectionOrthoMatrix = GLKMatrix4MakeOrtho(-orthoWidth * 0.5, orthoWidth * 0.5, -orthoHeight * 0.5, orthoHeight * 0.5,  NearClipDistance, FarClipDistance);
 
 
 //    self.worldMatrix = worldMatrix;
 self.viewProjMatrix = GLKMatrix4Multiply(projectionMatrix, viewMatrix);
 self.viewProjOrthoMatrix = GLKMatrix4Multiply(projectionOrthoMatrix, viewMatrix);
 self.perspectiveToOrthoBlend = self.eyeBottomTopBlend;
 self.viewProjMatrix = [Ultility MatrixLerpFrom:self.viewProjMatrix to:self.viewProjOrthoMatrix blend:self.eyeBottomTopBlend];
 //    DebugLog(@"eyeTopBottomBlend %.1f", self.eyeTopBottomBlend);
 
 
 //    bool isInvertible = true;
 //    _viewProjInverseMatrix = GLKMatrix4Invert(GLKMatrix4Multiply(projectionMatrix, viewMatrix), &isInvertible);
 //通过modelViewProjection 将单位1的向量转换到projection space(-1, 1),在通过屏幕viewport，得到实际1米 * measureScale在屏幕上的Size大小
 //    if (_state == Projected) {
 //        GLKVector4 unitVec = GLKVector4Make(1.0 * self.measureScale, 0, 0, 1);//worldMatrix Identity
 //        GLKVector4 unitHVec = GLKMatrix4MultiplyVector4(projectionMatrix, GLKMatrix4MultiplyVector4(viewMatrix, unitVec));
 //        GLKVector4 unitScreenVec = GLKVector4Make(unitHVec.x / unitHVec.w, unitHVec.y / unitHVec.w, unitHVec.z / unitHVec.w, unitHVec.w / unitHVec.w);
 //        //        DebugLog(@"unitScreenVec x:%.2f y:%.2f z:%.2f w:%.2f", unitScreenVec.x, unitScreenVec.y, unitScreenVec.z, unitScreenVec.w);
 //        self.gridPointSize = (unitScreenVec.x * 0.5) * self.view.bounds.size.width;
 //        if (useFeet) {
 //            self.gridPointSize = self.gridPointSize * self.measureScale;
 //        }
 //        //        DebugLog(@"gridPointSize %.2f", self.gridPointSize);
 //    }
 
 
 //绘制cylinder上的反射图片的来源，实际为反射图片在底面上的bounds
 //reflection source的projectionMatrix 必须和 reflectionTexUVSpace 覆盖的范围一致, camera focus中心点和reflectionTexUVSpace center一致
 
 GLKVector4 reflectionTexUVSpace = GLKVector4Make(focus.x - orthoWidth * 0.5,
 focus.y - orthoHeight * 0.5 + self.eyeTop.z,
 orthoWidth,
 orthoHeight);
 GLKMatrix4 reflViewMatrix  = GLKMatrix4MakeLookAt(self.eyeTop.x, self.eyeTop.y, self.eyeTop.z, focus.x, focus.y, focus.z, up.x, up.y, up.z);
 GLKMatrix4 reflProjMatrix = GLKMatrix4MakeOrtho(-orthoWidth * 0.5, orthoWidth * 0.5, -orthoHeight * 0.5, orthoHeight * 0.5,  NearClipDistance, FarClipDistance);
 self.reflViewProjMatrix = GLKMatrix4Multiply(reflProjMatrix, reflViewMatrix);
 
 
 //更新cylinder的绘制参数
 //    [self.cylinder updateMatrixView:viewMatrix
 //                         projection:projectionMatrix
 //                    projectionOrtho:projectionOrthoMatrix
 //              perspectiveOrthoBlend:self.perspectiveToOrthoBlend
 //                                eye:eye
 //               reflectionTexUVSpace:reflectionTexUVSpace];
 
 //    [self.grid updateMatrixView:viewMatrix projection:projectionMatrix];
 }




- (void)updateProjectedQuadParams{
//投影视图视口比例
    self.projSrcAspect = fabsf(self.view.bounds.size.width / self.view.bounds.size.height);
    DebugLog(@"_aspect: %.2f", _projSrcAspect);

//顶视图视口比例
    self.eyeTopAspect = fabsf(self.projectView.bounds.size.width / self.projectView.bounds.size.height);
    DebugLog(@"_eyeTopAspect: %.2f", _eyeTopAspect);


//    //使用最远距离,最近距离作为输入参数
    float angleFar = atan2f(_eye.y, self.farDistance);
    float angleNear = atan2f(_eye.y, self.nearDistance);
    self.fovY = (angleNear - angleFar);
    float fovYHalf = self.fovY * 0.5;

    self.projNear = GLKVector3Make(0, 0, 1);
    self.projFar = GLKVector3Make(0, 0, -6);
    self.projCenter = GLKVector3Lerp(self.projNear, self.projFar, 0.5);

    float angleFocus = angleNear - fovYHalf;
    float focusDistance = _eye.y / tanf(angleFocus);
    _projFocus = GLKVector3Make(sinf(_paintViewAngleX) * focusDistance, 0, -cosf(_paintViewAngleX) * focusDistance);

//实际地面绘制长宽
    self.projHeight = self.projNear.z - self.projFar.z;
    self.projWidth = 10;

    DebugLog(@"_projHeight:%.1f", _projHeight);
    DebugLog(@"_projWith:%.1f", _projWidth);
    DebugLog(@"_projFar x:%.1f y:%.1f z:%.1f", _projFar.x, _projFar.y, _projFar.z);
    DebugLog(@"_projNear x:%.1f y:%.1f z:%.1f", _projNear.x, _projNear.y, _projNear.z);

//update UI
    self.fovYLabel.text = [NSString stringWithFormat:@"FOV: %.1f D", RADIANS_TO_DEGREES(self.fovY)];
    self.projWidthLabel.text = [NSString stringWithFormat:@"Width: %.1f M", _projWidth];
    self.projHeightLabel.text = [NSString stringWithFormat:@"Depth: %.1f M", _projHeight];
}

@end
