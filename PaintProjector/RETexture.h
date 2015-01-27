//
//  Texture.h
//  PaintProjector
//
//  Created by 胡 文杰 on 2/1/14.
//  Copyright (c) 2014 WenjiHu. All rights reserved.
//

#import <GLKit/GLKit.h>
#import "REObject.h"
#import "REGLWrapper.h"

@interface RETexture : REObject
{
}
@property (assign, nonatomic) GLuint texID;
@property (assign, nonatomic) size_t width;
@property (assign, nonatomic) size_t height;

+(id)textureFromImagePath:(NSString*)imagePath reload:(BOOL)reload;
+(id)textureFromImageName:(NSString*)imageName reload:(BOOL)reload;
+(id)textureFromData:(NSData*)data name:(NSString*)name;
+(id)textureFromUIImage:(UIImage*)image name:(NSString*)name;
@end
