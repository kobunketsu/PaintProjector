//
//  Material.h
//  PaintProjector
//
//  Created by 胡 文杰 on 2/1/14.
//  Copyright (c) 2014 WenjiHu. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <GLKit/GLKit.h>
#import "Shader.h"

@interface Material : NSObject
@property (weak, nonatomic) Shader *shader;
@property (assign, nonatomic) BOOL transparent;
    
//- (void)setFloat:(GLfloat)value forPropertyId:(GLint)propertyId;
    
- (void)setFloat:(GLfloat)value forPropertyName:(NSString*)propertyName;
    
//- (void)setInt:(GLint)value forPropertyId:(GLint)propertyId;

- (void)setInt:(GLint)value forPropertyName:(NSString*)propertyName;
    
//- (void)setVector:(GLKVector4)value forPropertyId:(GLint)propertyId;
    
- (void)setVector:(GLKVector4)value forPropertyName:(NSString*)propertyName;
    
//- (void)setMatrix:(GLKMatrix4)value forPropertyId:(GLint)propertyId;
    
- (void)setMatrix:(GLKMatrix4)value forPropertyName:(NSString*)propertyName;

//- (void)setTexture:(NSString*)value forPropertyId:(GLint)propertyId;
    
- (void)setTexture:(GLint)textureSlot forPropertyName:(NSString*)propertyName;

@end
