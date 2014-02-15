//
//  MovableObject.h
//  iReporter
//
//  Created by 胡 文杰 on 13-3-30.
//  Copyright (c) 2013年 Marin Todorov. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <GLKit/GLKit.h>

@interface MovableObject : NSObject
{
    //transform
    GLKVector3 _translate;
    GLKVector3 _translateBeforePanGR;
    GLKVector3 _scale;
    GLKVector3 _rotate;
}

@property (assign, nonatomic)GLKVector3 translateBeforePanGR;
@property (assign, nonatomic)GLKVector3 translateAfterPanGR;
@property (assign, nonatomic)GLKMatrix4 worldMatrix;

-(void)updateWorldMatrix;

- (GLKVector3)rotate;

- (void)setRotate:(GLKVector3)newValue;

- (GLKVector3)scale;

- (void)setScale:(GLKVector3)newValue;

- (GLKVector3)translate;

- (void)setTranslate:(GLKVector3)newValue;
@end
