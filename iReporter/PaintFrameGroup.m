//
//  PaintFrameGroup.m
//  iReporter
//
//  Created by 文杰 胡 on 13-2-18.
//  Copyright (c) 2013年 Marin Todorov. All rights reserved.
//

#import "PaintFrameGroup.h"

@implementation PaintFrameGroup

@synthesize name = _name;
@synthesize dirPath = _dirPath;
@synthesize paintDocs = _paintDocs;
@synthesize paintFrameHeap = _paintFrameHeap;
@synthesize lastPaintIndex = _lastPaintIndex;
@synthesize curPaintIndex = _curPaintIndex;
@synthesize curPaintFrame = _curPaintFrame;

-(id) initWithCapacity:(int)capacity{
    self = [super init];
    if(self!=NULL){
        _paintFrameHeap = [[Heap alloc] initWithCapacity:capacity];
        _paintDocs = [[NSMutableArray alloc]init];
    }
    return self;
}

- (void)moveToPaintIndex:(float)movedCount{
    _curPaintIndex = _lastPaintIndex + movedCount;
    if (_curPaintIndex<0) {
        _curPaintIndex = _paintDocs.count + _curPaintIndex;
    }
    else if(_curPaintIndex > _paintDocs.count-1){
        _curPaintIndex = _curPaintIndex - _paintDocs.count;
    }
    
    _lastPaintIndex = _curPaintIndex;
    NSLog(@"_curPaintFrameIndex:%d", _curPaintIndex);    
    

}

-(void)push:(PaintFrame*)pf{
    [_paintFrameHeap push:pf];
}

-(void)push_reverse:(PaintFrame*)pf{
    [_paintFrameHeap push_reverse:pf];
}
@end
