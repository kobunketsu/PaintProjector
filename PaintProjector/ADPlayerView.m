//
//  PlayerView.m
//  PaintProjector
//
//  Created by 胡 文杰 on 13-8-3.
//  Copyright (c) 2013年 WenjiHu. All rights reserved.
//

#import "ADPlayerView.h"

@implementation ADPlayerView
+ (Class)layerClass {
    return [AVPlayerLayer class];
}

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
    }
    return self;
}


- (AVPlayer*)player {
    return [(AVPlayerLayer *)[self layer] player];
}
- (void)setPlayer:(AVPlayer *)player {
    [(AVPlayerLayer *)[self layer] setPlayer:player];
}
@end