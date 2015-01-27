//
//  ADLogMemUsage.h
//  PaintProjector
//
//  Created by 胡 文杰 on 8/19/14.
//  Copyright (c) 2014 WenjiHu. All rights reserved.
//

#import <Foundation/Foundation.h>

#ifdef DEBUG
#define DebugLogMem(s, ...) logMemUsage([NSString stringWithFormat:(s), ##__VA_ARGS__])
#else
#define DebugLogMem(s, ...)
#endif

void logMemUsage(NSString* message);


