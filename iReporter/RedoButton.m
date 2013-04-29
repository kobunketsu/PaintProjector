//
//  RedoButton.m
//  iReporter
//
//  Created by 文杰 胡 on 12-11-10.
//  Copyright (c) 2012年 Marin Todorov. All rights reserved.
//

#import "RedoButton.h"

@implementation RedoButton

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
    }
    return self;
}

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect
{
    // Drawing code
}
*/
//- (id) hitTest:(CGPoint)point withEvent:(UIEvent*)event {
//        
//}
- (BOOL)pointInside:(CGPoint)point withEvent:(UIEvent *)event{
    if(point.x > 0 && point.x < self.frame.size.width && point.y < 0 && point.y > - self.frame.size.height){
        return true;        
    }
    else {
        return false;

    }
}
@end
