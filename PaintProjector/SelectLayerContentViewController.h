//
//  SelectLayerContentViewController.h
//  PaintProjector
//
//  Created by 文杰 胡 on 12-12-2.
//  Copyright (c) 2012年 Marin Todorov. All rights reserved.
//

//名称:
//描述:
//功能:

#import <UIKit/UIKit.h>
#import <GLKit/GLKit.h>
#import "ImageView.h"
#import "AdjustSceneViewController.h"
#import "AdjustImageViewController.h"
@protocol SelectLayerContentDelegate
- (void) selectLayerContent:(UIImage*)image;
@end
typedef enum {
    BG_Normal,
    BG_Scene
}BackgroundImageType;

@interface SelectLayerContentViewController : UIViewController<AdjustSceneDelegate, AdjustImageDelegate>
{
    BackgroundImageType _curBackgroundImageType;
    AdjustSceneViewController * _sceneViewController;
    AdjustImageViewController * _imageViewController;    
}
@property (assign, nonatomic) id delegate;
@property (weak, nonatomic) IBOutlet UIScrollView *imageScrollView;
- (IBAction)testButtonTapped:(UIButton *)sender;


-(void)showStream:(NSArray*)stream;
@end
