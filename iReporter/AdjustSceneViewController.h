//
//  AdjustSceneViewController.h
//  iReporter
//
//  Created by 文杰 胡 on 13-2-2.
//  Copyright (c) 2013年 Marin Todorov. All rights reserved.
//

//名称:
//描述:
//功能:

#import <GLKit/GLKit.h>
#import "Ultility.h"
#import "ShaderUltility.h"
#import "TextureManager.h"
@protocol AdjustSceneDelegate
- (void) adjustSceneDone:(UIImage*)image;
- (void) adjustSceneViewControllerDismissed;
@end
@interface AdjustSceneViewController : GLKViewController
{
    EAGLContext *_context;
    GLuint _vertexBuffer;
    GLuint _indexBuffer;
    GLuint _vertexArray;    
    float _rotation;
    float _curViewAngleX;
    float _curViewAngleY;
    float _lastViewAngleX;    
    float _lastViewAngleY;
    float _maxViewAngleX;
    float _minViewAngleY;
    float _paintViewAngleX;
    float _paintViewAngleY;    
    GLKVector3 _eye;
    float realHeight;
    float realWidth;    
    float _eyeToViewCenterDistanceZ;
    float _eyeToPaintViewCenterDistanceZ; 
    GLKMatrix4 _modelViewProjectionMatrix;
    GLKMatrix4 _saveTextureMVPMatrix;//用来记录拉伸texture的    
    GLKMatrix4 _paintMVPMatrix;//用来记录拉伸texture的        
    GLKTextureInfo * _floorTextureInfo;
    GLKTextureInfo* _paintTextureInfo;    
    //    GLKTextureInfo * _photoTextureInfo;    
    GLuint _modelViewProjMatrixUniform;
    GLuint _baseTextureUniform;    
    GLuint _baseTexScaleUniform;        
    GLuint _paintTextureUniform;
    GLuint _paintTexScaleUniform;    
    GLuint _paintMVPMatrixUniform;    
    GLuint _program;
    BOOL _isPaintMode;
    BOOL _paintViewConfirmed;
    float _kHeightScale;
    float _kWidthScale;    
    //save texture render buffer
    GLuint _storeFramebuffer;
    GLuint _storeRenderbuffer;
    UIImage* _paintImageOnPlane;     
    

}
@property (nonatomic, strong)EAGLContext *context;
- (IBAction)handlePanGRAdjustSceneView:(UIPanGestureRecognizer *)sender;
- (IBAction)adjustDoneButtonTapped:(UIButton *)sender;
@property (strong, nonatomic) IBOutlet UIButton *adjustDoneButton;
@property (nonatomic, assign) id delegate;
@end
