//
//  ADTransformCommand.m
//  PaintProjector
//
//  Created by 胡 文杰 on 9/2/14.
//  Copyright (c) 2014 WenjiHu. All rights reserved.
//

#import "ADTransformCommand.h"

@implementation ADTransformCommand

-(void)execute{
    DebugLogFuncStart(@"execute");
    if (self.delegate) {
        [self.delegate willTransformImageWithCommand:self];
    }
}
@end
