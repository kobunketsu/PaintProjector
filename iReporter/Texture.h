//
//  Texture.h
//  PaintProjector
//
//  Created by 胡 文杰 on 2/1/14.
//  Copyright (c) 2014 WenjiHu. All rights reserved.
//

#import <GLKit/GLKit.h>
#import "Object.h"


@interface Texture : Object
{
    GLuint _texID;
}
@property (assign, nonatomic) GLuint texID;
@end
