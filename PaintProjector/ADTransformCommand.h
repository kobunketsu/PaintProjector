//
//  ADTransformCommand.h
//  PaintProjector
//
//  Created by 胡 文杰 on 9/2/14.
//  Copyright (c) 2014 WenjiHu. All rights reserved.
//

#import "ADCommand.h"

@interface ADTransformCommand : ADCommand
@property (assign, nonatomic) GLKMatrix4 transformedImageMatrix;
@property (assign, nonatomic) id delegate;
@property (assign, nonatomic) BOOL isLayer;
@end


@protocol ADTransformCommandDelegate
- (void)willTransformImageWithCommand:(ADTransformCommand*)command;
@end