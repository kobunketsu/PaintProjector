//
//  Layer.h
//  PaintProjector
//
//  Created by 胡 文杰 on 13-11-22.
//  Copyright (c) 2013年 WenjiHu. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface ADLayer : NSObject
{
    
}
@property (assign, nonatomic) bool dirty;
@property (assign, nonatomic) bool visible;
- (id)copyWithZone:(NSZone *)zone;
@end
