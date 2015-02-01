//
//  ADShaderCompositor.m
//  PaintProjector
//
//  Created by 文杰 胡 on 1/31/15.
//  Copyright (c) 2015 WenjiHu. All rights reserved.
//

#import "ADShaderCompositor.h"

@implementation ADShaderCompositor
- (id)initWithPredefines:(NSArray *)predefines{
    self = [super initWithPredefines:predefines];
    if(self){
        
        GLuint vertShader, fragShader;
        NSString *vertShaderPathname, *fragShaderPathname;
        
        // Create shader program.
        GLuint program = glCreateProgram();
        self.program = program;
        
        // Create and compile vertex shader.
        vertShaderPathname = [[NSBundle mainBundle] pathForResource:@"Shaders/ShaderQuad" ofType:@"vsh"];
        if (![[REGLWrapper current] compileShader:&vertShader type:GL_VERTEX_SHADER file:vertShaderPathname preDefines:nil]) {
            DebugLog(@"Failed to compile vertex shader %@", vertShaderPathname);
            return NO;
        }
        
        // Create and compile fragment shader.
        fragShaderPathname = [[NSBundle mainBundle] pathForResource:@"Shaders/ShaderQuad" ofType:@"fsh"];
        if (![[REGLWrapper current] compileShader:&fragShader type:GL_FRAGMENT_SHADER file:fragShaderPathname preDefines:nil]) {
            DebugLog(@"Failed to compile fragment shader %@", fragShaderPathname);
            return NO;
        }
        
        // Attach vertex shader to program.
        glAttachShader(program, vertShader);
        
        // Attach fragment shader to program.
        glAttachShader(program, fragShader);
        
        // Bind attribute locations.
        // This needs to be done prior to linking.
        glBindAttribLocation(program, GLKVertexAttribPosition, "Position");
        glBindAttribLocation(program, GLKVertexAttribTexCoord0, "Texcoord");
        // Link program.
        if (![[REGLWrapper current] linkProgram:program]) {
            DebugLog(@"Failed to link program: %d", program);
            
            if (vertShader) {
                glDeleteShader(vertShader);
                vertShader = 0;
            }
            if (fragShader) {
                glDeleteShader(fragShader);
                fragShader = 0;
            }
            if (program) {
                glDeleteProgram(program);
                program = 0;
            }
            
            return NO;
        }
        
        // Get uniform locations.
        [self setUniformForKey:@"texture"];
        [self setUniformForKey:@"alpha"];
        [self setUniformForKey:@"transformMatrix"];
        
        // Release vertex and fragment shaders.
        if (vertShader) {
            glDetachShader(program, vertShader);
            glDeleteShader(vertShader);
        }
        if (fragShader) {
            glDetachShader(program, fragShader);
            glDeleteShader(fragShader);
        }
        
        [self compileShaderCompleted];
        [[REGLWrapper current]useProgram:program uniformBlock:^{
            NSNumber *num = [self.uniformPropertyDic objectForKey:@"transformMatrix"];
            if (num != nil) {
                glUniformMatrix4fv(num.intValue, 1, 0, GLKMatrix4Identity.m);
            }
        }];
        
    }
    return self;
}
@end
