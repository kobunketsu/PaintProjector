//
//  PaintFrame.m
//  PaintProjector
//
//  Created by 文杰 胡 on 13-2-6.
//  Copyright (c) 2013年 Marin Todorov. All rights reserved.
//

#import "PaintFrame.h"
#import "PaintDoc.h"

@implementation PaintFrame

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
//        self.paintDoc = [[PaintDoc alloc]initWithDocPath:docPath];
//    }
//    return self;
//}


//显示缩略图
-(void)loadForDisplay:(BOOL)reload{
//texMgr not set
//
//    [EAGLContext setCurrentContext:self.context];
//    GLKTextureInfo* paintTexInfo;
//    NSString* imageName;
//    if (self.paintDoc == NULL)
//    {
//        imageName = @"blackboard.jpg";
//    }
//    else
//    {
//        imageName = self.paintDoc.thumbImagePath;
//    }
//    
//    paintTexInfo = [[TextureManager sharedInstance] loadTextureInfoFromImageName:imageName reload:reload];
//    if(paintTexInfo != NULL){
//        _paintTexture = paintTexInfo.name;
//        DebugLog(@"%@ loadForDisplay _paintTexture %d image:%@ success", _name, paintTexInfo.name, imageName);
//    }
//    else{
//        _paintTexture = 0;
//        DebugLog(@"%@ loadForDisplay _paintTexture %@ failed", _name, imageName);
//    }
}


@end
