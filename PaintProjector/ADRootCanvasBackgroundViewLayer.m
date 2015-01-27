//
//  ADRootCanvasBackgroundViewLayer.m
//  PaintProjector
//
//  Created by kobunketsu on 9/21/14.
//  Copyright (c) 2014 WenjiHu. All rights reserved.
//

#import "ADRootCanvasBackgroundViewLayer.h"

@implementation ADRootCanvasBackgroundViewLayer
-(id)initWithLayer:(id)layer{
    self = [super initWithLayer:layer];
    if (self) {
        // Initialization code
        _blend = 0;
    }
    return self;
}

+ (BOOL)needsDisplayForKey:(NSString *)key{
    //    DebugLogWarn(@"needsDisplayForKey %@", key);
    if ([key isEqualToString:@"blend"]) {
        return YES;
    }
    
    return [super needsDisplayForKey:key];
}
@end
