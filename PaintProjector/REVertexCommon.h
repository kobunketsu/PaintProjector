//
//  VertexCommon.h
//  PaintProjector
//
//  Created by 胡 文杰 on 5/4/14.
//  Copyright (c) 2014 WenjiHu. All rights reserved.
//

#import <Foundation/Foundation.h>

typedef struct {
    float Position[3];
    float Texcoord[2];
} SimpleVertex;

typedef struct {
    float Position[3];
    float Texcoord[2];
    float Color[4];
} Vertex;

typedef struct {
    float Position[3];
    float Texcoord[2];
    float Normal[3];
} OBJVertex;

typedef NS_ENUM(NSInteger, VertexAttributes) {
    Vertex_Position        = 1 <<  0,
    Vertex_Texcoord        = 1 <<  1,
    Vertex_Normal          = 1 <<  2,
    Vertex_Color           = 1 <<  3,
};

@interface REVertexCommon : NSObject

@end
