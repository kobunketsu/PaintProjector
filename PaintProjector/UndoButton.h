//
//  UndoButton.h
//  PaintProjector
//
//  Created by 文杰 胡 on 12-11-6.
//  Copyright (c) 2012年 Marin Todorov. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "AutoRotateButton.h"

@interface UndoButton : AutoRotateButton
{
}
@property (assign, nonatomic)CGPoint touchPoint;
@end
