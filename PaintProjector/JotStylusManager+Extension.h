//
//  JotStylusManager+Extension.h
//  PaintProjector
//
//  Created by 文杰 胡 on 2/8/15.
//  Copyright (c) 2015 WenjiHu. All rights reserved.
//

#import <JotTouchSDK/JotTouchSDK.h>

@interface JotStylusManager (Extension)
-(BOOL)isJotStylusActiveTouching:(NSSet*)touches;
@end
