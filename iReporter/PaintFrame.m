//
//  PaintFrame.m
//  iReporter
//
//  Created by 文杰 胡 on 13-2-6.
//  Copyright (c) 2013年 Marin Todorov. All rights reserved.
//

#import "PaintFrame.h"
#import "PaintDoc.h"

@implementation PaintFrame
@synthesize paintTexture = _paintTexture;
@synthesize paintDoc = _paintDoc;
@synthesize name = _name;
//不能在paintFrame内release paintDoc
-(id)initWithContext:(EAGLContext*)context paintDoc:(PaintDoc*)paintDoc{
    self = [super init];
    if (self !=nil) {
        _context = context;
        _paintDoc = paintDoc;
        if (paintDoc==nil) {
            _name = @"";
        }
        else{
            _name = paintDoc.data.title;
        }

    }
    return self;
}

//在paintFrame内release paintDoc
//-(id)initWithContext:(EAGLContext*)context docPath:(NSString*)docPath{
//    self = [super init];
//    if (self !=nil) {
//        _context = context;
//        _paintDoc = [[PaintDoc alloc]initWithDocPath:docPath];
//    }
//    return self;
//}


//显示缩略图
-(void)loadForDisplay:(BOOL)reload{
    [EAGLContext setCurrentContext:_context];
    GLKTextureInfo* paintTexInfo;
    NSString* imageName;
    if (_paintDoc == NULL)
    {
        imageName = @"blackboard.jpg";
    }
    else
    {
        imageName = _paintDoc.thumbImagePath;
    }
    
    paintTexInfo = [[TextureManager sharedInstance] loadTextureInfoFromImageName:imageName reload:reload];
    if(paintTexInfo != NULL){
        _paintTexture = paintTexInfo.name;
        NSLog(@"PaintFrame:%@ loadForDisplay _paintTexture %d image:%@ success", _name, paintTexInfo.name, imageName);
    }
    else{
        _paintTexture = 0;
        NSLog(@"PaintFrame:%@ loadForDisplay _paintTexture %@ failed", _name, imageName);
    }
}


@end
