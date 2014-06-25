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

+(id)LoadAssetAtPath:(NSString*)assetPath ofType:(Class)aClass{
    if ([aClass isSubclassOfClass:[ModelEntity class]]) {
        //使用WaveFrontObj导入中间格式，转换成自己的格式
        if ([[[assetPath lastPathComponent]pathExtension] isEqualToString:@"obj"]) {
            __block OpenGLWaveFrontObject *obj;
#if DEBUG
                BNRTimeBlock (^{//测试运行速度
                    obj = [[OpenGLWaveFrontObject alloc]initWithPath:assetPath];
                });
#else
                    obj = [[OpenGLWaveFrontObject alloc]initWithPath:assetPath];
#endif
            
            if (obj == nil) {
                DebugLog(@"Load wavefront obj file at path %@ failed.", assetPath);
                return nil;
            }
            return [[aClass alloc]initWithWaveFrontObj:obj];
       }

        return nil;
    }
    else{
        return nil;
    }
}
@end
