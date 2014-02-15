//
//  UndoBaseCommand.m
//  ProjectPaint
//
//  Created by 胡 文杰 on 13-6-12.
//  Copyright (c) 2013年 WenjiHu. All rights reserved.
//

#import "UndoBaseCommand.h"

@implementation UndoBaseCommand

- (UndoBaseCommand*)initWithTexture:(GLuint)texture{
    self = [super init];
    if (self!=nil) {
        _texture = texture;
    }
    
    return self;
}
-(void)execute{
    DebugLog(@"[ undoBaseCommand execute ]");
    [self.delegate willExecuteUndoBaseCommand:self];

    [super endExecute];

}
@end
