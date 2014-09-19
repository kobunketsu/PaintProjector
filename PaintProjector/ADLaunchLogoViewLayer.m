//
//  ADLaunchLogoViewLayer.m
//  PaintProjector
//
//  Created by kobunketsu on 9/18/14.
//  Copyright (c) 2014 WenjiHu. All rights reserved.
//

#import "ADLaunchLogoViewLayer.h"

@implementation ADLaunchLogoViewLayer
-(id)initWithLayer:(id)layer{
    self = [super initWithLayer:layer];
    if (self) {
        // Initialization code
        _morph = 0;
    }
    return self;
}


+ (BOOL)needsDisplayForKey:(NSString *)key{
//    DebugLogWarn(@"needsDisplayForKey %@", key);
    if ([key isEqualToString:@"morph"]) {
        return YES;
    }
    
    return [super needsDisplayForKey:key];
}
@end
