//
//  ADShaderCylinderImage.m
//  PaintProjector
//
//  Created by 胡 文杰 on 2/1/14.
//  Copyright (c) 2014 WenjiHu. All rights reserved.
//

#import "ADShaderCylinderImage.h"

@implementation ADShaderCylinderImage
- (id)init{
    self = [super init];
    if(self){
        
        self.uniformPropertyDic = [[NSMutableDictionary alloc]init];
        
        GLuint vertShader, fragShader;
        NSString *vertShaderPathname, *fragShaderPathname;
        
        // Create shader program.
        self.program = glCreateProgram();
        
        // Create and compile vertex shader.
        vertShaderPathname = [[NSBundle mainBundle] pathForResource:@"Shaders/ShaderCylinderImage" ofType:@"vsh"];
        if (![[REGLWrapper current] compileShader:&vertShader type:GL_VERTEX_SHADER file:vertShaderPathname preDefines:nil]) {
            DebugLog(@"Failed to compile vertex shader");
            return NO;
        }
        
        // Create and compile fragment shader.
        fragShaderPathname = [[NSBundle mainBundle] pathForResource:@"Shaders/ShaderCylinderImage" ofType:@"fsh"];
        if (![[REGLWrapper current] compileShader:&fragShader type:GL_FRAGMENT_SHADER file:fragShaderPathname preDefines:nil]) {
            DebugLog(@"Failed to compile fragment shader");
            return NO;
        }
        
        // Attach vertex shader to program.
        glAttachShader(self.program, vertShader);
        
        // Attach fragment shader to program.
        glAttachShader(self.program, fragShader);
        
        // Bind attribute locations.
        // This needs to be done prior to linking.
        glBindAttribLocation(self.program, GLKVertexAttribPosition, "position");
        
        glBindAttribLocation(self.program, GLKVertexAttribTexCoord0, "texcoord");
        
//        glBindAttribLocation(self.program, GLKVertexAttribColor, "color");
        
        // Link program.
        if (![[REGLWrapper current] linkProgram:self.program]) {
            DebugLog(@"Failed to link program: %d", self.program);
            
            if (vertShader) {
                glDeleteShader(vertShader);
                vertShader = 0;
            }
            if (fragShader) {
                glDeleteShader(fragShader);
                fragShader = 0;
            }
            if (self.program) {
                glDeleteProgram(self.program);
                self.program = 0;
            }
            
            return NO;
        }
        
        // Get uniform locations.
        [self setUniformForKey:@"worldMatrix"];
        [self setUniformForKey:@"radius"];
        [self setUniformForKey:@"eye"];
        [self setUniformForKey:@"reflectionTexUVSpace"];
        [self setUniformForKey:@"reflectionTex"];
        
        // Release vertex and fragment shaders.
        if (vertShader) {
            glDetachShader(self.program, vertShader);
            glDeleteShader(vertShader);
        }
        if (fragShader) {
            glDetachShader(self.program, fragShader);
            glDeleteShader(fragShader);
        }
#if DEBUG
        glLabelObjectEXT(GL_PROGRAM_OBJECT_EXT, self.program, 0, [@"programCylinderImage" UTF8String]);
#endif
    }
    
    return  self;
}
@end
