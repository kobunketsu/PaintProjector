//
//  PaintFrame.h
//  iReporter
//
//  Created by 文杰 胡 on 13-2-6.
//  Copyright (c) 2013年 Marin Todorov. All rights reserved.
//

//名称: 画框
//描述: 用于显示画
//功能: 包裹文件，在主界面显示PaintFrame时加载PaintDoc 在打开时解压PaintData内容

#import <Foundation/Foundation.h>
#import "Ultility.h"
#import "TextureManager.h"
#import "MovableObject.h"
@class PaintDoc;

@interface PaintFrame : MovableObject
{
}
@property(nonatomic, weak)EAGLContext* context;    //绘制context
@property(nonatomic, weak)PaintDoc* paintDoc;
@property(nonatomic, retain)NSString* name;
@property(nonatomic, assign)GLuint paintTexture;

//New:用文件路径初始化PaintDoc(内容不载入)
-(id)initWithContext:(EAGLContext*)context paintDoc:(PaintDoc*)paintDoc;
-(id)initWithContext:(EAGLContext*)context docPath:(NSString*)docPath;
//Old:
-(id)initWithContext:(EAGLContext*)context Data:(NSDictionary*)data;
-(id)initWithContext:(EAGLContext*)context paintImagePath:(NSString*)paintImagePath;
-(void)loadForDisplay:(BOOL)reload;


@end
