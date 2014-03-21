//
//  PNGImageStack.h
//  PaintProjector
//
//  Created by 文杰 胡 on 12-12-21.
//  Copyright (c) 2012年 Marin Todorov. All rights reserved.
//

#import "Heap.h"
#import "Ultility.h"
//maintain a png image stack on disk
@interface PNGImageStack : Heap
- (void)push:(NSString*)imageName;
- (NSString*)pop;
- (NSString*)lastUndoImage;
@end
