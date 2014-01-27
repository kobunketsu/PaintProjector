//
//  MainScreenViewController.h
//  iReporter
//
//  Created by 文杰 胡 on 13-2-5.
//  Copyright (c) 2013年 Marin Todorov. All rights reserved.
//

//名称: 主界面控制器
//描述: 用于展示画作
//功能: 打开绘图 最近更新 全局设置 广告

#import <UIKit/UIKit.h>
#import <GLKit/GLKit.h>
#import "ShaderManager.h"
#import "Ultility.h"
#import "PaintFrame.h"
#import "PaintFrameGroup.h"
#import "Camera.h"
#import "Heap.h"
@class PaintScreen;
@class PaintDocManager;

//@class PaintingView;
#define PanGRModeConfirmPixels 5
#define GestureTranslateScaleX 0.002
#define GestureTranslateScaleY 0.002
#define PinchGRMaxScaleForCameraAnim 2
#define _snapPaintFrameAnimationTime 0.3
#define _openPaintFrameAnimationTime 0.3

@protocol MainScreenViewControllerDelegate
- (void)openDoc:(PaintDoc*)paintDoc;
@end
@interface MainScreenViewController : GLKViewController

{
    EAGLContext *_context;    
    GLuint _program;        
    GLuint _vertexBuffer;
    GLuint _indexBuffer;
    GLuint _vertexArray;     

    Heap* _paintFrameGroupHeap;//画面上装载n列画集
    PaintFrameGroup* _curPaintFrameGroup;//画面上装载一列前进后出的画集            
    int _lastPaintGroupIndex;    
    int _curPaintGroupIndex;    

    NSMutableArray* _allPaintFrames;
    
    float _paintQuadWidth;
    float _paintQuadHeight;
    int _arrayRow;
    int _arrayColumn;    
//    float _curViewAngleX;
//    float _curViewAngleY;    
    Camera* _camera;
//    GLKVector3 _viewCenter;        
//    GLKVector3 _eye;    
    NSMutableArray* _worldMatrixArray;
    GLuint _worldMatrixUniform;            
    GLuint _viewProjMatrixUniform;    
    GLuint _paintTexUniform;        
    GLKTextureInfo * _floorTextureInfo;
    
    bool _isPanVertical;//前后翻页
    bool _isPanHorizonal;//左右翻组
    GLKVector3 _offsetAccumInWorld;//多次手势平移＋动画平移累计的移动值
    GLKVector3 _panOffsetInWorld;//手势平移
    GLKVector3 _panAndSnapOffsetInWorld;//手势平移+吸附动画平移的值       
    GLKVector3 _snapAnimOffsetInWorld;//吸附动画平移值
    bool _toSnapPaintFrame;
//    float _snapPaintFrameAnimationTime;
    float _curSnapPaintFrameAnimationTime;
    float _lastMediaTime;
  
    GLKVector3 _cameraPositionAnimSrc;
    GLKVector3 _cameraTargetAnimSrc;      
    GLKVector3 _cameraPositionAnimDest;
    GLKVector3 _cameraTargetAnimDest;    
    GLKVector3 _cameraPositionAnimCur;
    GLKVector3 _cameraTargetAnimCur;      
    
//    float _pinchGRMaxScaleForCameraAnim;
    float _openPaintCamAnimPinchedPer;
    float _pinchGRScaleAccum;
    float _pinchGRScaleAccumBase;  

    bool _paintFrameOpened;        
    bool _pinchGROpenOrClose;
    bool _toUpdateOpenPaintFrameAnim;
    bool _toUpdateClosePaintFrameAnim;    
    
//    float _openPaintFrameAnimationTime;    
    float _openPaintFrameAnimationTimeLeft;        
    float _closePaintFrameAnimationTimeLeft;                
    float _curOpenPaintFrameAnimationTime;
    float _curClosePaintFrameAnimationTime;       
    
    
    //图片集
    NSString* _plistPath;

    NSMutableArray* _paintDocs;
}
@property (weak, nonatomic)PaintScreen* paintScreenViewController;
@property (strong, nonatomic)EAGLContext *context;
@property(assign, nonatomic) id delegate;
- (IBAction)handlePanGRMainScreenView:(UIPanGestureRecognizer *)sender;
- (IBAction)handlePinchGRMainScreenView:(UIPinchGestureRecognizer *)sender;
- (IBAction)openButtonTapped:(UIButton *)sender;
- (void)showStream:(NSArray*)stream;
@end
