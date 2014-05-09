//
//  AssetDatabase.m
//  PaintProjector
//
//  Created by kobunketsu on 14-5-4.
//  Copyright (c) 2014年 WenjiHu. All rights reserved.
//

#import "AssetDatabase.h"
#import "OpenGLWaveFrontObject.h"
#import "ModelEntity.h"

@implementation AssetDatabase

+(Object*)LoadAssetAtPath:(NSString*)assetPath ofType:(Class)aClass{
    if ([[aClass description] isEqualToString:@"Entity"]) {
        Entity *entity = nil;
        
        //使用WaveFrontObj导入中间格式，转换成自己的格式
        if ([[[assetPath lastPathComponent]pathExtension] isEqualToString:@"obj"]) {
            __block OpenGLWaveFrontObject *obj;
                BNRTimeBlock (^{//测试运行速度
                    obj = [[OpenGLWaveFrontObject alloc]initWithPath:assetPath];
                });
            
            if (obj == nil) {
                DebugLog(@"Load wavefront obj file at path %@ failed.", assetPath);
                return nil;
            }
            
            entity = [[ModelEntity alloc]initWithWaveFrontObj:obj];
       }

        return entity;
    }
    else{
        return nil;
    }
}
@end
