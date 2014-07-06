//
//  OpenCommand.m
//  ProjectPaint
//
//  Created by 胡 文杰 on 13-6-11.
//  Copyright (c) 2013年 WenjiHu. All rights reserved.
//

#import "ADOpenCommand.h"

@implementation ADOpenCommand

- (ADOpenCommand*)initWithTexture:(GLuint)texture{
    self = [super init];
    if (self!=nil) {
        _texture = texture;
    }
    
    return self;
}

-(void)execute{
    DebugLog(@"[ execute ]");
    [self.delegate willExecuteOpenCommand:self];
}
@end
