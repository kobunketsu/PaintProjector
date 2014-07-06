//
//  Material.h
//  PaintProjector
//
//  Created by 胡 文杰 on 2/1/14.
//  Copyright (c) 2014 WenjiHu. All rights reserved.
//

#import <GLKit/GLKit.h>
#import "REGLWrapper.h"
#import "REObject.h"
#import "REShader.h"
//#import "BaseEffect.h"
#import "RETexture.h"

@interface REMaterial : REObject
@property (weak, nonatomic) REShader *shader;
//@property (weak, nonatomic) BaseEffect *effect;
@property (weak, nonatomic) RETexture *mainTexture;
@property (assign, nonatomic) BOOL transparent;

-(id)initWithShader:(REShader *)shader;

//-(id)initWithEffect:(BaseEffect *)effect;

//- (void)setFloat:(GLfloat)value forPropertyId:(GLint)propertyId;
    
- (void)setFloat:(GLfloat)value forPropertyName:(NSString*)propertyName;
    
//- (void)setInt:(GLint)value forPropertyId:(GLint)propertyId;

- (void)setInt:(GLint)value forPropertyName:(NSString*)propertyName;
    
//- (void)setVector:(GLKVector4)value forPropertyId:(GLint)propertyId;
    
- (void)setVector:(GLKVector4)value forPropertyName:(NSString*)propertyName;
    
//- (void)setMatrix:(GLKMatrix4)value forPropertyId:(GLint)propertyId;
    
- (void)setMatrix:(GLKMatrix4)value forPropertyName:(NSString*)propertyName;

//- (void)setTexture:(NSString*)value forPropertyId:(GLint)propertyId;
    
- (void)setTexture:(RETexture*)texture atIndex:(GLint)index forPropertyName:(NSString*)propertyName;

@end
