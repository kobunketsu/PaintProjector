//
//  Material.m
//  PaintProjector
//
//  Created by 胡 文杰 on 2/1/14.
//  Copyright (c) 2014 WenjiHu. All rights reserved.
//

#import "Material.h"
#import "Resources.h"


@implementation Material
- (id)init{
    self = [super init];
    if (self) {
    }
    return self;
}

-(id)initWithShader:(Shader *)shader{
    self = [super init];
    if (self) {
        _shader = shader;
//        [Resources addObject:self];
    }
    return  self;
}

-(id)initWithEffect:(BaseEffect *)effect{
    self = [super init];
    if (self) {
        _effect = effect;
//        [Resources addObject:self];
    }
    return  self;
}

- (void)setFloat:(GLfloat)value forPropertyName:(NSString*)propertyName{
    NSNumber *num = [self.shader.uniformPropertyDic objectForKey:propertyName];
    if (num != nil) {
        glUniform1f(num.intValue, value);
    }
}

- (void)setInt:(GLint)value forPropertyName:(NSString*)propertyName{
    NSNumber *num = [self.shader.uniformPropertyDic objectForKey:propertyName];
    if (num != nil) {
        glUniform1i(num.intValue, value);
    }
}

- (void)setVector:(GLKVector4)value forPropertyName:(NSString*)propertyName{
    NSNumber *num = [self.shader.uniformPropertyDic objectForKey:propertyName];
    if (num != nil) {
        glUniform4f(num.intValue, value.x, value.y, value.z, value.w);
    }
}
    
- (void)setMatrix:(GLKMatrix4)value forPropertyName:(NSString*)propertyName{
    NSNumber *num = [self.shader.uniformPropertyDic objectForKey:propertyName];
    if (num != nil) {
        glUniformMatrix4fv(num.intValue, 1, 0, value.m);
    }
}
    
- (void)setTexture:(Texture*)texture atIndex:(GLint)index forPropertyName:(NSString*)propertyName{
    NSNumber *num = [self.shader.uniformPropertyDic objectForKey:propertyName];
    if (num != nil) {
        glUniform1i((GLint)num.intValue, index);
        GLuint textureSlot = GL_TEXTURE0 + index;
        [GLWrapper.current activeTexSlot:textureSlot bindTexture:texture.texID];
    }
}
@end
