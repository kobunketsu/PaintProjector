//
//  Grid.h
//  PaintProjector
//
//  Created by 胡 文杰 on 13-7-27.
//  Copyright (c) 2013年 WenjiHu. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <GLKit/GLKit.h>

typedef struct {
    float Position[3];
    //    float Color[4];
} LineVertex;

@interface ADGrid : NSObject
{
    //参考线
    GLuint _vertexLineArray;
    GLuint  _vertexLineBuffer;
    LineVertex*  _vertexLineData;
    int _lineWidthCount;    //横向宽线的数量
    int _lineHeightCount;   //纵向上线的数量
    int _lineVertexCount;         //grid顶点数量
    
    GLuint _programLine;
//    GLKMatrix4 _lineMVPMatrix;  //绘制line时的矩阵
    GLuint _modelViewProjMatrixUniform;    
}

@property (strong, nonatomic) GLKBaseEffect *effect;
@property (assign, nonatomic) int rowCount;//网格横向数量
@property (assign, nonatomic) int columnCount;//网格纵向数量
@property (assign, nonatomic) float width;//网格宽度
@property (assign, nonatomic) float height;//网格深度
@property (assign, nonatomic) float offsetY;
@property (assign, nonatomic) float measureScale;
@property (assign, nonatomic) GLKMatrix4 viewMatrix;
@property (assign, nonatomic) GLKMatrix4 projectionMatrix;

- (id)initWithRow:(int)row column:(int)column;
- (void)setupGL;
- (void)tearDownGL;
- (void)draw;
- (void)updateMatrixView:(GLKMatrix4)viewMatrix projection:(GLKMatrix4)projectionMatrix;
@end
