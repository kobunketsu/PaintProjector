//
//  UndoStack.h
//  PaintProjector
//
//  Created by 文杰 胡 on 12-11-7.
//  Copyright (c) 2012年 Hu Wenjie. All rights reserved.
//

#import "ADHeap.h"
#import "ADUltility.h"
@interface ADImageStack : ADHeap
{
    
}
- (void)push:(CGImageRef)image;
- (CGImageRef)pop;
- (CGImageRef)lastUndoImage;
@end
