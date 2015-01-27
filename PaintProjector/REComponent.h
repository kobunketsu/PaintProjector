//
//  Component.h
//  PaintProjector
//
//  Created by 胡 文杰 on 2/3/14.
//  Copyright (c) 2014 WenjiHu. All rights reserved.
//

#import "REObject.h"

@class REAnimation;

@interface REComponent : REObject
@property (assign, nonatomic, getter = isActive) BOOL active;
@property(retain, nonatomic) REAnimation *animation;
@end
