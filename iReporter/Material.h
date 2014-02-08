//
//  Material.h
//  PaintProjector
//
//  Created by 胡 文杰 on 2/1/14.
//  Copyright (c) 2014 WenjiHu. All rights reserved.
//

#import <GLKit/GLKit.h>
#import "GLWrapper.h"
#import "Object.h"
#import "Shader.h"
#import "BaseEffect.h"
#import "Texture.h"

@interface Material : Object
@property (weak, nonatomic) Shader *shader;
@property (weak, nonatomic) BaseEffect *effect;
@property (weak, nonatomic) Texture *mainTexture;
@property (assign, nonatomic) BOOL transparent;

-(id)initWithShader:(Shader *)shader;

-(id)initWithEffect:(BaseEffect *)effect;

//- (void)setFloat:(GLfloat)value forPropertyId:(GLint)propertyId;
    
- (void)setFloat:(GLfloat)value forPropertyName:(NSString*)propertyName;
    
//- (void)setInt:(GLint)value forPropertyId:(GLint)propertyId;

- (void)setInt:(GLint)value forPropertyName:(NSString*)propertyName;
    
//- (void)setVector:(GLKVector4)value forPropertyId:(GLint)propertyId;
    
- (void)setVector:(GLKVector4)value forPropertyName:(NSString*)propertyName;
    
//- (void)setMatrix:(GLKMatrix4)value forPropertyId:(GLint)propertyId;
    
- (void)setMatrix:(GLKMatrix4)value forPropertyName:(NSString*)propertyName;

//- (void)setTexture:(NSString*)value forPropertyId:(GLint)propertyId;
    
- (void)setTexture:(Texture*)texture atIndex:(GLint)index forPropertyName:(NSString*)propertyName;

@end
