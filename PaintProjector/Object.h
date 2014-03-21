//
//  Object.h
//  PaintProjector
//
//  Created by 胡 文杰 on 2/3/14.
//  Copyright (c) 2014 WenjiHu. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Object : NSObject <NSCopying>
@property(assign, nonatomic)NSString *name;

+(void)destroy:(Object*)object;

-(void)destroy;

@end
