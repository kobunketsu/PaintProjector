//
//  ShaderBrush.m
//  PaintProjector
//
//  Created by 胡 文杰 on 6/12/14.
//  Copyright (c) 2014 WenjiHu. All rights reserved.
//

#import "ShaderBrush.h"
#import "GLWrapper.h"

@implementation ShaderBrush
- (id)init{
    self = [super init];
    if(self){
        self.uniformPropertyDic = [[NSMutableDictionary alloc]init];
        
        GLuint vertShader, fragShader;
        NSString *vertShaderPathname, *fragShaderPathname;
        NSString *programBrushName = [NSString stringWithFormat:@"programBrush%@", self.class];
    
        // Create shader program.
        GLuint program = glCreateProgram();
        self.program = program;
#if DEBUG
        glLabelObjectEXT(GL_PROGRAM_OBJECT_EXT, self.program, 0, [programBrushName UTF8String]);
#endif
        
        //preprocess define
        //    if (self.brushState.isShapeTexture) {
        //        self.shaderPreDefines = [self.shaderPreDefines stringByAppendingString:@"|Pattern"];
        //    }
        //    if (self.brushState.isDissolve) {
        //        self.shaderPreDefines = [self.shaderPreDefines stringByAppendingString:@"|Dissolve"];
        //    }
        //    if (self.brushState.wet > 0) {
        //        self.shaderPreDefines = [self.shaderPreDefines stringByAppendingString:@"|Smudge"];
        //    }
        
        // Create and compile vertex shader.
        vertShaderPathname = [[NSBundle mainBundle] pathForResource:@"Shaders/ShaderBrush" ofType:@"vsh"];
        if (![[ShaderManager sharedInstance] compileShader:&vertShader type:GL_VERTEX_SHADER file:vertShaderPathname preDefines:nil]) {
            DebugLog(@"Failed to compile vertex shader");
            return nil;
        }
        
        // Create and compile fragment shader.
        fragShaderPathname = [[NSBundle mainBundle] pathForResource:@"Shaders/ShaderBrush" ofType:@"fsh"];
        if (![[ShaderManager sharedInstance] compileShader:&fragShader type:GL_FRAGMENT_SHADER file:fragShaderPathname preDefines:nil]) {
            DebugLog(@"Failed to compile fragment shader");
            return nil;
        }
        
        // Attach vertex shader to program.
        glAttachShader(program, vertShader);
        
        // Attach fragment shader to program.
        glAttachShader(program, fragShader);
        
        // Bind attribute locations.
        // This needs to be done prior to linking.
        glBindAttribLocation(program, GLKVertexAttribPosition, "Position");
        glBindAttribLocation(program, GLKVertexAttribColor, "SourceColor");
        
        // Link program.
        if (![[ShaderManager sharedInstance] linkProgram:program]) {
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
            
            return nil;
        }
        
        // Get uniform locations.
        [self setUniformForKey:@"smudgeTexture"];
        [self setUniformForKey:@"maskTexture"];
        [self setUniformForKey:@"noiseTexture"];
        [self setUniformForKey:@"Params"];
        [self setUniformForKey:@"ParamsExtend"];
        [self setUniformForKey:@"Projection"];
        
        // Release vertex and fragment shaders.
        if (vertShader) {
            glDetachShader(program, vertShader);
            glDeleteShader(vertShader);
        }
        if (fragShader) {
            glDetachShader(program, fragShader);
            glDeleteShader(fragShader);
        }
    }
    
    return self;
}


@end
